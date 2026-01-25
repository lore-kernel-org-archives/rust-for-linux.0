Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBBE2F362A
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369337; cv=pass; b=jXaKiFw2ZhX4X5rDj+wIw1iq50/B8X51ItUdIKcWNpou9ue4KmKMcNoiSGGaIGa986UWfQHpaOtMTwGc/MTBGvJ9YFiznxE6x0PHzO2OD9kU/pmw3ZqMSWSrTQtTEw5dkIh+FDs0UdbVk7WqdYyttuB7/KHBiDtR7U9CYBIQZO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369337; c=relaxed/simple;
	bh=8pOcKL14tGgNq95iPvrL/GzHkB3X1hsHRYUtaIz9Lq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvytJpgN7AtBYVbmtGj9Ou9YRvy6hPMMax0fEVOvstY1xXss1sQrCIXZDMGNTgS1fye6H2mi1AoSHxAEKl3Wvf68eyBXCQLzHPoCOkDk56MxqjxYims24hw4nC8y5s3O311S68ockmBsbLjof7McNpOzxovRBGCARcOH1OfHKhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWBr6hEn; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWBr6hEn"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b700c7d3c2so103550eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 11:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769369334; cv=none;
        d=google.com; s=arc-20240605;
        b=Dg25lhIeZWSvqjbPFBR/3Q5rXZdjTwYUUgYsjnys6ttMPOnM/K/6Af/2igM90J5Jwo
         xOEL3lrfAY1T8nob9iUiBYaJNDmmy/2u5gMHTflhIbo7GaVMYZmBO3T0KlRwWmL7iff9
         5uHWmNu4WdOWDdumHKeMg9tdE5tnywDjj3ChjnBxA+ksoDSLW/O8Hn36wqtucN76vKoh
         vmM73t3YfaLOBdaf1VeQIVmQCPgz9M90NCGT6nZXU7Da1xvk4Qb7FHaGigonou+Jl5y8
         tOklKhyjvtgz7bbUn0JAKCRMBwPi761hfKerjf/9XwBlhs+wvhBZyi4U9cSqtnZnNOLO
         VNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0KQJAb+qDBRIACR9YuX4oaJxaPLkdV2uwaezIinAs6E=;
        fh=GKL8n1qWVzOgRotk/zJQHE2ISyCmURoQJjXa3+3Qtyk=;
        b=Tb7b/CFzJTLwnRZmUL0hln0MoVN3dxz9v5JdVCri2gq1fay7YRXRk9GymNgzoGO4wM
         C2AgN1Kf/dH/o+A0ehrTan+y6GkiavfTW5FvMvxEZm7JGA/RpRo58xKkjn/GWlxC9YMU
         FrWeHMP0NMX+GFE7ynzhZ25sJjh8/HUKewcJmw6PoIa3uDrzeTWJkk6bu7UHnaZ9q7pk
         WUXQ46+2QVoXwXaEaF1fPo7T4WEC41MluB0/jluRCtw7GwU6atMp6rJfS38ZMUxcQcBW
         rGpwFRl4LfUq9+NC1VEtS5lJIlz3bguv1meRcTjVcttYp6+Lze19oKEzI/CbckjYOCVe
         6ePQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769369334; x=1769974134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KQJAb+qDBRIACR9YuX4oaJxaPLkdV2uwaezIinAs6E=;
        b=gWBr6hEn0tI6IrSvGPwg+QAg4tH8G2RKGxzIywB+69eqwMu/k91SsQ6kCJSFQ/obCE
         9cUxZAvQdDYhNYqH/s6zDC2L0D8ueAizx+FYyEuRxhyz9VlLxBzth2+UgFMo6iMBD+3U
         3B9ckWWNJ/VN7G65lrLkOpjv5oobgqHdXp5hNLWeFupUj4+7JjYPNduq9UO/TeUSKcGU
         J44+ylxpJCfwMJqg01AZfu/Xi02c+Pye6PrpqD5YdfcKvaxGWxnYnla9zyherEn95pNR
         ca81pCTIj2NX88QJ+g8oibxfvYCdmUEhSlIInKNEteyTj3qDtH3EOaw4Yddq9APbDm4Q
         nm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769369334; x=1769974134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0KQJAb+qDBRIACR9YuX4oaJxaPLkdV2uwaezIinAs6E=;
        b=HmgGxQP+abHNlKPCLN+ZuRTlYB+z2KzxUMW6PTm2DldLzlcsqwg2vkEMJ0kD1yQRk1
         4EHU/KnKKgkU5Z8b51EHfXHMknZEwvFYrS00FdR/7zrH7dELn/w3HiJwD2pS0w55dCty
         iYiBwlTl7BheJzVntwPWyFws9hObGlw4AaA8blw0/X6P4HxaWVbI2wZi7IIWWJZhz0TP
         Gx53Ltq6w2FWbT0wJ+YVBEYH+kqS0W4jxYTg7rRjdrXeUqAXqf20k1QBEcQRX8pWYs48
         kJxWS0pa3YZY3aRohGWmY84YCzGyoDk+1R4yuirjXrMLwKh4s07pmnYCOoRotz28Qbvm
         OEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGAa3gPeKhygljiZz3igp3gCyVhwczS5VgomxPgAbx/qXYVw+ZEf9lE+lv+fbdk9yoyDCCBxzgLkErRe8QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnigRfeiR8768JQ1e6HNnv0hrhWHy9J2Ikl0Zdzp916ebR65Ev
	at/5mxbusycSQCGMHa1W/z21pq24RVpKCdV8FpfXnjHw1gUB9roIbUaCqsfRZTYoFUY14kTAiHm
	OOejw534qq/n7VXFSg7sTFskIM3BxvPg=
