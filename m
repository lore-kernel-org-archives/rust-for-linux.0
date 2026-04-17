Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CFE39FCAE
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414533; cv=none; b=JUORO5AiuPOnBCRhKzPgj2Z4ejnXZfpb6up70buqa2hAFVea3N6vFJnd3p88USaw09qtSCpVWhAOdsHu6Gw/Ss/tj4Qjn5X53guGjH4MScE3GXO2QJUze0rbkBRu/7K0r7cvG7i5/gZkjjnL37PGd0Sqzq2KRh/Z/hgyYnyV1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414533; c=relaxed/simple;
	bh=GomYkPSkcUxwOfZ7HKJWjzgVk7mor/lH/SrDd8Tc5eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdCQfdyAzdC1l/41q3IAFl4j9tPVKx1s9IN8xomG8VSlKVAEe8frJnutI/ZfmklIbI2GzCOH2G5YAmPp2JBRQ2V3hxyGexXTyA/jSYkepsRaqfxMN6z50G9D8CNnlfWPFbDUvnQ9ixJY88dUdMUL9GR211Bn1ikjpWvFOVKcxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=rhB/r6K5; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="rhB/r6K5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776414521; x=1776673721;
	bh=6U6RVFHLNaJmCg6toI8EFNRRK4p1gxZbu5ehs5QIA8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rhB/r6K5iKRpCNj7AXXEfY30mmQhyHRRblD1m1+CiVL1V0VPbgfT/b/fv0vsoOHTt
	 FiwR/BP03vaThgocf1u9vUFChqK+0e01imRKqFmoRf0zbiNZbb4JNvRqpEGrBVBkd5
	 WGyjPiXPuO8e6AYFlaZudnwo7jLeTtrWYC4w0wywUI5stP6Eeac471JAhwyjcS2a1F
	 xMJQ6KKixOv/tU3JqvQXR6sqk+87+rwcFqx/w5PiN1Iq4vK7LIfapumMmRbDLK9elA
	 wT+8avt7+xfsHaBCh/ZwFeoRhCTCxHj7LLdgwv0mEcq2HqtV6WbpGrLG7+ZKARmg28
	 9JhKoewDEfqFQ==
X-Pm-Submission-Id: 4fxp1f0llnz2Sccq
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
Date: Fri, 17 Apr 2026 11:28:35 +0300
Message-ID: <20260417082836.29530-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev> <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Apr 2026 09:05:54 +0800=0D
Alvin Sun <alvin.sun@linux.dev> wrote:=0D
=0D
> Add a helper to find the first present entry in the XArray.=0D
> =0D
> Returns the index of the first present entry, or None if the array=0D
> is empty.=0D
> =0D
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>=0D
> ---=0D
>  rust/kernel/xarray.rs | 22 ++++++++++++++++++++++=0D
>  1 file changed, 22 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs=0D
> index 235fda0e394ba..e43129d032d9d 100644=0D
> --- a/rust/kernel/xarray.rs=0D
> +++ b/rust/kernel/xarray.rs=0D
> @@ -217,6 +217,28 @@ pub fn remove(&mut self, index: usize) -> Option<T> =
{=0D
>          unsafe { T::try_from_foreign(ptr) }=0D
>      }=0D
>  =0D
> +    /// Finds the first present entry.=0D
> +    ///=0D
> +    /// Returns the index of the first present entry, or `None` if the a=
rray is empty.=0D
> +    pub fn find(&mut self) -> Option<usize> {=0D
> +        let mut index =3D 0usize;=0D
=0D
Nit: I don't know if this verbosity can ever be useful, it can simply be `=
=3D 0`;=0D
=0D
> +        // SAFETY: `self.xa.xa` is always valid by the type invariant, a=
nd we hold the lock.=0D
> +        let ptr =3D unsafe {=0D
> +            bindings::xa_find(=0D
> +                self.xa.xa.get(),=0D
> +                &mut index,=0D
> +                usize::MAX,=0D
> +                bindings::XA_PRESENT,=0D
> +            )=0D
> +        };=0D
> +=0D
> +        if ptr.is_null() {=0D
> +            None=0D
> +        } else {=0D
> +            Some(index)=0D
> +        }=0D
=0D
This can be written with the `then_some` chain e.g., !ptr.is_null().then_so=
me(..=0D
.) but I don't know if it ever makes it more readable or simpler. I guess i=
t's=0D
up to preference.=0D
=0D
-Onur=0D
=0D
> +    }=0D
> +=0D
>      /// Stores an element at the given index.=0D
>      ///=0D
>      /// May drop the lock if needed to allocate memory, and then reacqui=
re it afterwards.=0D
> =0D
> -- =0D
> 2.43.0=0D
> =0D
