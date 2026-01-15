Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B2B1684BE
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503836; cv=pass; b=I8BVtrz/ChkmFPQsdstPYjQL5NdvB5qSsDhbDA4xPlL5NGVsusgjCIO9GJip+I2hF/ynz5Abi5V3fJVQCswrA2V2xWRVjTala1//XN/UNZ63GFofXZ2uNi55fTrnBbtsKSqPsMyefiteXlhCKMuGglY29YGgbX0AtLxBJ+fPoIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503836; c=relaxed/simple;
	bh=PJG5zowqE5S4CFP66xSdtUD+P4Aqans9d6RFVjk22qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcpfNFGjhKcV3MR1yo4NdGgGbOJn2tnlMqeIwJU5FdyMC2nfoK/zaZW25hX2rK4yc8l3rlVTU5mIzADy0NN7QV3ng2Wzak+WSVKU/Srl0N+YgCYRZEW+nbuANc7RNxboHwXCVBrBUapVDTtsDBQFLwyuSt58rKEv9zWU8HTYaEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlpbhXAl; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlpbhXAl"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b1161400afso105284eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 11:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768503834; cv=none;
        d=google.com; s=arc-20240605;
        b=NLCOzHp1cmh8EYAjt8BQFiztl5deeZGgeNYAfnpdtBXpywQkXbyYwYgZ0/OjuOUcrW
         6XPkdpKjsa6cpO0t9W7U5LCNj30w2c0DH8icfnvAHQSGG0V+mu7IKqygBA1ze0TToSCJ
         hV4KM4cc9Sv+2VYmaXuvh9KAqKKxpQLoqfiTHIUVnHMmYsPa9Sm5eK4FNivG9nl8yaGL
         4rvZaV0ePCjuSbr/6pPrZI1zjNXQxnDOJdiyh3z1KxfvwhRXVwmlGWoNDQqtkxkSV4Fa
         pgBHDaRaf7dVNtPgzwTrziToYBQv/mGTvKfhoRqESIgPsdKZXEZ01NjRw5RdXF7Jslek
         QaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJG5zowqE5S4CFP66xSdtUD+P4Aqans9d6RFVjk22qs=;
        fh=a0VHWU1k9ovxcqbSOSDKHTdwJIf+jhavzMQyLoEugCs=;
        b=Adhf3YdMXzTjG8VHP/XVHWFM60e1/ducAJsIK1hHKEXPx6OeEOs3/UmBgukrZWN+E/
         gHkVF1Hb1EepTtwePuoEEGw28HcuVF+POAGGhbpbjBR0CyeExyd73j69jM1elBTiBsBl
         3KYtcxlbBb2M9Kpxbv2NIuirt/gq3yUaxBMm6tf5dQLnEHu6GKiLhOcV7+gzxJkHrW8m
         ENvduQu2Mpy7HlRD0x1Cbjl/HDVCxr5XAyYizqEGtvD/0LuWI5hAdrvGb436BK0lbO0s
         gNVeu+Q3sfuCOQyYQgua700i/25mngyE3w3F+3BLM55ir8e+4U1LFRhVRGqz9BF9/X7z
         +vEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503834; x=1769108634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJG5zowqE5S4CFP66xSdtUD+P4Aqans9d6RFVjk22qs=;
        b=RlpbhXAlGlpRLy6H5uMcULREoXI6UPGGoY9f/uxvREhHmRTSLi2zv4qeoZos7jEhT2
         vhvqKcCprw1IoBCHBCHE7CguUmSqPo9q8Hl0bvO9b1Q0PDzgVEbmTtuN4zCp8lCDw95l
         9/Do/2/Nf4afPq5QsbnAIQC9pMBVPL+9lb3Ym0FEz4ytRDFoMgR4aTH1zZ/3kzHWbb9T
         2N3MikoM5qB2Dg88+VB3pty/inl0/kCuzcYLMAsB6oVm71A714WQgwk6c+38gdDg0OkJ
         JpE7Jc+eK6sSoo716MjdG9R5RCiYbRQOVYhBPcvjufFt7c8Hfg9AqnSKDkqhiHillhtb
         zIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503834; x=1769108634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJG5zowqE5S4CFP66xSdtUD+P4Aqans9d6RFVjk22qs=;
        b=eARR5u1AHr3gz+WcV+e9/3F6+W3UW26HI/Xuyra38eRcsj+lb+Vqs/oR5MDFwcGmbd
         6te8uMINVMSLdJ7zzGfo1qT9Xy844l4sLHA6tmtWy8D1829UJiBpQne6G11s3tjuTQxt
         8L+9VhCY+sW9PWcZ49UBTACz7Ed48VsNNEE9nH/AF8BrQNzgh+OWvzIAGq8G4e72l+JB
         xjxdjSrOknl95NnoS4SdGqd/je2uow/fVXkvlXh8vkCfVDwz39sP97D2rdiNbBoTZw7J
         ABGPZn4XkCV6+Rn+gAQWy86+jUedDBdxslyZPHHTuH4Et8/UMxAy5PuGwC6eL4eQa9GT
         qvvg==