X-Gm-Gg: AZuq6aKOH/8G/ugJClPMs1kzEsQs+KPFAU7QdXKHHv+4bBo05FN7rKf35lxbCXmTF8A
	yQgRK+w+4ACxJfi/m3f/WXMEh51hqItWjNV+iBTCSLZ5mTCjD8aqr5n2qaWJfvsEJwca1Rx91NP
	CDBZCnrCfHaf/GjjhSeLoKz3XDFSX+EijfNOme9ZJMqH+2xpDqj7iBbbVPH4dxSfZ0mUiFr8Rp7
	rjE1luEa+SjKN+r8vcLu+8eKaMnzJVqn8ul/DgjPYcSHtzDoNs/jW+2ayyg6cpyBxOknqy/YRkb
	H+wqo0dWC8PiJOYs+BJ6cZDZksdcrAXx/envdsXP80EdE/mPQhQVReEaA/EOt2wrfnz7SZ52x1T
	bWPxR4Mxol+OF
X-Received: by 2002:a05:7300:6422:b0:2b7:1744:7261 with SMTP id
 5a478bee46e88-2b76412ccacmr568449eec.0.1769369334237; Sun, 25 Jan 2026
 11:28:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-zeroed-of-rs-v2-1-f89ff71e943e@gmail.com>
In-Reply-To: <20251031-zeroed-of-rs-v2-1-f89ff71e943e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 20:28:42 +0100
X-Gm-Features: AZwV_QgFOh6gcbuhR-5RQPCD5CWNvv46oSMWmL5YFImHbprlXgpFhBFTkEPczKU
Message-ID: <CANiq72kgqJPwpW5QRg1Xg0d9Dbhe1RKxgpqmp_9vH0xopWO6eg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: moritz.zielke@gmail.com, Benno Lossin <lossin@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 10:52=E2=80=AFAM Moritz Zielke via B4 Relay
<devnull+moritz.zielke.gmail.com@kernel.org> wrote:
>
> From: Moritz Zielke <moritz.zielke@gmail.com>
>
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
>
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Moritz Zielke <moritz.zielke@gmail.com>

These were also sent by Benno, and in the issue he mentions
"re-sending", which usually means just adding your Signed-off-by below
his:

    https://lore.kernel.org/all/20250814093046.2071971-1-lossin@kernel.org/

But he also mentioned the Suggested-by tag etc., so this is probably OK too=
.

Cheers,
Miguel
