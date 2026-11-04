Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793813515;
	b=lIMoIuAbmbg8ajlOTtjW0aTJGtlY9d7G+67X0dmI+HVRiXggGf7KejFP4EgFu75i4eyx
	 ElLk7bgZAg1kjh4UPtfFQp6TxpI+4AJsDCRK0mgl8u8nEqQ0IZ4bGvD5MZU8c31OO0iUp
	 4VqD8Yap622e97U7SF0c5ESf5pb7vk/foYev6i3ZbzjjNN24fsB1lQOBGZw+d9Jao4fvu
	 IweCwRS6YzhnlU0OdFxP4XOHmsmPP1bpOYEAXE6yJDACR0EF5KoJI1M2Qp3RtfCNuPGCz
	 411fvO2R89oycRLQNkKeeGk0dAFJySsdy9sQpTjmv5UP18yt5aQBgVVr6m0r/0VX3gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Abg28lnVnrSVBwieKb4OqCyJGui282X03edz+PzWfgM=;
	b=T58s1Ep3rmqwLOfxh6zNv68f27v1odedI5rUNma5I4Sg9lJRlIzK5CewXTykF3+7n1+z
	 LntbEpsyyrn78q25TC2ew/KNEEZpL2TqYap8pJHD2UFOIzl2sjdbdDsm+PMm94TWQ8zaf
	 lSh+6P5X2RpgD1xAhXYAFuMbruwztT6ybi12fyVwxqF0/wog7S1yNsXGcQM/ptnQk7qtF
	 Voq52szQiReF3UmExRkdNmA1OtdiYppp+jXXbMMgTdhFPl8DFbk5JfRnnTiVks/aYIWvf
	 o/D3AP0BMW+4MJM/NqAeqBWZt56ZpUOg+s5sUYKZOY8ErHW3kDZ22ixBRskJTvIwgUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aE8P2xGk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EDA606D814
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 17:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EDA606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aE8P2xGk
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dc4797082so26128eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 09:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793813514; cv=none;
        d=google.com; s=arc-20260327;
        b=PjWIbmO7LThF3nLJOHHEL+iAzHvyvJBpMdutETgTmkXQv1Ir3r7sjhsALuwhtgO+vZ
         8Pf2BONx5lCa8f/dCg+ThMw9+lPdzIcwHBYD24THjfixo9YSe9LHGLxFxVPjO+uvoj4X
         8n46YNRy2+BrZCTpCjGPQuXdsO/V9W8xEOWhk6EG+9XCDJ6LiER9IolHDRcW/ro0oXTp
         21bYY3MNIKYbiJDtANJitpGJv+YIEACUDPYqXrFWnqAZ4PnBr/2PpET/ggj8nAXIrrXW
         hcycYg1qe1ruMMDFVB3vME4rCbb3CXeGy57rwCFodYbLtCuvjPxewVQ7+G3hRuVwqePG
         +zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Abg28lnVnrSVBwieKb4OqCyJGui282X03edz+PzWfgM=;
        fh=C4FoDvAdywtwze/vtjWU0Yp3l0TJXONUezsouZZQMQ4=;
        b=pzxAVk7rmyAYzn9JaTa26BkPohfl8W1ciEgo7v4Ut40nKA9Ak3T4ISOianpn/pOmKX
         v9HIm5uKj1yWfrWEEC/NjmjUXqCW5+R1moibsWRukIUgRod4Y5RN0OvVD4KzYBkzaLNh
         bs0ILBlAIn7QR/mhWbWtnjYjQyERQbg2vNm2vEJub9Uj7YfwybNYU9ac9u8DvjMPkg0f
         hAGHLDS185kSF9XyjrslOItUUMqXBbDdUugRCe+oB0oRHH3ooHFgTh3MxaAoqTxjQbgp
         yuPk77AZadSa3DZPZdEdV+RhIvq+aZgjqVc9+V+cXq/MMVx9AKLAqH5nny/3u2N1K56c
         YYog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813514; x=1794418314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Abg28lnVnrSVBwieKb4OqCyJGui282X03edz+PzWfgM=;
        b=aE8P2xGkz0KMOVE68F7vZrJ1pw1jcOSaGcqETMx0NUi/ZIHZI6RaRfgTKOLDCEqLZx
         1uwjxGmXNlYfSiXdSUt/sRbt/DpgI7AmfS7PWFAmV669AHOiG8SstP1nX67FN9nBGOw+
         1g4EPeYagjlSI4usmJnHXLffrWDs45aGQ1pzXu4myz71R7fCwzXH3/eJe7fpSzo3qE+e
         2YgSRwBFRsnpdRnsR9DIkfVll8JMPWvWHH5YU1xIaNVHJ8LgVL/xtpa8qPngFI6zotX/
         rQJKJKn2bUvtmt4ilN77Ye68AwYUdI369IL8BCVk+rvx83SEp7Hio3cgfzvQGMRdsq/q
         ARcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813514; x=1794418314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Abg28lnVnrSVBwieKb4OqCyJGui282X03edz+PzWfgM=;
        b=K0+/y3etVgpYsUmf02NwefBxWZKH3UeGPNwlt2LkxEdHLpEPaza1pYkUMD2LZ3EVjM
         ns/2UsD5bjEvTz+zjS/R6DEwD+2BLm8zZxGmsVnNrLqVlVdIH9br91y7NZVtZTYxmkYx
         cyM5+z+BSF6shdxwBg52kB790U8E3ZBD4Gs/yrN4B3AhQXbTgbOnFZVK2HbZlD6b2UwQ
         WKCErsgU2IO6ZXHa2jiWnXh9QiA7Hw7aFscphy2H+Nac0uu75OSYdgHj7mz8rV6vDgKS
         GHMvXsdCbjTneHVZbtnqAD6GIfXjVsJ+OUSIvsnkPM1lHwCiYBKyA8z+QC6csOfogY3P
         W3qw==
