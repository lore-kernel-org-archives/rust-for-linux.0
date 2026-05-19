Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59CA394781
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231191; cv=pass; b=fTecl10RIpRKO6MofFkPWPoBO8z1xSyC4hXRf+1XMuGcXTsDs2r2jAoi/KCxD+hyyRzoTD/z73tLswnqeaE7zU8RnJ1MXjgb+WOu1A2DysoSNW5bzVP3cjTECrr3CUvPzbyY7OZ8AQICKAH+3Ofwuwr+tJI17hOdWNC55qzlvag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231191; c=relaxed/simple;
	bh=FfrVHruSIHTW/tC8Unpu44QiwAuDhvx8rHeRASS30uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8m+CqZYBu4WVlr2n5EDyWY7EDrL/sl/cwqF6G1gkirtqewhFGm4ZEnfyWO68ppe6OS4ueCXO803SO4rN43EvrZ5d4JiOLL9hRL+nebW36faa1f9ibOiDecGQd3YXbOTe7M3PTfwGUrpaGYBbOUjEOhew9hHuTPzs1ErpwJ1Hr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGjn4AU1; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGjn4AU1"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f53c6af46eso302561eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 15:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779231190; cv=none;
        d=google.com; s=arc-20240605;
        b=Az01gvP5r+gWacMeEWnM4aYjrZFtSDg6/nsjD9lcDKmGUnwbvgaWUX/bA7PlpF2ViW
         V8cBtZ8V5Q6PMW8zP7d4AbFIiJef6rO3JnXpo0znlC2fnAjnS22R3N0Y5u2EapZoS1n8
         XZsBW1EAZcvcWEwijK91vr3WPg8Z6+J6P1PXwZoTgOGgYh7fIng3cS8bchOy3cinzLHS
         nmp9zdBy8y5NE/eg6ofm5vipL/M5mzb9bDS7Vq6e5t6dLJ4GxAejxJgXQCp9WsqyamxU
         x4xJ2d0/NXhB4PQ4jjXQlbiWO4j71qRLgJES41iu0RiAB8lLXK3lD9Sx+Xw+AcqlGR2S
         LrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RXkpOFsyf+3ieiPqU4mPJB/HX85ZzNVTFjpr1O9pArk=;
        fh=yGN+m1+8vV6CUh+HPoGWVuAakz5C6TZRpHYZsfyOcvk=;
        b=jSngd6VEgZNe2rJUWguSa2+8RxFzAjqM7122cXd4EEMm8daTTEzWuVdubZhqIt8M+J
         t57Gc201tARn/1g3CCaO3mfJLIjR39NHof5ospzvuIpoV72mMSkIKoiTbsWflkTuuENw
         326ZAJJ7tNutBWmtWogorixzINcTvTeESYKt80pvT8uUhq7IJI2+hYAZQtRQ3uVSaDR4
         QLiPVHjw6+FZI/+4KyS/RtU9A5OOaaly4AC27wap71WsYGkH/+VfZeR/KAHOEEp9mW4g
         0CKCG8H85RgN+NimtqzhxA1peSYVUv/ivQhxsFaSv7yJq5QR5Kd7s4rVqd6LCgKdB/ZA
         qlew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779231190; x=1779835990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXkpOFsyf+3ieiPqU4mPJB/HX85ZzNVTFjpr1O9pArk=;
        b=XGjn4AU1yKDBT1HJY4dDcrGv/TknpbAhDe3XwqYZJUfXuku6Ic+W4Wg+uw1WUQDG3T
         eiuMZBdHh+jwJLQnklny17AGBn10hT2TC4kwrknWRG8ofmvDGoUTvaDnD0yxl3v4ekBt
         qcHiTQnOVz6h/UnVRn4MZNrfmB66rteF7DGLh4QsD3/vRyoS529dAw9//Ig/ZbMoRCfw
         P8Xm7loST3xIuJWuvDkTb43mpxFjD6lRgv7LrjLvYLuKT26H3t6b9nH9AK+MDQZIDeV1
         dHEl2RGP9ypQdTLalvBhlcgog7Gt2JpEEimFv/2/iQ7d9dIYSruBo1C+0mpt+aGeyHjC
         VhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779231190; x=1779835990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RXkpOFsyf+3ieiPqU4mPJB/HX85ZzNVTFjpr1O9pArk=;
        b=RPJiM/2F3N7Xzvv/8dehbHcAlBodsmUmxPBOpwfcnbOBxYIXVRmrvhgyvmtc2AE9N+
         FKSkM/HOxaCphVdcoToXA2GwmSne97eAEy3A6D9PejdYPUb3ahU1LYwTqN7O9UG1sSva
         03RaDnlZVNUrQcNiYAYBiNL3XbujgWZjdy6muqbrIoE2tACxEXxiCYSOh0MAP9FNYGEL
         42AksTFVQNCf6yXis4iQ4xPFSsZxkb/5MZNqZUOISxwuH4XpXSqiv7utl8L2jw/xKu5V
         00IANQwEfxc2TY4KL6buHjjeNvrzKOVISqHVEN12yDXVVkMop/mhA3GDpwtIPIDCYPqc
         Cn7w==
