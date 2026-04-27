Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB9302767;
	Mon, 27 Apr 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300730; cv=none; b=b+XRoJaszO6DGZgw/+fhhP5O/XqxXEmbQFTfUK1VUq+6FDOG7N8UQUxwFeDkrtlk7yZLhLjAB3t1CPHiA/T2mTJgCNfub6FL0Wr6tntyFc8CppKCWIp4pvUB1JpbDTeL/t90XFWUVyYfTsjZUo6uAzQ/J5pKHCgqD87hB1qEwMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300730; c=relaxed/simple;
	bh=htTVWM9ngPJ60lrPtile5i9hrmT0UQpydjcPBG3l7CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcPos6N2XqNAbHZNx8RGOzNnlykw9cfhezpdCw7273LULV02S0TCtYQx4Ekra8vaBIH5xFq3yJz9x4ojpCcAshHzGCBxq/JVpWcEuNciCgExR4p+JvBI5nNY6sZrqnPe8o8XOrGoGN0o/7VUTxWMa8TUV4oqPTjtGoa9wFYdcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 3A7ABF4083E; Mon, 27 Apr 2026 16:38:38 +0200 (CEST)
Date: Mon, 27 Apr 2026 16:38:37 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce import noise
Message-ID: <ae907fWOUEoIl18K@luna>
References: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
Jabber-ID: linkmauve@linkmauve.fr

Hi Tamir,

On Mon, Apr 27, 2026 at 10:23:44AM -0400, Tamir Duberstein wrote:
> Use `import typing as t` to avoid having to list each imported symbol
> whenever it is added.

This isn’t really idiomatic Python though, every other Python project
I’ve worked on listed all types they import from typing the way this was
done previously.

I think the reasoning is that it’s more important to keep the location
directly in the code more readable, at the cost of making the import
lines slightly longer.

But if this is a regular kernel practice, please disregard my comment!

