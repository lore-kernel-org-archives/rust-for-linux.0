Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022484BC00B
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823368; cv=pass; b=KdFHmHQ3NFPoTP6oiZmciiZcepfqC5GHgY9xusWPOxze9YycqT2y6Mpf3JCcX0nfejp9l3yqVVniEJzSEZUjAgZn9+f36ZmwmX1TIaTXElEQ7ziqVyK1mde1wVuJ+JiLZoFTLMnR8GY1SMGb4J0nSILCx5Ox+FVKpwA24A30rlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823368; c=relaxed/simple;
	bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zbss4ToRh9xIYPR+wYUv0kezXj2Nze9PQRQU8GkBkejhmUDB4zl6zD9rdYcSzX4AF9OHdaO/7f9LHUc6Me4wQMpKujTf9DBmzPKXnHCuwpTjeYClqXBQ6a51loS8HA0Tg5U+eUAAicMEEYfERZNk5Fxn2VsKVC0cRoQBGfGRIAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ut2bbDAU; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ut2bbDAU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccae46de39so1747045ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 09:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784823345; cv=none;
        d=google.com; s=arc-20260327;
        b=gPxu6NkRKJod/w9UBPykrQL17ENI2bXe1b7+AxjSobwX+RHpgRH8kw3oAQ3eESwRKR
         n8X4Fh0KbmI6jVcT83Iskkw69kfjdneNdQOrhvp3enk/YiSVL9nHAa5o45RspPa6FhGT
         aaantHAHEFWc3rVxBe0bsckhxM2740Tf0k85m4bgazv3jKozMECMjyRj0fwc5NqaDETE
         lcctSxelge+3yEO02FA+pAny9vU5cdHQfS8v4GEpXxsrIHKNnRh0Umbo1tSxgCoAgGoc
         RKrsE7TfnwkMVcwzITSM+h+5Bc5YKaqxPLGt6YX3WHGW174uIeijqjdxsqyJqEUF+nKT
         LH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
        fh=Tqb5jfHlZcMU9kpUA2Qt0Fzck7knbcOL0RRfQQT/Q/g=;
        b=K9sTWP8JWdv92xz0V7LuWBZsD2acFBY9JZx804ZE00EO1V7w87E4P2d+xJpdQ1J+y1
         iiQwgzgGBsPNVJBgHam/K1RdediXVBjvjNfH5Hn0ImcgO/C5AaQNVEgR7/ou78xbSXxC
         SH9T4ZZzGS64MB7uGxO9YlfBWrgbjTKW2mfBvToX5uvO1mQgVVQeLUBnehsnctO5FFq3
         ypqCDp0PflOGshiIjw59CqjTMHPF53qb47zwkMqCGMGA/KRRA01ZJTFZd7UsvRMyBTVt
         ivnSB//BuTEuuMdpoh8lOSVUC4N8cPiT4UG4mUlVRpTYYewwZ2meo3hMu/gdmSM1HCtp
         WThA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823345; x=1785428145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
        b=Ut2bbDAUQVTk/wxkTp0LIbFyymxoYMaCVVEJHerHzy8/yV4+WDp5f3qpH06z/CP4ze
         853f120RkdcKAjyxTk2knBtpKPVESkAslvuRTXLNtMg5xP6OBE7VhLqZU8Ffn1TxBDaE
         7GjSZ5hsMPzdYcREEe5JrBjZUj3AcgBcb3TDbFRUkesNzS0WhNw2yDUdxZTPiM9DDBgi
         XsxesL8c0rEcBBmd913EOM4u1+fIJObWk8ojSL1Onzk9Y8xy2xP4maNC+O9R+beselKG
         0yvmB7kUMGyIbOkVHuV1x4IFLwCN18ov2O2EwZLKyQb1IUMB7XrRVzUyuhBDDZtsTW83
         6Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823345; x=1785428145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
        b=PcUqSTvw0bkFzqcjjhqBJ536G25yzEdhKlHjMjnmBrruyvuEUzJSTm2ILODAUO/fs3
         TvQ6YuKyH1aUg0OEHqtciVINlC0vli9pz+R+u1knBZIXVObcoj/PZeJkmnmFyC6j3hvz
         2KFlRQjxNgCUtapSmeslWyRnJnK9fWDhnhHSNfTLe/0bOlz2IZTE84Qvv2Sfi+3rhwnv
         iGBt5RPb5SmYeKUC70AyvFGgTSTKdM+tMYGyXQoqMI+3yEz2Smbbt1g7s/csSaLrIzGK
         zECy02nFQefLMTk9ERqCSiDG53QJIlITqYZ2yn/2LVh+zLhoHBISWb29eMxAoPKRnSBk
         CdWw==
X-Forwarded-Encrypted: i=1; AHgh+Rrz95hDf1LSLGlvXT/ErfIeGYWq4AZi+9mkQ8ur5jcQ/vMk1BTVaTtbI/cums4wjX8OI4YU444dKk2YmTW0kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlf2YNQyq/RcWh7RvwHYVqMSRM7XfXt3LYweHdG1BgEYvwtEF
	b2WY4tDWzG6mrkG9EYMb71Ltf4CsASb7ekOAY90Jq08CCiAh3WZQR+aJi3SeSsRFo1k057E/HSn
	RhSQD8yTa+vNoKt9SwHdRMhOLwAr+EU8=
X-Gm-Gg: AR+sD12Z6IXL0kWBh+zwqlqgdYCbUpyv1ELAXCZnV+Wz5beJkrCCHrmM68tQA5apxol
	jIwgX8zY3IJEsUv0jjwvT/O8oQjI9P2T8p//FG4fQXlNZGZm17kASGpSo4lKeMhvwaa+bhPdXsW
	Ozryw6qSZDr5V6mgo8gWf3kjWQV1gnk0hZnqbnjp2UqhTXeqpNORu4n6JzXz1RKjNrrgoL6bZEs
	E0H7oNVZTdmRD5XszHHsKQYKyd/wQSrmL59qElqhdVISvMlrP0KVSq+QOPRSGMABqmK+Kf7QqSx
	5yYX38jHUsYjxdqVzwGgKJ1Ka86qtWIKdrOnSdE6tJNDt0Ce8FnZjWkTdzuxKrN8vrh5Z4+SonP
	n3g==
X-Received: by 2002:a17:903:98c:b0:2ca:6885:8a06 with SMTP id
 d9443c01a7336-2cfbd2b74c3mr2366395ad.5.1784823344470; Thu, 23 Jul 2026
 09:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
In-Reply-To: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 18:15:30 +0200
X-Gm-Features: AUfX_mwkPOgZ5l6-5ZKvWl3ZTUXh_wDSFE1Ix3DRe1vASO0ih2BX5vJ8dTJn36o
Message-ID: <CANiq72k34khi=vGRxge0sX-1d0+N0f=ixhdko7jqvfw1S4dsqA@mail.gmail.com>
Subject: Re: [PATCH] rust: dma: return zero for Coherent reads past EOF
To: git@younes.io
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Timur Tabi <ttabi@nvidia.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 9:22=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[u8]=
>")

This hash is in v7.1 so it should likely have:

Cc: stable@vger.kernel.org

In addition:

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/t=
opic/.E2.9C.94.20Possible.20past-EOF.20bug.20in.20Coherent.3CT.3E.3A.3Awrit=
e_to_slice/near/611677095

since it was discussed there :)

No need to resend, though!

> base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed

This points to `rust-fixes`, but it was likely better to point to the
`driver-core` branch instead.

Thanks for the patch!

Cheers,
Miguel