X-Forwarded-Encrypted: i=1; AFNElJ++jrZPbwavHz5bmZ3AIxiaWSxpx0YOyQPLZsInc83gpxvj5sYWOgIqQJJXbNW9VH2JwN6bss9FAD21B4f4Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AZzvfvqCoiMPkloOitwbpKBy3QIdArUBqyfNzrm2zl4E7d98
	ap0z2kU4gIYI8woIHb7hQyUPoJlgrgCsFrsnn/2z0O5ELodAtbh+WDUUAMUqAlkPKSRznjPcTU0
	cYxRW9bVPvHH5Sj3YWksL+7EYzpTMhCB8uIFkdF2htQ==
X-Gm-Gg: Acq92OHtfyRn8ucB5mraL1Z7Cd+fNdauOFSP9aMrTHeYMb5FBhTtaNkzCt36XThDXmn
	ePlpEMRwXoDrPdDcgcr+uRzNG0OcpduGVqZ6glgNziF+JQMwCTxnXn48UrLXjqnAZJNaUrTB64j
	EBAqc8/vjsDtXRSlIq8k1Y4E37AQfbb+6IEwmi8pbQExfAjDyOEasFifESUIuz2JmJpqLubUdrl
	LjdOyGsX1YYbOMNdbVeTqgXBf/xfxNAAMAguwrHT9m57Q1m/JGqjpnJv9Gpq/S8c593mjQWNxQS
	AYrgpfB7+OylvCaqfEz82wIrj+WzhQbxSO6VhbnLccmccREu7TGghVGzA/WsR6PVtVm4PpDMEI3
	Mn3MgQ3OhlaYOFf2pSqz486ESLMHJkOpbhQ==
X-Received: by 2002:a05:7300:dc03:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-303986626eamr4433117eec.3.1779231189734; Tue, 19 May 2026
 15:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420161636.1790502-1-gary@kernel.org>
In-Reply-To: <20260420161636.1790502-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 20 May 2026 00:52:56 +0200
X-Gm-Features: AVHnY4LNvhI2gM43Lr41nxDvAIBrDV2IX8LDxon_KiLzIYHsOKko4sW1bWKGAng
Message-ID: <CANiq72mL5TfAoTeL-GZtdsH_Xrgn4c54QicAyuyxxoboR3EN5Q@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: disable doc inlining for all prelude items
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 6:16=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Somehow the rustdoc heuristics determined that a large chunk of the items
> found in prelude should have documentation inlined. This bloats the
> generate documentation size.
>
> Also, for crates that optimize documentation with `cfg(doc)`, as the
> documentation inlining makes use of the metadata compiled by just rustc, =
it
> will not pick up the `cfg(doc)` attributes from the inlined documentation=
.
> pin-init for example optimizes tuple/fn rendering using the nightly
> fake_variadic feature [1], but this is missing from the inlined version
> [2].
>
> Thus, mark all prelude items as `#[doc(no_inline)]`.
>
> Link: https://rust.docs.kernel.org/next/pin_init/trait.Zeroable.html#impl=
-Zeroable-for-(J,) [1]
> Link: https://rust.docs.kernel.org/next/kernel/prelude/trait.Zeroable.htm=
l#impl-Zeroable-for-(J,) [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Reworded for typo. - Miguel ]

Cheers,
Miguel
