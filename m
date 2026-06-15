Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD336305666
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781547275; cv=pass; b=MCofOZ2/SHAAGGlt7o9HJOboHcu+bndwJMEhAAhQ7nHc2ECuBfJNMEnrMj5v+d8K4bp9xklpb1sJlvcBqjHKoo+5/7FrwNZE32EEhBbJpfSNJiCiK7xkAJsTAIGA3v1A/natZCmynxowXd7Jrwf3XTvV3jlGHSG5QDke0tKlLs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781547275; c=relaxed/simple;
	bh=7hpnGVu/jFCwPJirWTMx87mp5CGcb9SrnT0ncXevNCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ichoz9/L1MXhaeYySKFrseyZwFuMNb4STKxhBTr9S9BitLIeZbMlE3zCMWhvtCY9VgFxNV6qpv9ID4NuDUOheVY+nptaZpRqgzR89cyIGIJkE6ryEpiJYxbsvhDpDHlch2NHABEdqBGluI8DZoAW0PdKU4P6htMG9Ad/fNMRB3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvOF67IW; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvOF67IW"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660e9ea26b9so3935417d50.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 11:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781547273; cv=none;
        d=google.com; s=arc-20240605;
        b=XOfuXHMUEVEwQcgej0NMT3khPIJkOOthZkTbQC8BTASMgTTQz5ZHIZw4/Pc1JYyAND
         EPgzBLM3Js5oDIQ2SSiiBPODiKjl60q/I8noAkDwK9C0uoD9qjoZIL1wfC4ZN/yieU8W
         8vkyel0Qe1sax/Bt29dVRIALXR+/1b/TwZthvmLpF9Ak5QS6zfOjfgD47yO6AZzUHzlc
         qLwiSW3G32jh3MSjgQwEOK/8IJd5ofJ22la2sWKhKSDlHrATlgwWszIoJzYuHoZ8XXJQ
         Nq1hIujTKqVwrnGMI6wKXuoqeClbXMTG1d1guHifVfRsIpLFiIBOpRXE5E6sv8Mrc7a+
         3lhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgpdzSMC15GDZO9IdrqqPcFyAeKGL54ldux2hshhzHY=;
        fh=sjCx6kWRn0gl2HZlXNA9jXPND/cjEgyxFKXKAeOmfNA=;
        b=DP6Jrgc9E2l462J+AtZJOhIAn4JOIf1jKL9w++AFOshFT8qP/Hh+rUR1m/1jM3ruqm
         B3IHPWb2NjiTGhrJBCwr0E1KQJewvQ1ifIrV218KJ5fDYr79pXAXZk/zPJHruk1pPFJ3
         sumxNjLGySMKlD1F8hzrLLErO0gX6TFr/eWkCIfxqSo6ICwqWl8HizJOfulQt4/VG/ip
         kvdN1Zc5aWr/+K/HKuBGsi3Hp40i2q4GRA3axCrmKmGz2KKlzpl9bkaAPMKvFmTYP+cz
         AYBOLJJgk5RFbllsaxjOujQGk3ne0N8Z6gDehrUe4vtSTo4gerB2JI8Jrwzmo9ZA+5Kh
         GQsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781547273; x=1782152073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgpdzSMC15GDZO9IdrqqPcFyAeKGL54ldux2hshhzHY=;
        b=CvOF67IWA2VAleeK5F0JWagOlxHh+loJhPJlqOXj3MWeBBMDiI+q/GeX6Q+vkCm82N
         gSoZBMiTut31yXCcRxDHPvLeIWDOXRFXF3/d0AX6reEFl46oiqIpC/Jqn320lEMSHcMr
         CdqKEfxGh4/x3FoOgPqkhDEDfFyMfjwdrxQEGVSSGnzolVYBikVzigzFfziPyC1G1tLZ
         Voia1+ewAbsVtrAOySF+8J4iMik4NNX4d3wEL/6UqJzCWb7VEPNnWR5hohWSFTbVmRPc
         cLLtzBUPjHw8erwcjUMtO4TjEuO4iVTFWeCPcPgeTzOHKLW0uKEgMTGuOBzTKbQRra17
         YyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781547273; x=1782152073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgpdzSMC15GDZO9IdrqqPcFyAeKGL54ldux2hshhzHY=;
        b=P7EWNnEYBFOsH2HOVSL2T/BLuOyTyJgZDlt55oaPhUcsImKVjIf7rLxDvVXntliiNd
         ZfWLuFY4FPJC1drsNFhpWyEIZ3cafbUzVcr46JUKD458SHdOu3Qx6+Kg09dKEA0hvnn2
         cglis2GGeEgi2Cg7bQ+W0EjClGLkCPbXNFY+is6sVemPiQ1wBjxeaa9+tgX2z5C3Xw2R
         LgK+WFIkpmIOtbod8ZyT+uupcNSABkxMZHTP81bNwiiD9r5GvBwxdyBQxgS8aoPAWM8/
         qRjXHxbrztTw/1s66UcmQIkXhZ4s/zfJNXG6Z9PZ3RW+q896Dl5YGSy+2E6T+Xuz8JA0
         t6eA==
