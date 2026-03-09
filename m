Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DA34AAEF;
	Mon,  9 Mar 2026 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081297; cv=none; b=q9vbliNbaGn3wQPVubZ9UswsMrdsQ63IPEMiWZITJSZUcDmhqYq+IgVwWfeuDnr1xOtZNB4+yGdujcJ1/9GlD7ybQ5oROO5Bc/9qETxnSVkUdzA1GAQDtRFEKzweOqO4SLV/VSpxArArGqg1i/VaoaA0jMl/TyokoAwV1FTZOEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081297; c=relaxed/simple;
	bh=Esr1GslHjBaVC+amlL7vTFDGBBx3xrkcBP50auaoYrQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=IqG+EK4c40MbgcLXXDQF1KTmsbHTsrX8teZU1mWOEgD1hxGw3wEWiusscTXXR6rDxqCjoMwpWpYj7tj1x9bChkRGMs1Or89eLSuS6FS9U8nXnBdS92if1OLBq0nrrh2I999urCvChc/nSkhVufvkKEkvoGK+8fH0tjPogS7QRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L91+1cud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L91+1cud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04042C2BC87;
	Mon,  9 Mar 2026 18:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773081297;
	bh=Esr1GslHjBaVC+amlL7vTFDGBBx3xrkcBP50auaoYrQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=L91+1cudzksyr/eKZjzeO8q3J1+MAgtj7uScASte1Zo6sFN3JAl/qH161klYa8yuD
	 Rzq0k9L8qBG0TKddC3pGGX0HVJLWfoUmYqNaDYTb/xei2isYqTIeMJcCJ+BI3Jj4x0
	 Gb4Ar4pIzobWqF67aBnlPBWQBcwcZTmISjz/LvD7BVflf5KLHMwtaKhzv8prLJ4VIL
	 P7Z9oeMuiyJsTVOvdC82s91TLPImSA9AXUsLtpPftRBQqCEz0sy5kzbte2INu154W+
	 I/BHJ4R13P+bwSXG5fy/mjlCbEspHz1t3Ro+UkeEInTCth/jI6f7JGVLu/jgXAWuqF
	 /0rjh+k2AmE5g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
From: Tamir Duberstein <tamird@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260308-ra-fix-primitive-v3-2-598017bcefd8@gmail.com>
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
 <20260308-ra-fix-primitive-v3-2-598017bcefd8@gmail.com>
Date: Mon, 09 Mar 2026 14:34:51 -0400
Message-Id: <177308129159.19064.4199036057098584250@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
X-Mailer: b4 0.15-dev

On Sun, 08 Mar 2026 08:30:35 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index a4d25bb8b602..ab399f6044fa 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -52,9 +52,11 @@ class CrateWithGenerated(Crate):
>      source: Source
>  
>  
> -class RustProject(TypedDict):
> +# TODO: use `typing.NotRequired` when Python 3.11 is adopted.
> +class RustProject(TypedDict, total=False):

This is good. Could you please indicate which fields would be `NotRequired`?


-- 
Tamir Duberstein <tamird@kernel.org>
