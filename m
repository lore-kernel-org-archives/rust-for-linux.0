Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9833537D2;
	Sun,  3 May 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777832368; cv=none; b=DZPMzUGkyJ/tlVI52fGvuVZnmP10TmMQSQvGbP46bIr8hLFvxxtwC38gzRixXr8M5BvwNRRP7G88rP2gtPrhmjFyzZkKpAAwPdzMOzcik+ZUsVjEnSfnzy/3zSIlLro5RwBA1H6rBbDsy42PvMfNWh0qF3aaGZQk/KmVTdazjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777832368; c=relaxed/simple;
	bh=ypLNrtskVtoAXWg6pm8HX3fnALPCwvnjLsxswgbu2Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mpz7r+vR33/s3NlsJbfL12TpC+tLx5aJUUW84gCIJTrDvJ2i7Nf1f3D7DmCYoQ/P5Qn0heOKsug9nHgAlLIE64G6Bsgv84+y1ZNSPKgQZpQnmIIdBnAqiVIulTR3VBb66QXVZAMemrmC6yyQPIiOZna863IcFiI+oTerPoLep+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=a2slYTQT; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="a2slYTQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777832354; x=1778091554;
	bh=o1JtjOOR2DomQcJNQ7gBJAbjOyJ/Vm0k1tbnneP6L8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a2slYTQTnv8w1gCxP23OkVlpMBhP4iM7KUBuWrRrxcLlCTY0vLYUkzjcSRleqvHzX
	 5hH6AsRP6fuytR3lFkl1i+L1738g/o47ayWsv3JmIv3x2qp1N7eoLpIfrpRxWekHuz
	 dJhin8ZDi4Xzu1apyqdMFJsm44oDrsLMDkbseARq9WVdMkulrtT3SQRWIBLWU+nHhP
	 fvLdzFp8QP0qWSlP5sCWbOG/CTb0qegQNu1OA+KLlC6EWAmIURQkRDffyI2b3HwtWP
	 pX+kwXXMd/IQYkfwSAy9V4q17jYcGmhr+kJYmOLVQVyg0e92nX58AbaEQxkFF/cyen
	 F9J05y9P1AFhA==
X-Pm-Submission-Id: 4g7tMh5MWJz1DF75
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Arnav Sharma <arnav4324@gmail.com>
Cc: ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: error: implement Display for Error
Date: Sun,  3 May 2026 21:19:08 +0300
Message-ID: <20260503181911.13142-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260503171432.7846-1-arnav4324@gmail.com>
References: <20260503171432.7846-1-arnav4324@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Arnav,=0D
=0D
Please avoid sending multiple versions of the same patch one after another.=
 If=0D
you feel your patch isn't good enough, you can reply to your own submission=
=0D
with notes and incorporate those changes along with any feedback from the=0D
maintainers. It's unpleasant to see 3 versions of the same patch sent withi=
n=0D
a short time window.=0D
=0D
Also, I suggest to add more people to the cc list, likely all the people li=
sted=0D
by the ./scripts/get_maintainer.pl script.=0D
=0D
On Sun, 03 May 2026 22:44:32 +0530=0D
Arnav Sharma <arnav4324@gmail.com> wrote:=0D
=0D
> Implement the fmt::Display trait for the kernel Error type.=0D
> =0D
> While the existing Debug implementation already outputs the error name=0D
> (e.g., 'EPERM'), implementing Display allows errors to be formatted using=
=0D
> the standard '{}' display marker. This provides a more idiomatic Rust API=
=0D
=0D
Can you say more about what you mean with "more idiomatic"? It sounds like=
=0D
a highly subjective opinion.=0D
=0D
Regards,=0D
Onur=0D
=0D
> and allows Error to be used seamlessly with macros that expect the=0D
> Display trait.=0D
> =0D
> Signed-off-by: Arnav Sharma <arnav4324@gmail.com>=0D
> ---=0D
> Changes in v3:=0D
> - Fixed doctest to prevent panics when CONFIG_SYMBOLIC_ERRNAME is disable=
d.=0D
> - Corrected commit message regarding the output of the existing Debug imp=
lementation.=0D
> - Retained `write!` for the fallback error case. Applying `f.pad()` to dy=
namically =0D
>   generated text requires memory allocation, which is unsafe in error for=
matting paths.=0D
> =0D
>  rust/kernel/error.rs | 15 +++++++++++++++=0D
>  1 file changed, 15 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs=0D
> index 05cf869ac090..4ab7d7d8ccad 100644=0D
> --- a/rust/kernel/error.rs=0D
> +++ b/rust/kernel/error.rs=0D
> @@ -216,6 +216,28 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Re=
sult {=0D
>      }=0D
>  }=0D
>  =0D
> +impl fmt::Display for Error {=0D
> +    /// Displays the error name if available, otherwise the numeric erro=
r code.=0D
> +    ///=0D
> +    /// # Examples=0D
> +    ///=0D
> +    /// ```=0D
> +    /// # use kernel::prelude::*;=0D
> +    /// let err =3D EPERM;=0D
> +    /// // Formats to "EPERM" or "Unknown error 1" depending on CONFIG_S=
YMBOLIC_ERRNAME.=0D
> +    /// let _ =3D fmt!("{err}");=0D
> +    /// ```=0D
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {=0D
> +        match self.name() {=0D
> +            // Print out the numeric error code if no name can be found.=
=0D
> +            None =3D> write!(f, "Unknown error {}", -self.0.get()),=0D
> +            // SAFETY: These strings are ASCII-only.=0D
> +            Some(name) =3D> f.pad(unsafe {=0D
> +                core::str::from_utf8_unchecked(name.to_bytes())=0D
> +            }),=0D
> +        }=0D
> +    }=0D
> +}=0D
>  impl From<AllocError> for Error {=0D
>      #[inline]=0D
>      fn from(_: AllocError) -> Error {=0D
> -- =0D
> 2.43.0=0D
> =0D
