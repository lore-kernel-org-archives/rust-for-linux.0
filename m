Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D137B00C;
	Mon,  4 May 2026 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777932093; cv=none; b=dyJ6X35C+7/H0kjwV+QRWfeV9AMOnCsOPrt9WEaULim5yhDI+kwpUVJrU85X14lX/GCt8iBfd8GWLXMjq+3aPeLxCA8Pmryu3Q+eVp+XKVDQohwJRVorrK2STWkM3edrVtl3pIwK355WwdFdzolkDi0H0mFEz7IHgenYADzeLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777932093; c=relaxed/simple;
	bh=mIVWh6aA5+YxG3cqaiYTOTzLLn2sfP3uAa6dInX0q+U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=UNySc6z5PbmszZ14U5lKfQDPy2BB+ARxVneqbN/M1MakRYPIVcH+U+nz+qTIL7qMOemUIsIa4rc2Q8tbDsYrwr4GkA2ZzLjyBJ+PRZ8Bo6ssQRLrqqYNe0ZfHwztDDvNJDYcpOMBdMdprJQX76EAytGPaNfDF4Wt6gydMIpeNv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6qTvK8Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6qTvK8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA28C2BCB9;
	Mon,  4 May 2026 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777932093;
	bh=mIVWh6aA5+YxG3cqaiYTOTzLLn2sfP3uAa6dInX0q+U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=R6qTvK8ZX3AXObOJLxcNdO3jGBsFI69569CbH4Q5guVttJOpxcJOFtKGiojD75JXY
	 i9kgCE4h6AZae6oR1KL6pb8mgEiZDmzdCjN0zwbTFXrQA+wkMf4LXQpyv//41utEwt
	 hio+hqkIJxTyTlhW99pM0apaJS75ItAUogl9I1H45R1kJVsix4Cp7zvIhe5FW/5Q60
	 Q7nnGCNI+c66xh1mzIC5SZVRVy6Ezve2SY88taKBdSQyY70O/pNyXLOSA/w1v9bcjO
	 9f6TeRWt1gUWEf9XoECM8xKcLFTG1EoOOmYzQtGYL0Cn3JXaCZoSYv6YjMXdbmnwcc
	 CFppNmAoy8Txw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/2] scripts: generate_rust_analyzer.py: add
 versioning infrastructure
From: Tamir Duberstein <tamird@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504-ra-fix-primitive-v6-1-74cfc1e862d0@gmail.com>
References: <20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com>
 <20260504-ra-fix-primitive-v6-1-74cfc1e862d0@gmail.com>
Date: Mon, 04 May 2026 18:01:25 -0400
Message-Id: <177793208554.80529.7376377202991122733.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mIVWh6aA5+YxG3cqaiYTOTzLLn2sfP3uAa6dInX0q+U=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJk/xS0sN0T0ZGza28Z4blvfmoOtdl0+Mg9S012nu9TV1
 e/keb+2YyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFRXKDIytFtGXX3Av1spKVv2yaYPasrzAmVqw1jnBTd/W26kbtP3iuG/O1+Shdz
 EnYt7o1kU1Ve+tesN+qVzi3Gy+mzeYP5C204GAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Mon, 04 May 2026 22:20:59 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index d5f9a0ca742c..934698c7eb95 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -343,6 +346,153 @@ def generate_crates(
> [ ... skip 46 lines ... ]
> +    #        git -C ./rust-analyzer describe --tags --abbrev=0 "$hash"
> +    #      )
> +    #
> +    #      link_prefix="https://github.com/rust-lang/rust-analyzer/releases/tag"
> +    #      echo "$link_prefix/$tag_predates"
> +    #      ```

I think we talked about this being a bit more defensive with (at least)
set -eu. How's this?

  #!/usr/bin/env bash
  
  set -euo pipefail
  
  RUST_VERSION=$1
  
  grep_args=()
  while IFS= read -r subject; do
    grep_args+=(--grep "$subject")
  done < <(git -C rust log \
      --fixed-strings \
      --format='%s' \
      --grep 'Merge pull request #' \
      --merges \
      --no-follow \
      -n 10 \
      "$RUST_VERSION" \
      -- src/tools/rust-analyzer
  )
  
  tag_predates=$(
    git -C rust-analyzer log \
      --fixed-strings \
      --format='%(describe:tags,abbrev=0)' \
      --merges \
      -n 1 \
      "${grep_args[@]}"
  )
  
  link_prefix="https://github.com/rust-lang/rust-analyzer/releases/tag"
  echo "$link_prefix/$tag_predates"

Note I added `--merges` in the first `git log`, inlined `LOOKAHEAD` (and
reduced it to 10, now that it's only merge commits), and replaced piping
into grep with `--grep`. The second and third `git log` commands are
combined.

> [ ... skip 60 lines ... ]
> +        return ra_version_output
> +    except FileNotFoundError:
> +        return None
> +
> +def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo:
> +    baselines = reversed(RaVersionInfo)

This is an iterator but it's possible for both `version_match` and
`date_match` to use it, which means the latter will observe an empty
iterator.

-- 
Tamir Duberstein <tamird@kernel.org>