X-Forwarded-Encrypted: i=1; AJvYcCU1h0b+8OhKWYDAJDqY6yj8ln1WEB7G0WDbFgOI7lHx6huYrUEm8ILXFX7EFG/w/tTFzIhYj3yQ0IrmRTHtgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8/pAHs7gDZHL1M2KMI2ZABz0DLq+eLPwePPLio6TgpE70FLQ
	Jy25x7GJ/CvwCgwm4w52fbuKhcPoahETA3be3fXJeum9kHLfF8L8BY/2LhzDgKzLZ5v/8kvAdTD
	pdTP0cbh7c6zXS1tLxTh3NI0JVg6KzS0=
X-Gm-Gg: AY/fxX5kjmi53uEdknt6dgPWMJ6l+98fB+Ji6hRheL164jaFwhbRlcCo94qUwOnrSdW
	gBRe6TxAKFeNk+09C8xBKWjPqEEkRhOjOx7Xf4cVz6KOQJJOKuFMbcm5Xz7Js/1VL4QjcBh4VSO
	bot0l2jcfzyQz7awbgMSF60t75h/EHTohacKVUtDYfQdNXZtQgpaXJ1CguAHv6eufbDBFYGAZn7
	3Vti2zqztx765+4CyXBdTjpKD92HL1prF51hWPYL1PxG9DHktoItt9n8+0SDEv5W6oZgK0oC+AZ
	+rSZQlDU0REqYa/27T1qnlGK1cRP49VuDiJJPkRF5113jMiC474+kVLqmyXCxYH0VTDcSYrawyn
	GFjYhxr649IQh
X-Received: by 2002:a05:7300:1489:b0:2ab:ca55:89c9 with SMTP id
 5a478bee46e88-2b6b40ad811mr282460eec.4.1768503834272; Thu, 15 Jan 2026
 11:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org> <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
 <FD404241-143B-4B24-B8BF-3D121073F4A9@collabora.com>
In-Reply-To: <FD404241-143B-4B24-B8BF-3D121073F4A9@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 20:03:41 +0100
X-Gm-Features: AZwV_Qgwe0poCTPrFBjzUTnM8YIu8BuseO36ptbkGu47em9bEKidadnJcqs7gj8
Message-ID: <CANiq72kaTyiGhp6wP5eecYSSkLGjaOtGmf3gY9hjpz4DOBzdfw@mail.gmail.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	felipe_life@live.com, linux-kernel@vger.kernel.org, 
	Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 2:45=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> The flags may be in your uapi or they may otherwise come from C. In that =
case
> you=E2=80=99re stuck with a TryFrom or a manual conversion.
>
> I think a generated TryFrom shouldn't hurt. Just my 0.02c.

I would say let's land this patch as-is (with the doc bit I mentioned)
and then we can discuss additions on top independently.

Cheers,
Miguel
