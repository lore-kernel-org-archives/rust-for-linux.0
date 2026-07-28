Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5722BE7AB
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217718; cv=none; b=D0AAC6PGoLAek6LDPAPGopkxsa5dfnS+xbpPyJB8FwTQFvS3aN1lWUHlEzas5Tn4sqJPh30pmwd6REpd1xh0RIP6lEp6Kz79Epc+Bj9h2KVeQFAX8+nz6r8xWlvzIQImXmSM+zZgv407Zjpv5vOmeCtG0dhAlHrvm6eXidXI19A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217718; c=relaxed/simple;
	bh=Cdyf247tbe9OXdcLCvB/6utTa5EH3OiAGCsbHswv3k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5G4272W/ndB85s+vj7AQ+JwqrCbywRcxMkxhL7uDaEFRfsbrgdWog0UvgXwNDZ3dzezBqLgUo/TJ796v2X4+kKPDwkcOM2jmzARfWj44yDTyefO2flDPBQjRPXBr3vGvaIVDoEUroy6CpX5ullX1DUuoILD+35ZrW1NzKO96CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=ctxTpUJQ; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="ctxTpUJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1785217713; x=1785476913;
	bh=aWFztAECohZ7TTazapqEBrlbhDXXj7+fGneVCfEgVqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ctxTpUJQ7KQkQnpfGoQSwf0WLKWncGxz6PFoSa+Z4hICzSpBO6/mu8psShJ2l2fS8
	 earYrQkqbripi52KBNtUsTLXJTY0FWXu8/C0ofFhD31u73nTpfOOiJFfBr9GvCUgI9
	 YoNkZICj2DSQfT00IbEizRRmYOCqKPi/3q4Nra89ap2zvLk7MSH4UrgP4w0J20LEb3
	 Y5FUjPJT9lXP0eXFoMaHlJPdgqIQZJsZ7yTk5oihIZxncmQe6XUExZMKl7frkz05il
	 PC+XJbCwWfu7pvDugwWMIuLLh2ROEVwUlH0P4HBvOUD4RP8UR/sgNfmM4vwgHwF66X
	 OUAy/MtBqhs0g==
X-Pm-Submission-Id: 4h8Pdm0Jn6z2ScQ0
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Rafael Passos <rafael@rcpassos.me>
Cc: rust-for-linux@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	Christian Brauner <brauner@kernel.org>,
	cmllamas@google.com,
	aliceryhl@google.com
Subject: Re: [PATCH] rust_binder: speed up get_node_debug_info using lower_bound iter
Date: Tue, 28 Jul 2026 08:48:24 +0300
Message-ID: <20260728054826.172328-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260728012249.3084154-1-rafael@rcpassos.me>
References: <20260728012249.3084154-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jul 2026 22:22:18 -0300=0D
Rafael Passos <rafael@rcpassos.me> wrote:=0D
=0D
> Finding the next node in the RBTree can be done more efficiently using=0D
> the cursor_lower_bound, as it reduces cost from O(n) to O(log n).=0D
> =0D
> Link: https://github.com/Rust-for-Linux/linux/issues/1249=0D
> Suggested-by: Alice Ryhl <aliceryhl@google.com>=0D
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>=0D
> ---=0D
> =0D
> (Sorry for the resend, my script missed the list)=0D
> =0D
> Hi, I decided to use the peek_next semantic instead of a loop/break.=0D
> Since the iterator should land directly on ptr or greater, I think this=0D
> is more elegant this way. But I can change it otherwise.=0D
> =0D
> Thanks,=0D
> Rafael=0D
> =0D
> =0D
>  drivers/android/binder/process.rs | 9 +++++++--=0D
>  1 file changed, 7 insertions(+), 2 deletions(-)=0D
> =0D
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs=0D
> index cdd1a90797266..c0c2112aca1c6 100644=0D
> --- a/drivers/android/binder/process.rs=0D
> +++ b/drivers/android/binder/process.rs=0D
> @@ -1174,10 +1174,15 @@ fn get_node_debug_info(&self, data: UserSlice) ->=
 Result {=0D
>  =0D
>          {=0D
>              let inner =3D self.inner.lock();=0D
> -            for (node_ptr, node) in &inner.nodes {=0D
> +            let cursor =3D inner.nodes.cursor_lower_bound(&ptr);=0D
> +            if let Some(c) =3D cursor {=0D
=0D
Why not "if let Some(cursor) =3D inner.nodes.cursor_lower_bound..." ?=0D
=0D
> +                let (node_ptr, node) =3D c.current();=0D
>                  if *node_ptr > ptr {=0D
>                      node.populate_debug_info(&mut out, &inner);=0D
> -                    break;=0D
> +                } else if *node_ptr =3D=3D ptr {=0D
> +                    if let Some((_, next_node)) =3D c.peek_next() {=0D
> +                        next_node.populate_debug_info(&mut out, &inner);=
=0D
> +                    }=0D
>                  }=0D
>              }=0D
>          }=0D
> -- =0D
> 2.53.0=0D
> =0D
