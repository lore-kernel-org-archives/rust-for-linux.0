Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C61DB54A
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321133; cv=none; b=XSurW6soR2IZVNSlfwsQBN9C/FwFXT+fK1dhxTlCwlQvResdOpeFyG97ZqtHPC2iSUvJh2bzOZ/E3II0B+GxgLNvQWeJqcxebbyAdeJor9umeyGIJujmTW71U/YKyP/c0UBXHBKYKwC27SjS5N7wrwHdMTPXFmgj0OFJ1C+yoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321133; c=relaxed/simple;
	bh=1wc8m9TFTwWpZqDX3T7GQc/8oAv0Crr+LAkxtX+eRWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5+TVeNSO9W1rC6J2cSv0a97lv6DynBa2ouJ1NBSaRJKqSG4kzKIEDlRsX3wb1xM+S4cFIGz2o89I8WkOG84pPzPL8lHqcvt2u6B02rrH1qaG6Jd6P67QzKmfu+lB4f+vvhMUh7FvY/02gApaCrR7NHg+K3Y2uLPUyWzwL/U6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJdel8IC; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJdel8IC"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e9f98d3234so208529a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728321132; x=1728925932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wc8m9TFTwWpZqDX3T7GQc/8oAv0Crr+LAkxtX+eRWM=;
        b=HJdel8IChjoLtTUE5ZwG7HSLlgSvAxNMxnk4rMQoOYJKNHwjwE/3hlkS1jO5xqAr2q
         mPLOykPbpJw1sndO8qYwGZ+qzaLi9b9y5Ibb38rlWMIHVPPM7ZVWQvTrUWXUlG+qaJGm
         FoFtnZRck1+lUJg1PrJGriXY8QGxCITqoePbWMp2AsLWET9sdlvo3SonfaZwh/rWC8Cp
         zKcyxKaYabHclhgA6kUDytLao22DRa2c0hdLXnw14YjI/rV7MhfKUjeQtV3qvjmbxebM
         EmuinXRZQhTo50UNQPXdKc4qUsn0D8+dNs/Pi755hT24+7Ritl/d7kqbvk71l4/kzY9F
         j5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728321132; x=1728925932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wc8m9TFTwWpZqDX3T7GQc/8oAv0Crr+LAkxtX+eRWM=;
        b=IciEwx3qfPe5PTm/BcUaOX7osz432oWkq1PLpQVoiCHRgfj8hZEjzqi+IeR8pOfFe5
         WM7NZTV8gUp2ng8Vs8dkTXoMTz1IECa5URm1WXyCHc2DRqCkUGejyYFLk6eSHT/0H28h
         HHhf+Z3YuVTZVVXsTfE4DxjhEqdLyaPeFYYU3fhEzNFdKyEd0a2WlaJUlYbTLP9wRolw
         siGkYBfT5YWnAWkebyTvtNUyd+pV0hs0Dw4w8cn0KuigoOvCWAamWhOvZWECImey2vRp
         lq8PbFzTx8dbi18AnByqTCJ4N9N7ViXWvxOJZQrC5pM7WHHpxQrpaRHC2xQ7GfN/dUpe
         nH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW/NxDJEQpwNuZwHMRktJrzTj1PhaDR8/7IZ/kNmJqUCs7SqZaXIE9iT3PbsK+U0QWDLsAGc1aHWlE6b3i8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YymuOFqClYqCh2MzjTCEp1ei/TbibUB8druxoPrvJFcqkY80y2S
	1ttKaogdkxcS/QJZCOMW0g5LVxHOEbxmLWciVyYey+XAmoO23XoVG1DbV1EVmCT741hDhYjy6xJ
	Tm1EYWo3+liOTY69jV+3z4H1unHo=
X-Google-Smtp-Source: AGHT+IEisR+qt4FNuoIXK0FTJFgcxm3aeIU65sBCQoQ7UDvWszf2pKq/cVYIeOJMSExx7cOUcol/RXQbOk1aJOnhNvQ=
X-Received: by 2002:a05:6a21:6d9a:b0:1cf:3b1e:ccd with SMTP id
 adf61e73a8af0-1d6dfa3a7b7mr8756884637.5.1728321131871; Mon, 07 Oct 2024
 10:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
 <CANiq72keixz_kVpUQMEFQcgewwrjcA_Od3E5-K9jF_UYFrg2aQ@mail.gmail.com> <d39bd39d-510e-4a4a-b883-e01e09583fe0@gmail.com>
In-Reply-To: <d39bd39d-510e-4a4a-b883-e01e09583fe0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Oct 2024 19:11:58 +0200
Message-ID: <CANiq72n6mrm8n9c6va=MJVz39+0ni3TbaJv66tnWx9jzNkj21w@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: Move unfit code out of `rust/kernel/types.rs`
To: =?UTF-8?Q?Aliet_Exp=C3=B3sito?= <aliet.exposito@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 9:30=E2=80=AFPM Aliet Exp=C3=B3sito <aliet.exposito@=
gmail.com> wrote:
>
> Hello Miguel, yes, I have double-checked and I am happy with the rebase.
>
> I want to continue studying Rust so that little by little I can help in
> the Rust-for-Linux subsystem.
>
> Thank you very much to everyone; you have an excellent community, very
> welcoming to beginners.

Thanks for double-checking and the kind words -- messages like this
may make others decide to contribute! :)

Cheers,
Miguel
