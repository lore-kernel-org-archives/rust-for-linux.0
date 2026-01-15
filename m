Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC432EAB72
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513715; cv=pass; b=kuxQJXQJhZxx85BUE3B7FBZ7Pl3ojCk93nK7/uYI2S+9RQ5QSDisms8Ok6PYR9TEdWwKM0+gdFlmh/hO0zQP0s1mRG3z8hANYccIkh5dzekUQr9Q4ch60UiEuW3qz7Mf1eIPbUdObT/yedi8OEsWUmRDlY7OfO1atp03DBI7fxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513715; c=relaxed/simple;
	bh=hN0pq3geTZdZwl7GngS9I/4Okf6i0CCpg1x5bJJXfJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxqXXQycFeTpzhdzYISyafLpQJOxlIuD2fLja+NG7gy7lU//awU4XxaNjriVft2HhJgs0T8uOmhON+b+Id2pFnRg3SByLS9+IsgIwbJAF/DKUw3FXj9hDgdIZc0kY7qIse3qRdWtbmWq0V36fl0xHrb1w+VqsON9dWkToIwv6ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJPiJ9yS; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJPiJ9yS"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b1161400afso120402eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768513713; cv=none;
        d=google.com; s=arc-20240605;
        b=gGeMTgwMa/RxKbiYrFgzdlOc5slllbKeYkm9fjcGNtTf+oXBwSzgMTW4ByY5G4V0kB
         3LSpqaTYcMBVYLSB6dJVf4KDCg/NSirg+YrwsRQbLELjNzgkbAgR9jBOrDDL7BjgadiR
         PeZs/ePCZOFawWrN8uRA2cDwinUqfpXmvjBqek9IJN5j3yk/oI3XF5JcLTKg82d64ZOG
         dDlnATOxq8KxeJ0kXUNXe35/6EH8mVhD354iZ3LT/mYJoze92vW41+XdsTX1c/xPY/ig
         E1XOpwPiUiAwnLAYTt1LT6wNyxe/NBy+y8A6pB39JWiKcQg7KtI+qJJ1ZHX2YJutHLwP
         PN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2M8M3ouUVLhIz0+gQUqg7tPkN0lBHxu1Fgt0YRXHOrc=;
        fh=SQB1g8ExpQLXSCzOVU5OP6O1mRrp1sKwYNE+uoOVuQA=;
        b=dhAh7uM7gUTlXFo5zBKEfLerpxXzB/XHm+FxMoqRDnx4ZeiQ906w1u8skS9gyvC61V
         2tbD9I8Tkiw0zz0ATnlwkx1ziJdyCMIFFeTOfo0rnop+CYOFtCYjbnYcKfF2sw+HswKy
         WfKUjkdcdkOedgbyE4BOdRs0x7g4X1QQ0dXVGkSqW4rSee4Ev2cUA7r1NgBx7oeD0YKD
         KNUk8GPc99Y8cFR6/oYcV0oZDGqegeiyYzp9hz6nnYtSdMhwewLdcjx9RVrE0jOyWI9f
         62sDlVi0E17WF7ggjCC9TCHgRJbp/0LPBQHwVWpyDBA6/lSHQzUjZsjFlndNcqh4A525
         22pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768513713; x=1769118513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M8M3ouUVLhIz0+gQUqg7tPkN0lBHxu1Fgt0YRXHOrc=;
        b=fJPiJ9ySgXPz2nmKf2qJeCnESKGb/Yi4MZUpEI1b4RxPU2XBzLa7WRUSIU0y7kXruG
         e9lYpWTEbHp7hajca9nrabfX5C5HnUHYWz8QRrPq/hLYUw0THho4+yRsf9AjV0Fp8760
         MpasUk313wU2QoQkBok2Ux/k8/36rDUM6Z8K9inq0XANQPXGriSp/6LCyjSnDrQI4MLg
         bDKMLk5YLAzdN76/QMET/ybp/isdWt9r0ww1kEgdGK1fEbWCChs3LSSu3jRiWOe1MG/k
         qoGSvzZAuwv7azx9lNHXLP/2LiHelZS3ujkXxNylzcjg9s2dkJFi54wNEqaaFXX5jX4g
         5Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513713; x=1769118513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2M8M3ouUVLhIz0+gQUqg7tPkN0lBHxu1Fgt0YRXHOrc=;
        b=GtnNLPxBWNxrkUEZvH8Fe8yRoieBvlxZUedjfNJLCFWs59JjUEKAI/17BlgnSf35ON
         kyzs+SgMyt+fzDB/eDZIcDYZ4Ui+ABJHdlBgVUo5rSRCDjeTBAgbwmKpfzIHtPpNuTjO
         Jik7JjeV2Bkjjmjr/L9gDtgto9A8UASGKyNHq9w0zH3cbvkO3W0jcQlGNLUlQ/duLZkt
         yw8MUUSf7AeqSp+99+tn/02Ysh8ehv507HLSljn48zGiGysgNWsLcaMwySmEuQRvsGQc
         d4M6gjkETRk+1E/ZAxXY85NpmhD5119pCuXNPhlT6ZmzfdH8kEMw40nXsGAiWWDSeEl5
         xbQw==
