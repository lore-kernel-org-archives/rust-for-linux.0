Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E557358372;
	Thu,  7 May 2026 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170707; cv=none; b=ayiQvhEFBNN4oN5P8SaInywkj/fgJfC+p3d4ICH5D6381vIEkbpJJBqLvoyBjXqNvRPqv3+yJ12uC4ibiAZDtN32TcF0/Ya6LHEngeHPsrgNdyUR7/9SvX00fghRKHFqWjm2vISEo8ZYWW+20hu4Oo2LBJqYrRBZedVENngqTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170707; c=relaxed/simple;
	bh=Kr5e8szEE7rVgQx/AkFU1vCQbRE+JxMdczYFbyXk3PY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kEJFzuX7P4MloUHwozrxT5DdOlQ3C8C/jmINse1sZSCbvN1aajxbsad6BM2JTlSAuYNJAd4ajsgBXTp7xESgUxIqxurmKkYR22viXbFG5GmeVsAR2czy1v+OiyujOtiXsYoAgJHnQqUUUcGeO5/LxvkntnaFS2QxWBVyW0zzXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjkWVNgN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjkWVNgN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0C5C2BCB8;
	Thu,  7 May 2026 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170707;
	bh=Kr5e8szEE7rVgQx/AkFU1vCQbRE+JxMdczYFbyXk3PY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=YjkWVNgNV8LCRAtrccXRW6J7BUOHcBH0+9TkpQYcq97WxwVDAq7l8N7tshfHgAk/z
	 emeyGF9aOgijqBz/rtioQdvUCndB0WBYEo9tA5D2z4pcNeScX+A4YmQbHew7Jy9o8t
	 WaIGPNQXFNZP9wTckN+9wYuEOUKWg7Oha4TD7xJUjAl3QmgT1iqzKmOh71S+w8iR8b
	 2MiBtgUszbLFWs1B2eBSIjyykvaXcAmW+GS+R+NjPKXilvrBmN+ol1LvSXNaNv8yE3
	 F9+843+O02nAYl1Deck6pfDZFdhmrTaae7m7tUm0ZsSG5KD8KUbiH4T8jjPjjQcc9V
	 rRh1lqPvQwaaw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 1/2] scripts: generate_rust_analyzer.py: add
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
In-Reply-To: <20260507-ra-fix-primitive-v7-1-cb8e3791f2b5@gmail.com>
References: <20260507-ra-fix-primitive-v7-0-cb8e3791f2b5@gmail.com>
 <20260507-ra-fix-primitive-v7-1-cb8e3791f2b5@gmail.com>
Date: Thu, 07 May 2026 12:18:20 -0400
Message-Id: <177817070041.40349.11204036698592528789.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3395; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Kr5e8szEE7rVgQx/AkFU1vCQbRE+JxMdczYFbyXk3PY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJl/dvsZ/UhK8OMOzf3L2/KBx881Q1xym+L5zCnmB5bs3
 7OK77xix0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKmuO8HI0DmNnYX77IRru+185n/UUOt63u5249pRvbJ1ck0vl0X5MDP84fdvz4t
 JaLLSXfPxbNsDnXWCuSK1G7nTasWiuBa/3TyNCQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Thu, 07 May 2026 23:47:24 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index d5f9a0ca742c..79c69004aed1 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -343,6 +346,161 @@ def generate_crates(
> [ ... skip 117 lines ... ]
> +            .decode("utf-8")
> +            .strip()
> +        )
> +        return ra_version_output
> +    except FileNotFoundError:
> +        return None

This needs to also catch subprocess.CalledProcessError because rustup
may provide the `rust-analyzer` binstub even when the component is not
installed:

% rustup component remove rust-analyzer
% which rust-analyzer
/opt/homebrew/opt/rustup/bin/rust-analyzer
% rust-analyzer --version

I can fix this on apply; this diff fixed the problem for me (includes
more correct warning logging):

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 8629dd186891..9dee5151cb45 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -531,7 +531,27 @@ def query_ra_version() -> Optional[str]:
         )
         return ra_version_output
     except FileNotFoundError:
-        return None
+        logging.warning(
+            "Failed to find rust-analyzer in $PATH; "
+            "falling back to `rust-project.json` for rust-analyzer "
+            "%s, %s (shipped with Rust %s)",
+            ".".join(map(str, RaVersionInfo.MSRV.ra_version)),
+            RaVersionInfo.MSRV.release_date,
+            ".".join(map(str, RaVersionInfo.MSRV.rust_version)),
+        )
+    except subprocess.CalledProcessError as exc:
+        logging.warning(
+            "Failed to query rust-analyzer version; "
+            "`rust-analyzer --version` exited with status %s; "
+            "falling back to `rust-project.json` for rust-analyzer "
+            "%s, %s (shipped with Rust %s)",
+            exc.returncode,
+            ".".join(map(str, RaVersionInfo.MSRV.ra_version)),
+            RaVersionInfo.MSRV.release_date,
+            ".".join(map(str, RaVersionInfo.MSRV.rust_version)),
+        )
+
+    return None
 
 def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo:
     baselines = list(reversed(RaVersionInfo))
@@ -596,18 +616,11 @@ def main() -> None:
     )
 
     ra_version_output = query_ra_version()
-    if ra_version_output:
-        compatible_ra_version = map_ra_version_baseline(ra_version_output)
-    else:
-        logging.warning(
-            "Failed to find rust-analyzer in $PATH; " \
-            "falling back to `rust-project.json` for rust-analyzer " \
-            "%s, %s (shipped with Rust %s)",
-            ".".join(map(str, RaVersionInfo.MSRV.ra_version)),
-            RaVersionInfo.MSRV.release_date,
-            ".".join(map(str, RaVersionInfo.MSRV.rust_version)),
-        )
-        compatible_ra_version = RaVersionInfo.MSRV
+    compatible_ra_version = (
+        map_ra_version_baseline(ra_version_output)
+        if ra_version_output is not None
+        else RaVersionInfo.MSRV
+    )
 
     rust_project = generate_rust_project(
         compatible_ra_version,

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
