defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    Regex.scan(~r{...}, rna)
    |> of_rna([])
  end

  defp of_rna([], acc) do
    {:ok, Enum.reverse(acc)}
  end

  defp of_rna([[codon] | rest], acc) do
    case of_codon(codon) do
      {:ok, "STOP"} -> {:ok, Enum.reverse(acc)}
      {:ok, protein} -> of_rna(rest, [protein] ++ acc)
      {:error, _} -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(_codon = "UGU"), do: {:ok, "Cysteine"}
  def of_codon(_codon = "UGC"), do: {:ok, "Cysteine"}
  def of_codon(_codon = "UUA"), do: {:ok, "Leucine"}
  def of_codon(_codon = "UUG"), do: {:ok, "Leucine"}
  def of_codon(_codon = "AUG"), do: {:ok, "Methionine"}
  def of_codon(_codon = "UUU"), do: {:ok, "Phenylalanine"}
  def of_codon(_codon = "UUC"), do: {:ok, "Phenylalanine"}
  def of_codon(_codon = "UCU"), do: {:ok, "Serine"}
  def of_codon(_codon = "UCC"), do: {:ok, "Serine"}
  def of_codon(_codon = "UCA"), do: {:ok, "Serine"}
  def of_codon(_codon = "UCG"), do: {:ok, "Serine"}
  def of_codon(_codon = "UGG"), do: {:ok, "Tryptophan"}
  def of_codon(_codon = "UAU"), do: {:ok, "Tyrosine"}
  def of_codon(_codon = "UAC"), do: {:ok, "Tyrosine"}
  def of_codon(_codon = "UAA"), do: {:ok, "STOP"}
  def of_codon(_codon = "UAG"), do: {:ok, "STOP"}
  def of_codon(_codon = "UGA"), do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
