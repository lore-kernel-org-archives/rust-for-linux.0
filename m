Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562DD331A6D
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 06:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778308914; cv=none; b=jOHiNsEHDPcYhlMv0j5IdaKe7o7e36KYmTpgUhJWCkDcaekdvt6wfAOQbUgaEGiib3hnMgFjhNtyKicuQwHo5zJHUuLfyZwPfk/h2uOsEhQ/oHvJbIdpZOXktk575P6369DwNzHCNNoIwpfckSNUU1Ep5pTG5h7PxsLNoPw/DwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778308914; c=relaxed/simple;
	bh=XWYzpPPtnUChAGXIdTecNPlPhmiYB88SSqtbkWoLTEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUuj5szgU0YLe5S+efHqQR/E1XPvfgCfWmlKXx4YAq+zwY90XdUCmPP7H01tH+byHBDMPYc6LYq00vmQdV1bV3TYAVP32d9FjW0YL6hQz0UkHWzZkbkrD4lBolLJCZuHuV77Decq3BaG9dUnwguTE8PRaF7yRuMuudRbBmx3GaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=oZde7dCz; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="oZde7dCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778308902; x=1778568102;
	bh=b2us71gUcSTL2Pkhafs2rF0k1WOnUuGLf/eAvi3SaEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oZde7dCzzRutQEI8cZon7DH74ercIjRO6I37b0hgc23ObMaSK3EzR3musC6Lp1/KU
	 +cgZ+SUe+8O7V/fJQob6TgGmJ6GGT3iIYgTIZ4cR4BbClPXmapU/J2KQmHBQTb0PPq
	 WAFUBVTMFaX1gYb9v1qounXLoRgo53i8XexIiErXf6Za3P3QhetgrjS6TgPoJayxPT
	 lLk7P0M4kjhM3YvLnOGhBqAA6N/bWkGk9zzywkhkSYGUsYZUc0btg7dUT6LkQD+vyj
	 04AltP9BUoQsJL5JCti12sp3ICoTMuNuhy3rouRMgQlkL0iVxpdTF+CuGsFxavywTE
	 /R2FSP1tUi4Rw==
X-Pm-Submission-Id: 4gCGc42cp8z1DDXS
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input in fsleep()
Date: Sat,  9 May 2026 09:41:34 +0300
Message-ID: <20260509064138.532101-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260508173827.1123011-1-ekffu200098@gmail.com>
References: <20260508173827.1123011-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 09 May 2026 02:38:27 +0900=0D
Sang-Heon Jeon <ekffu200098@gmail.com> wrote:=0D
=0D
> fsleep() documents out-of-range input as a bug but does not check=0D
> it, unlike udelay(). Add `debug_assert!` calls to catch it in=0D
> debug builds.=0D
> =0D
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>=0D
> ---=0D
> Hello,=0D
> =0D
> I found this small inconsistency while reading the code. The same=0D
> check was applied to udelay() [1] but does not seem to have been=0D
> extended to fsleep(). Please let me know if I have misunderstood=0D
> anything.=0D
> =0D
> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomonori@=
gmail.com=0D
> =0D
> Best Regards,=0D
> Sang-Heon Jeon=0D
> ---=0D
>  rust/kernel/time/delay.rs | 3 +++=0D
>  1 file changed, 3 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs=0D
> index b5b1b42797a0..1e699fe647ff 100644=0D
> --- a/rust/kernel/time/delay.rs=0D
> +++ b/rust/kernel/time/delay.rs=0D
> @@ -32,6 +32,9 @@ pub fn fsleep(delta: Delta) {=0D
>      // overflow inside fsleep, which could lead to unintentional infinit=
e sleep.=0D
>      const MAX_DELTA: Delta =3D Delta::from_micros(i32::MAX as i64);=0D
>  =0D
> +    debug_assert!(delta.as_nanos() >=3D 0);=0D
> +    debug_assert!(delta <=3D MAX_DELTA);=0D
> +=0D
>      let delta =3D if (Delta::ZERO..=3DMAX_DELTA).contains(&delta) {=0D
>          delta=0D
>      } else {=0D
> -- =0D
> 2.43.0=0D
> =0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