X-Forwarded-Encrypted: i=1; AKwUvBzE4YogJTHi0JLSVgmODEFSc5bnUAZvn12e+Xh/58+VLXBpbWnpJWVRSeyvvEBg7HEhq9W7lo/Hbd6OxOWkKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/onJynYipdXaaT6E/RWaMVoOOIo5uvTiDdzLe/27n7zRXZJDlk
	+zd7A0ksBdLCJiNPQo2vo+WsAvBshL9fgIL520wla4mhl45w5ZbTlCnUvzNTnPNMw607wiWHq3t
	3hmC4OGBBO3VFjIBxsAvA6eHwbpBnaW4=
X-Gm-Gg: AYBFou1eW5NaPOiQvbMCOTe7v6VTudfkQeeG2qJQ8re/g7HRQLopYuD81ZCrylDYPi1
	x8E+3lIbc2fgJaZRtsv2ZLZXQuyWILmNNSG+f219xqWPMiR16E3kjrwnyBUe6QZgTj2edVgktxS
	pfHmurPp4gCRgxRTVqDBHHjR7c2CpOUWD3ZRZ35aAI8s2mDp1FaqnKuZsE8xD8zH5Ym08v/H3RK
	Xi4l9MQpIqn5e4qWBChMd84R8Nox24PH3vI3tSNjSsCVMcxttR663PLGNmxPPdhY1EhWR49T5Lk
	p5nfTQK6laSxv/BNVbXZP8vFMFF2NbHmAiPeP3iEID/fW0SJZRBNLLA46S//nj4DoUDXbB/MW2B
	ds5QFrbSaT6lcRQsBFzGaahgL6uY4tt6Y0meSVRDkk2zUWu9Nb20Gvkcu4zhjgXYs5GHSKwiPUd
	DKXRyR1rtNJi8pIIIy2Hh8VpMZUPh+KsEPQr5hCZ6GWM68l7x0TltUfpR43gaxUmXaVZmOy2nWc
	cIJ8wFQuwZG2eRF1yLj5Ox6QT5a+Nfpn7K65Q==
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a4239cc86mr36378878eec.2.1793813513911; Wed, 04 Nov 2026
 09:31:53 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009224626.1331914-1-tomo@flapping.org> <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
 <20261104.075702.612319673416199209.tomo@flapping.org> <DMM6QD2BUR9V.37KO0N2MXG64L@garyguo.net>
In-Reply-To: <DMM6QD2BUR9V.37KO0N2MXG64L@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Nov 2026 18:31:41 +0100
X-Gm-Features: AclHuK9FrRNr4q16x-Eu4mbeUphxkQG67KkMdNwh5HAjF4qwyvnvFusNmvIGYZc
Message-ID: <CANiq72kEZ6KD618Zte0KRXzKyc15Z6tY+K-eQK8PO-48yYs5PA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
To: Gary Guo <gary@garyguo.net>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:42=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think that can be fixed by adding out-of-band annotation for these func=
tions
> in objtool? That sounds more preferrable then weakening the symbol.

Yeah, but just to clarify for future reference: this one requires
something else than the existing Rust symbol patterns we have in
`objtool` -- that is why we need either the weakening or the new
annotation Tomo mentions.

i.e. `core` has code after the calls, so what we need is to tell
`objtool` to treat the intrinsics as returning (which is what making
them weak does, plus avoiding the export for `kernel`), rather than as
`noreturn` (as our usual patterns do), i.e. "the other way around", so
to speak.

Cc'ing Josh so that he is aware of this thread:

  https://lore.kernel.org/rust-for-linux/CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS=
3XC=3Dda62xr8wiSxEQ@mail.gmail.com/

Cheers,
Miguel