> 
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 68 +++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index d5f9a0ca742c..c61e76cb40a1 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -10,15 +10,15 @@ import os
>  import pathlib
>  import subprocess
>  import sys
> -from typing import Dict, Iterable, List, Literal, Optional, TypedDict
> +import typing as t
>  
> -def invoke_rustc(args: List[str]) -> str:
> +def invoke_rustc(args: t.List[str]) -> str:
>      return subprocess.check_output(
>          [os.environ["RUSTC"]] + args,
>          stdin=subprocess.DEVNULL,
>      ).decode('utf-8').strip()
>  
> -def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
> +def args_crates_cfgs(cfgs: t.List[str]) -> t.Dict[str, t.List[str]]:
>      crates_cfgs = {}
>      for cfg in cfgs:
>          crate, vals = cfg.split("=", 1)
> @@ -26,28 +26,28 @@ def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
>  
>      return crates_cfgs
>  
> -class Dependency(TypedDict):
> +class Dependency(t.TypedDict):
>      crate: int
>      name: str
>  
>  
> -class Source(TypedDict):
> -    include_dirs: List[str]
> -    exclude_dirs: List[str]
> +class Source(t.TypedDict):
> +    include_dirs: t.List[str]
> +    exclude_dirs: t.List[str]
>  
>  
> -class Crate(TypedDict):
> +class Crate(t.TypedDict):
>      display_name: str
>      root_module: str
>      is_workspace_member: bool
> -    deps: List[Dependency]
> -    cfg: List[str]
> +    deps: t.List[Dependency]
> +    cfg: t.List[str]
>      edition: str
> -    env: Dict[str, str]
> +    env: t.Dict[str, str]
>  
>  
>  class ProcMacroCrate(Crate):
> -    is_proc_macro: Literal[True]
> +    is_proc_macro: t.Literal[True]
>      proc_macro_dylib_path: str  # `pathlib.Path` is not JSON serializable.
>  
>  
> @@ -59,10 +59,10 @@ def generate_crates(
>      srctree: pathlib.Path,
>      objtree: pathlib.Path,
>      sysroot_src: pathlib.Path,
> -    external_src: Optional[pathlib.Path],
> -    cfgs: List[str],
> +    external_src: t.Optional[pathlib.Path],
> +    cfgs: t.List[str],
>      core_edition: str,
> -) -> List[Crate]:
> +) -> t.List[Crate]:
>      # Generate the configuration list.
>      generated_cfg = []
>      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> @@ -72,7 +72,7 @@ def generate_crates(
>              generated_cfg.append(line)
>  
>      # Now fill the crates list.
> -    crates: List[Crate] = []
> +    crates: t.List[Crate] = []
>      crates_cfgs = args_crates_cfgs(cfgs)
>  
>      def get_crate_name(path: pathlib.Path) -> str:
> @@ -81,11 +81,11 @@ def generate_crates(
>      def build_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> -        deps: List[Dependency],
> +        deps: t.List[Dependency],
>          *,
> -        cfg: Optional[List[str]],
> -        is_workspace_member: Optional[bool],
> -        edition: Optional[str],
> +        cfg: t.Optional[t.List[str]],
> +        is_workspace_member: t.Optional[bool],
> +        edition: t.Optional[str],
>      ) -> Crate:
>          cfg = cfg if cfg is not None else crates_cfgs.get(display_name, [])
>          is_workspace_member = (
> @@ -107,11 +107,11 @@ def generate_crates(
>      def append_proc_macro_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> -        deps: List[Dependency],
> +        deps: t.List[Dependency],
>          *,
> -        cfg: Optional[List[str]] = None,
> -        is_workspace_member: Optional[bool] = None,
> -        edition: Optional[str] = None,
> +        cfg: t.Optional[t.List[str]] = None,
> +        is_workspace_member: t.Optional[bool] = None,
> +        edition: t.Optional[str] = None,
>      ) -> Dependency:
>          crate = build_crate(
>              display_name,
> @@ -145,11 +145,11 @@ def generate_crates(
>      def append_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> -        deps: List[Dependency],
> +        deps: t.List[Dependency],
>          *,
> -        cfg: Optional[List[str]] = None,
> -        is_workspace_member: Optional[bool] = None,
> -        edition: Optional[str] = None,
> +        cfg: t.Optional[t.List[str]] = None,
> +        is_workspace_member: t.Optional[bool] = None,
> +        edition: t.Optional[str] = None,
>      ) -> Dependency:
>          return register_crate(
>              build_crate(
> @@ -164,9 +164,9 @@ def generate_crates(
>  
>      def append_sysroot_crate(
>          display_name: str,
> -        deps: List[Dependency],
> +        deps: t.List[Dependency],
>          *,
> -        cfg: Optional[List[str]] = None,
> +        cfg: t.Optional[t.List[str]] = None,
>      ) -> Dependency:
>          return append_crate(
>              display_name,
> @@ -266,7 +266,7 @@ def generate_crates(
>  
>      def append_crate_with_generated(
>          display_name: str,
> -        deps: List[Dependency],
> +        deps: t.List[Dependency],
>      ) -> Dependency:
>          crate = build_crate(
>              display_name,
> @@ -317,7 +317,7 @@ def generate_crates(
>      # Then, the rest outside of `rust/`.
>      #
>      # We explicitly mention the top-level folders we want to cover.
> -    extra_dirs: Iterable[pathlib.Path] = (
> +    extra_dirs: t.Iterable[pathlib.Path] = (
>          srctree / dir for dir in ("samples", "drivers")
>      )
>      if external_src is not None:
> @@ -356,12 +356,12 @@ def main() -> None:
>  
>      class Args(argparse.Namespace):
>          verbose: bool
> -        cfgs: List[str]
> +        cfgs: t.List[str]
>          srctree: pathlib.Path
>          objtree: pathlib.Path
>          sysroot: pathlib.Path
>          sysroot_src: pathlib.Path
> -        exttree: Optional[pathlib.Path]
> +        exttree: t.Optional[pathlib.Path]
>          core_edition: str
>  
>      args = parser.parse_args(namespace=Args())
> 
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260427-rust-analyzer-import-typing-as-t-6388452ba855
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@kernel.org>
> 
> 

-- 
Link Mauve