X-Forwarded-Encrypted: i=1; AJvYcCVrTqgnLHiRNATHFNdxCAJllA8906WEL+CnDnsgsD74k6rcpdZSKMDnf3QCw0YwDiIqYqahD55eweBIHe/Ubg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymKt9kujk5AFZcmaNRY9gQBVyN7plmVE9IQtFvAqctsFnT7N1X
	r/dD2/tn3VkcGjTKHprjn8TfRsNDJd2odC9b5VB27E7md9I3Z2MZGsBKxJHUcmg47WPOR29xHQV
	hwL4r4uy0QwNRc1OMeNB+pZHW+LeQXBY=
X-Gm-Gg: AY/fxX7rK3wSA3q9oqSy/qxR5f8UE82mcGLpbjr8wxWC27/zQnyrLYr+qr/jvGysJmR
	6i/plg2bLh9ETLApSjQQ6yHvw7sPSn2pMvtmORk96I0Z/cP8VDZVF7pFCVV5U0RaWXO9dvph/FZ
	YGF4CVMZXx0ezHqz8USz40T8SL2uwhJY1ImJRABm4yZFiWDK18Q9FMohTz+8l4AwjS3/niQCRi1
	StU6VklUkCAnHUL9OUE58oaqJJ54oTCLMH61USBeHP/kTNP8KAG7MYSLA45ds5QuU4HO/b6ZBxK
	NYWQDJVvDaez7e9i+i54w8/8h5O406XXTOa1YgfW/vaZRXoSmrjmk3Gx7jjOy4oGSTUBWyZwkwJ
	nARmGwhnUnXGi
X-Received: by 2002:a05:7301:4196:b0:2ae:5b23:1601 with SMTP id
 5a478bee46e88-2b6b380ec2fmr588056eec.0.1768513712816; Thu, 15 Jan 2026
 13:48:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115214545.63262-1-ojeda@kernel.org>
In-Reply-To: <20260115214545.63262-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 22:48:19 +0100
X-Gm-Features: AZwV_Qj_GukXJ_Re_Apdr-cNSQNuQCIZ1EuI7eKKG_AUobnmPQpGZpy1mJ--PHQ
Message-ID: <CANiq72nYvttE6odYpaQZ466Rv97jgK7T0vybTcMNftk69iu0tA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:46=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> +RUST [RUST-ANALYZER]
> +M:     Tamir Duberstein <tamird@gmail.com>
> +R:     Jesung Yang <y.j3ms.n@gmail.com>

Tamir, Jesung: if you want other addresses (e.g. the kernel.org one
for Tamir) or other fields, please let me know.

Also, thanks a lot for agreeing to handle this, and welcome!

Cheers,
Miguel
