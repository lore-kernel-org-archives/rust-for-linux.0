Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8143DA56
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 16:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749593; cv=pass; b=GtBRw7hZQO57oqm71rCTAzGcbaR7H7ApYn7jQSRTb40LOVNg6Kiw/dZQttN2J6O5XRg1wZlNZN9yJymka7caJAnpPJh0y3vMUiciO5RY/g57ueLUQun4SBkSMPKW5HMcj5TO8g4U1Yimkfn9DRyxCF65D3r9MKy7tN0tr04pezU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749593; c=relaxed/simple;
	bh=Zr/59I6N6ptTDEd0LX/b0l75RzIu1z8gY+Fil2QrUI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tHekhct/LO8x0GAo0Xrwoh3Jukx6a8oNWxl4xPbMfGUCDXIKPgClFj/kC1PaaBuheFjT/Gt4M1II3BNJQQ6OWXDAxKeYKp16AXjPhnczVPx3Mgs+5/UFeQYejrRJC6Nb+qxQjrYIGYXSkISeroXQo/hH7b6BRtqgEDl89COJvus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkiO/E/p; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkiO/E/p"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30caa24aeb4so261223eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 09:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782749591; cv=none;
        d=google.com; s=arc-20260327;
        b=cgGzLAdDdak+SXzWIt8CeveC+XQtJBWRW8Zi2AbAHRHLKi0KgPo1ls9/7GhJ8QK/3k
         Ek+bxuA4uty5wynF4Zp8vWowKyApjxRpiyLQ2Znpulystz8WREMnmJvYkfP0uFZUPR3G
         VxCvlpZgpEWxyRbFJci/ieV0mhIj0i3EyaCUwRW7e+ji7NjVyO0JPHI2aPXMBglsr2ct
         gSMET47IBR//+MM4cMoV397UXqX3B8mi0Y2QEdSeMCr47OGcYs7/YxfSq0DFkQH/g+KZ
         BtTKUsYGEZDgdIPa0UaWpUbArfLoi/BzzWVjGbn8sjN3EN8Ua8zJB6hDQ8ldV9ucOTEJ
         rP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zr/59I6N6ptTDEd0LX/b0l75RzIu1z8gY+Fil2QrUI8=;
        fh=ZRZB+9TyAZKLFnwK3MRN/RX4AUCEoFBrdnYS8eK+J7s=;
        b=m87w2Ddp8RGYGMR2s2+7YtWeN6ETndN4o+KJZpgjnIaXbI7o18g8T984xwbLhqJPib
         6iQfz1sKNMNcJvi34SHdyyoUAsWjTObeig7KB/NWVn6z05NKSBwah15jP5OtwpFXEts9
         TYNhvXM5Ku5PEahGYjCXFZyP+nG/v8ZR4fgIpgEmyhrZaorHKU7B9VRuenz5QVNc3VCk
         B8f5zWNeLS0SOZzOvFMTykeerUblhwqLUMw5oLNOM2Zt1b5ldDyM0Eyb2Yg069BR208p
         mB0V8HpQtUTD0XGC8fSwYlzz6O2xs2y2frCDKFgg/DKgtIszrAhddps8GqdAiGIZgrz0
         Bdow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782749591; x=1783354391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zr/59I6N6ptTDEd0LX/b0l75RzIu1z8gY+Fil2QrUI8=;
        b=kkiO/E/pHx0GddepDiu2SVbjZZ08apP3ZZwkgXZgbcjl+gHjvsda8P7RUExiuiiT+K
         MblfoMNcIYKr5gk2jhXOCgoGrgWSkS0BTSgcNru0Xpwj3+Z7ixSv6dKm391v2gjctICc
         NHmxaahTRgmCM98PwBbQ/gE533YgjR9zPzZGsW6KhceHJak9YhVvtVZnsoShfAu/ssIB
         Jz/s37hQD15AOkM/+/dmKSnr/otzHT69o7hBazv8nKA0LCg7N1CMk8ZNiU+SftdKQQwh
         fA+tshYhWsl7Kf5dbHRLco0pnl2wVUXvhTcc65ThN3wQr+6AFzJkcTIaVDLnBqwLFXKE
         914Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749591; x=1783354391;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zr/59I6N6ptTDEd0LX/b0l75RzIu1z8gY+Fil2QrUI8=;
        b=dadhFlOj6+qSue9wqzKZoOYJOo2Crcirt7+qd9t04s4nLOsizXr4SK/ztabHN8YOSg
         R9e/fRQ47DXk8Vzox7oxEuz5EUFD3VjFBh3bLhBcfuOsIkkixqiNbIKxAj40ufIt+40A
         9nPM2OBeyVVntyqPj8T7kPWrG42aBFXScfditYmqtnDc4Jj5TgliNZjLFraVUxXWp/8d
         YtsQJBaNmAMaMEV69lVhLgTe3UV0/noRIAN1EJAWbJyCYrcmscFWlPcK8O6/3TdLj3v+
         wQkqIgZ2Om40kHGNmAXvx0yJsy0R6L2GyShZqzzFBVyCE057VSteotHt8JAN7nc438fC
         yz/A==
