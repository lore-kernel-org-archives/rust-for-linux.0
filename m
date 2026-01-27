Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640992DB7B8
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769493413; cv=none; b=MCo+b2pf/MesdiH5CQNoQGUFAatHnBquDE+aZDRd+SttQXT5cUbQQw/0DbAEFKBIink4Ud5yl2sXFnVGhKwh4CHgU21RcY/rt6S5goyr/9k1rJfPogV0XY8Q5RFoB1/v11yZ2Dd68jJpPmQCs97ilPycs+DkBTQq63bETSjunFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769493413; c=relaxed/simple;
	bh=j0vZ6Q4EKRxXa4qzSSiF565beROQN+SYo7XhjBoj2a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzxVAqVj5Y+SKmjfzf9V7txIq66S91oYS8SQmG3HxQD13Iw52SGp0aVLzADF7/qGoeKo25JgQ6km27DLAyh5O28ORmwkri1pNXwdBu18HkPYqOVCoQSQLSbDKFf2pTaVIH9RoDyUh5BC5vzM8dwBnN73TQVmEpwG8PsxT6WXx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649523df010so4724946d50.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 21:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493410; x=1770098210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWuoa6jyT2ZRnL9RvQBPgOBuuHBW29UQFIDur9MA4VQ=;
        b=ecZsOV2SP8GlncB9tKdXYd3QOnq+4ygqm/RAEvKE9k2+boe/PflMPByaxC4gtdX8Y2
         1/JqMMKnMPjcbhXyPC2gqT+t/8yNXUPiCZxcEqXKswcN3yXBS5bTFjeSa1ri2oMbnLUK
         OGeNDnCFm1vlYM5N+KhXiwLVWfWOpIB4FU2Zh2oEIZ3GTRnBPqOStx0z5Di09SvkHauh
         nEFWw/HoQHe0ZwmREimByH5rwSXY0ye2P8X0r/6Mdmo3U3oFzSjAmMWtHTv/vl4sZv1t
         tai8VdWiamGjBvubW5s91nDzz6vepJWJ32bzo7KjqDmpvaHl8juDRcnuBA3DdXdn8RGr
         dE4A==
X-Gm-Message-State: AOJu0Yx7eKkgNeFSAcPibcO9e9lrhWNQLys0gy+kJVWAwX/9F1Pog85z
	D9psUpj9oobmpZvzeDGU44/w1251LT4GxKMtzLoyv42dyOF/n8SsxVX1LAzlKOsR
X-Gm-Gg: AZuq6aIoAEmgR5qyz2uuEGsF5sKKAurPA/UpDS5NTPx2Z3qjcvTQ8Ca0xAOlLma+WwM
	hMvppEToP6OUJr715ZPKcp3GvkKeZ37uWT0NBO1duU0uiNBq68XzLwOjssxk33Js8JTngEaKi7H
	gz/oRB/d8g68MnkR0VpYoV2n0JBDaXXZaMsyVLedRvMXRGFm9ikl4rX9ezwlZ35GOzTAK5u6PFi
	B9eZ5egpEg57PFguB0zIUYlQdd7WhdeVbSh344wCx36xRKjSnxtZ96s0Kowb/b/Dpf6iGxJA3hC
	XtpxG3WniSq8kaX85oUqsCWdbJhjxPRS8Easy0lbqD5m8pcGNSu5TVngMxgW1sHmxMSUG46u9Y+
	BjFRYHraq+jqMtGoB7jTgVh0055NKdlAdK9MzpwCD6rgyT432Mc9wn7VPivzZE0OB9oRldpsJCm
	BlmgLStWcqTCO3VrivvFHm+Ne9pU8DVeTDhSTj7dNos0GzRAnKKKlP3r45LQ==
X-Received: by 2002:a05:690e:d8a:b0:644:7822:95cb with SMTP id 956f58d0204a3-6498fc461e0mr280395d50.60.1769493410455;
        Mon, 26 Jan 2026 21:56:50 -0800 (PST)
Received: from [10.0.10.3] (2607-8700-2200-dfb7-0000-0000-0000-0002.16clouds.com. [2607:8700:2200:dfb7::2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6496c4d4244sm3873434d50.16.2026.01.26.21.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 21:56:49 -0800 (PST)
Message-ID: <40cb01ab-e165-4f21-8e66-d003967d91db@kylinos.cn>
Date: Tue, 27 Jan 2026 13:56:43 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] rust: Replace unsafe core::mem::zeroed() with
 pin_init::zeroed()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Benno Lossin <lossin@kernel.org>, Atharv Dubey <atharvd440@gmail.com>,
 Moritz Zielke <moritz.zielke@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
References: <20260120083824.477339-1-sunke@kylinos.cn>
 <CANiq72noQv1rE=13CP9Ci1WAUONqN0bqq-z1r75n_572ZWA2Ww@mail.gmail.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <CANiq72noQv1rE=13CP9Ci1WAUONqN0bqq-z1r75n_572ZWA2Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miguel,

Thanks for pointing this out! I wasn't aware others had already submitted
patches for this. I'm fine with any arrangement, and I'll check GitHub 
issues
more carefully going forward.

Best regards,
Ke Sun

On 1/26/26 03:24, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 9:38 AM Ke Sun <sunke@kylinos.cn> wrote:
>> This patch series replaces unsafe core::mem::zeroed() calls with
>> pin_init::zeroed() across multiple kernel modules.
> A few of these were already sent by (by Atharv and Moritz, Cc'd):
>
> https://lore.kernel.org/rust-for-linux/20251129124706.26263-1-atharvd440@gmail.com/
> https://lore.kernel.org/rust-for-linux/20251129135657.36144-1-atharvd440@gmail.com/
> https://lore.kernel.org/rust-for-linux/20251030-zeroed-of-rs-v1-1-1c46d025128e@gmail.com/
>
> In addition, they were also sent by Benno, and in the issue he
> mentions "re-sending", which usually means just adding your
> Signed-off-by below his. Otherwise, if he is OK without authorship,
> this should most likely have:
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
>
> Cheers,
> Miguel
>
