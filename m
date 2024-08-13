Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548141E4A4
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Aug 2024 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554894; cv=none; b=Vjv8YxaIIAzGSolgE52NBriDF3Y+HRptK5rBL77jgl/wGXkjx1EDgYwLcSxrblBbUJcl3nGMumAuAuCmasc+0RbnFYqQGg0pv9Qy6p69K3KZ8/uh6I5RFhZ67vaWHfuHsKzXPZqnrYQt9VZWxxD8Jg7QLPj5QqEeqtqOVW2uzDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554894; c=relaxed/simple;
	bh=iTanca20aTnvzpeSqKgMeeeuslPMMxRHtNEMVUCwuAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlvWFWhrtfQytsCSJULLsii5tpZ4U4GnBJhamshMKLxUi+cG5wKWtHa6SqX1Ijd8eUaE+Wp2U6kmOZPcg6OFtMyLGCx0jv3OQ6JK8JguZD/BszhVZ3mrQdqqzuLdvmGzxDjEi82mviZoo0TszzWn0ewCnktbv5AQXm70Zt+Uo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF7tShVK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF7tShVK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7bb75419123so3623723a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Aug 2024 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723554892; x=1724159692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVZsuGo9TwKzewcpa+ZmJTrQNsp5iLLApBrOSTjGtbo=;
        b=eF7tShVKr4ASc17iWy/J6DsyxFUUL9c6z1Vb9DycHmmMVlHFAJQpvzWyfkv8p/v2Ca
         GejQlvsRbrd7fShGxZd2wyCzzY15PAMv2DOpj4WmUxM348+u332Z/IOH0XLPfAbLTSeu
         aKyMr4D1mcMIUPyo3RSVzy4ZZPW0zcBUF6YL1+vPr035iy7TR8LnNFgPNREaIqSdWuw7
         91wBBrXB89cw/cJTEsrcB1zfr6DtIqkB3BAVCfxQgwcuEsVR9nKoG+lwJ07NmmE6ZCTy
         +Ufo+L/nccX+sIKAIyWZCNLPIT7QfuPVTaSkS9fvs55Y8LqUtghksgW5lEtHvkHxVpnS
         BmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554892; x=1724159692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVZsuGo9TwKzewcpa+ZmJTrQNsp5iLLApBrOSTjGtbo=;
        b=X+lefJ27r5tNIgXvCvUkcx1w3zrlQeo0DvQaYm/U3zwJ0ddVHLOOFvXLED1qcJQPoC
         fgr13zYIOXRMFDdH5FG/UJ4baiBQsbsGe23Q93eM2dpAcTY/0RId78yiaxU1M9C/1SxL
         qgsWXj4uF05zcem5pZpSpDSAF9QRwvewjyme5VpC3UZ+c6dEBDCKtmbVggPnfUC9P6NQ
         q6fpJPFcqmF3SIfF9ID3TorbCZOecmhgsUMqIUnwKBtttRBFM/ZPlxGm1kSD1tiihMDk
         4ExkQVGEfvrDHwaP+k1oClBqgrNJVn63wMiQ+G9FFcfEX09AftnzEdH17vAG7ln1rvMy
         xiPA==
X-Forwarded-Encrypted: i=1; AJvYcCUDzlhRqkJZ4GqYrRXCuJIxM00wDGXzU0mBuUJdHr+//F9b/Ck/wQGvNtXE3JyUDmsVZX/L+TWlYNofgymfia4gwsb3E6YhhO/KQjuifV8=
X-Gm-Message-State: AOJu0YxIRp4hSYsnsT5UmVKvhSp1pu4/WpMzIxlbvCkyau0MHNhvYCFL
	rhCLmE4ft1WqBEvrnpxi5Rt0Zs4mpNyCfapwXm8HW0O5o4yL7tbel6DN0HfqaK4oqgAwQtPo3+g
	+NSSyQCnzabRLbtVpvlREVuJvnIA=
X-Google-Smtp-Source: AGHT+IEaOdWZQYQ4HfvXAqj7a0UwEVzANVhg93ePUNDTQP8Fj4zCp5f8UenOCS58KNZPZfuQeRxXPPX+7JSvn4ryfaw=
X-Received: by 2002:a17:90a:46c6:b0:2cb:5455:8018 with SMTP id
 98e67ed59e1d1-2d392551ddemr3642601a91.23.1723554892376; Tue, 13 Aug 2024
 06:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZrtbEErNnBNNH0uF@ohnotp>
In-Reply-To: <ZrtbEErNnBNNH0uF@ohnotp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Aug 2024 15:14:39 +0200
Message-ID: <CANiq72=Psp2vyQEf=MQfN61Xqe4UXT08Y=YeOgV_0LLEzTGfRA@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: fix indentation in `module!`'s doc comment
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Aswin Unnikrishnan <aswinunni01@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 3:09=E2=80=AFPM Yutaro Ohno <yutaro.ono.418@gmail.c=
om> wrote:
>
> Clippy warns about list content in a doc comment that doesn't have extra
> spaces at the beginning of a new line [1], like this:
>
> ```rust
> /// * Do nothing.
> /// * Then do something. Whatever it is needs done,
> /// it should be done right now.
> ```
>
> The suggested format is:
>
> ```rust
> /// * Do nothing.
> /// * Then do something. Whatever it is needs done,
> ///   it should be done right now.
> ```
>
> This commit adds extra indentation to the `module!`'s doc comment to
> suppress the warning.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/doc_lazy=
_continuation [1]
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

Thanks Yutaro -- this was fixed already in the `rust-fixes` branch,
which is going to Linus soon.

Nevertheless, the patch looks good to me, and it has a nice commit message!=
 :)

Cheers,
Miguel