X-Gm-Message-State: AOJu0YyxxA/QbiXin79EIa9S+RQIZB4lf9MFKn4MHmhbFw52npRM4hpt
	MGSefo2vdHYStxc0zXWtg4y9YxCEB2e1qwZV/WfyXXILRdu2bmp+UGoBGrtj7hXiRhz201/SzRk
	wME4QFPEK4kuNFZFIAzH5xLSqwH8dec6n5Tf6Z+0=
X-Gm-Gg: AfdE7cnXwKkeQxgIPRmrvJL6Hzj2RIaw03qMEe9HS7+ikJK677dQnwqgRgexwYTg6ps
	rv/eQh2yu4GGHtnXEe3KAnAZG0Ox/Pw2WrMl9/Ib4WQlN0Hzy/uDvoMs4LU0VgghTBV/4jDEFvs
	82tY+3ZIG8Y6+20hzUDee9yy0Ci7f384l7vpWFJ2KaVnotb3rAsaT6ec2fOWR6gj2fLWU/zCAAC
	pkZHQ6+AVnqEkujPmlpbYTaZ5i1edXebwz5gT2DW5GA4ToMORxjMR/JKyAetGcqNVI8W+MVH8sh
	wjFl1grRrmTrpawZ3YD3xI08luG57cFrWRI9puHKeefL/g8Tl1BaRhvlAr3XL77+VcxHh65z83W
	3ji9FfTXUftx/
X-Received: by 2002:a05:7300:2213:b0:30c:39b3:292e with SMTP id
 5a478bee46e88-30ee14c8c2bmr26951eec.3.1782749591003; Mon, 29 Jun 2026
 09:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72k_TgVdAEAQUmOSGg6NNQ_AatJjhLV49s8VaQLsbSxBGA@mail.gmail.com>
 <CANiq72mmw39gNTOv_pJc0VyWEQXsZwC0c+Nd0FEtG16HQ58Mog@mail.gmail.com>
In-Reply-To: <CANiq72mmw39gNTOv_pJc0VyWEQXsZwC0c+Nd0FEtG16HQ58Mog@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 18:12:57 +0200
X-Gm-Features: AVVi8CdpAz2DS7ScGIwXtrltbRv2yVSc6YNzcdkcu4dsWw7q-6ka-Nd-qwVIkV0
Message-ID: <CANiq72m2EA5mg8wAP0Qx_i6dGCN-=a8mvM9qjf2UG1SLZOthkg@mail.gmail.com>
Subject: Re: Rust MC at LPC 2026
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 3:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The **deadline** for submitting proposals for MCs (including the Ruts
> MC) has been announced: **August 7th**.
>
> Please note that if you submit something before July 10th, you may be
> able to get into the pre-registration phase -- LPC registrations can
> run out very fast. Please see
> https://lpc.events/blog/current/index.php/2026/04/06/changes-to-registrat=
ion-availability-for-2026/
> for details.

**Last reminder** to submit something early enough for the LPC
pre-registration on **July 10th**.

Cheers,
Miguel