X-Gm-Message-State: AOJu0YzGXjdlo95lgLyG8z/d5rSWEt8wdbWM+v/32mxxoCYypZXulo2x
	XGJUg7C5Zpae81YJ7fh7irpAoykSIeWP+EeVl/x4DPLvMsZJRCqmpziX12Nr7ARX78KP+lc3ihh
	od4uUAqF68ydVOaj9lSofAsAUrTbdxvI=
X-Gm-Gg: Acq92OFV0hojDYUmF1J5KyVepdaZOyLfXwuk0b2v4gayccPzDzW97huw+1l3282+9y4
	JliZs+UA/er4ctQayNKPMYw33SuS6myf6DELU6kYmFQXaZzK7sCE/8HfEL13sbJZ8WjkmhBEYhz
	KrL6EbRjWJz/SHjcyearG0HadOBX26VJ2S3d3H1JOiuIzwaiTzJaFshFkzjjMTvZ1sOZiPnTZXk
	0C+azQdsZ+C9TtbjWhWT3WbF6BxNpErsmXpjtmGnOpODSC8/Yp4uBc5kq0Ebf5QUF7kgYAGthcM
	EMylOIR/e6ugVPI=
X-Received: by 2002:a05:690e:2441:b0:65e:5110:a584 with SMTP id
 956f58d0204a3-66284fd3ca2mr9047737d50.52.1781547272702; Mon, 15 Jun 2026
 11:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522172558.137415-1-ekffu200098@gmail.com>
In-Reply-To: <20260522172558.137415-1-ekffu200098@gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 16 Jun 2026 03:14:21 +0900
X-Gm-Features: AVVi8CciQYKrd4R4lUmHGKKKy_B-YteGnkA_cnKpt34HGlp4AmS18YwxkcTWGes
Message-ID: <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
To: a.hindborg@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 23, 2026 at 2:26=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> fsleep() documents out-of-range input as a bug but does not check
> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> debug builds.
>
> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
> the clamped path is observable at runtime.

We're now in a new merge window.
Gentle ping. Any feedback is welcome :)

Thanks.

> Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> Changes from v1 [1]
> - Add pr_warn_once to fsleep() and udelay()
> - Add reviewed-by tag by Onur
>
> [1] https://lore.kernel.org/all/20260508173827.1123011-1-ekffu200098@gmai=
l.com/
> ---
>  rust/kernel/time/delay.rs | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
> index b5b1b42797a0..557130ab84e6 100644
> --- a/rust/kernel/time/delay.rs
> +++ b/rust/kernel/time/delay.rs
> @@ -8,6 +8,7 @@
>  //! C header: [`include/linux/delay.h`](srctree/include/linux/delay.h).
>
>  use super::Delta;
> +use crate::pr_warn_once;
>  use crate::prelude::*;
>
>  /// Sleeps for a given duration at least.
> @@ -18,8 +19,7 @@
>  /// `delta` must be within `[0, i32::MAX]` microseconds;
>  /// otherwise, it is erroneous behavior. That is, it is considered a bug
>  /// to call this function with an out-of-range value, in which case the =
function
> -/// will sleep for at least the maximum value in the range and may warn
> -/// in the future.
> +/// will sleep for at least the maximum value in the range and warns onc=
e.
>  ///
>  /// The behavior above differs from the C side [`fsleep()`] for which ou=
t-of-range
>  /// values mean "infinite timeout" instead.
> @@ -32,10 +32,13 @@ pub fn fsleep(delta: Delta) {
>      // overflow inside fsleep, which could lead to unintentional infinit=
e sleep.
>      const MAX_DELTA: Delta =3D Delta::from_micros(i32::MAX as i64);
>
> +    debug_assert!(delta.as_nanos() >=3D 0);
> +    debug_assert!(delta <=3D MAX_DELTA);
> +
>      let delta =3D if (Delta::ZERO..=3DMAX_DELTA).contains(&delta) {
>          delta
>      } else {
> -        // TODO: Add WARN_ONCE() when it's supported.
> +        pr_warn_once!("attempted to fsleep() with out of range delta\n")=
;
>          MAX_DELTA
>      };
>
> @@ -54,7 +57,8 @@ pub fn fsleep(delta: Delta) {
>  ///
>  /// `delta` must be within `[0, MAX_UDELAY_MS]` in milliseconds;
>  /// otherwise, it is erroneous behavior. That is, it is considered a bug=
 to
> -/// call this function with an out-of-range value.
> +/// call this function with an out-of-range value, in which case the fun=
ction
> +/// will delay for at least the maximum value in the range and warns onc=
e.
>  ///
>  /// The behavior above differs from the C side [`udelay()`] for which ou=
t-of-range
>  /// values could lead to an overflow and unexpected behavior.
> @@ -69,6 +73,7 @@ pub fn udelay(delta: Delta) {
>      let delta =3D if (Delta::ZERO..=3DMAX_UDELAY_DELTA).contains(&delta)=
 {
>          delta
>      } else {
> +        pr_warn_once!("attempted to udelay() with out of range delta\n")=
;
>          MAX_UDELAY_DELTA
>      };
>
> --
> 2.43.0
>

Best Regards,
Sang-Heon Jeon
