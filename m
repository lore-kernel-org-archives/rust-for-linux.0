Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107079FD
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720463109; cv=none; b=OvtK5xHBssrqnhtGojK/efy3PDX5ajcXmlG87MZ43y327hyJ2Q+/ytcZ2OYax6fZuJvVfkdW29VX/I6hJy9H10w47LgNi8gDRtFUL6eCERaw7YoADJUish8jmoHt8dvkuEYIeq9Y6qjv4S11oaaM0pJpwtWV/xDXTVUgtaXhoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720463109; c=relaxed/simple;
	bh=1ZjqLtI5lMDF16jh/Bo/NlR8Xv1QiAZzUoTK5Um8wRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=EC20fBizYftSo1nhsPw6C3O/NfNuORJNbKjx1rKuHTYu0MPDDh5qEkQGUc6GXXzbigMA28uATEsvmI0jmCUyJfc4bVUQPm6gOoKMkXNpP4DYlrHo6i21LBfDISwIheg0o8ac2TvNsOfcv+ZhV0UZjg0vbrvwXoBu9PMiS2aqgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4aUQubm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4aUQubm"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c8517aab46so3112095a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720463107; x=1721067907; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKwf83oEf5f9RYp4QJQP80Btz0LfWfnkUvDlsZx9jkc=;
        b=Z4aUQubmRn3wE9Gc/jjhlKEsDXmSEuuExL2VjSxaP3NbFoFTqwURCbjboNfWgXRpQB
         lZLKCMlM0agYIHH2OJYPRgzZkLkLpgY1WQMPUrA6Bu8sX6q08ZyiyJZ8xoNadNiCbRW4
         UNyeHs5hPlWJ9zKmSlYsxKy8lXc4U3eUS65G5VUh8FR0BWMrLhR1m2YcQYQeqQOfg8d4
         O77SFz6RN0LWupjHz0jX6mgrh4Kw7/u8pHR79HbHQjTKwKnBlABEKGN6m4AmxKZbfTSz
         PsdCuW0IotACEZOPXnF9B5mzKsIoQDmHvDa0fYyqZ0Ep1cnTCe+ASzxEnE3ylB7rho9y
         wy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720463107; x=1721067907;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKwf83oEf5f9RYp4QJQP80Btz0LfWfnkUvDlsZx9jkc=;
        b=isAdTXeph8gWwgiiORxOqVYaoSqAA3WLIktq0ZO4WqU4mE0c7x1sa1fvrtWS/5YbHm
         XQa7f2HzXTnJcHn1dHLQphNFCtwFCPhuAmVEW342ced9/phMUZD44hAtYnY7VEPlgYrk
         LBDQcCCeO1KbyOehf8vb++KCSwSIktrszAPEugSXdSeK3RnTeY3sy19mNNrUjGRq8y9X
         y+pQtcxETva+Htu3MMqd8c6Af3OqU7rGP4BGeFTEF7USBimtAHOBzw2f6MUEhYdVS95H
         PgnOdAEMyzbFj2aSig08wmQA8gM/PkJdvHWEw+1npkRlvQYTe5b5xI/K9RC20/9S2qRY
         uzmg==
X-Gm-Message-State: AOJu0Yz2CpDzykAy+6tKV1OjuE3RnXlDG8LBjl7mQnmM1P5DXHjuxcu1
	pJcWtvJRgIeHY44kcUTI7TcEAUDn0jBS9h8dgeeFU6nkRm9/0wvJUEHSS3PTlIUBAHilIT3l1wS
	eCxqNLa51xV7tUxGlbm7uyB3B+mDjEojudfk=
X-Google-Smtp-Source: AGHT+IEJFdjvFtOkx+rg8zAqzwLXIW2X2qCt94nyfd1MX1loEttFTFZqDMwlTAVttNt7Us1ARAWvSP1cO2kx56+CkvU=
X-Received: by 2002:a17:90b:4d8d:b0:2c9:7cf3:4aea with SMTP id
 98e67ed59e1d1-2ca35c29069mr412451a91.17.1720463107109; Mon, 08 Jul 2024
 11:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72koT5wYrYDvEZdiz-_-BDH4ZmaKeRjg=p=81=m46Z+PuQ@mail.gmail.com>
 <CANiq72=rrohCVhvGk16=ujP0ajjY0DABAqsDwK0RWSqxvMXr9w@mail.gmail.com>
In-Reply-To: <CANiq72=rrohCVhvGk16=ujP0ajjY0DABAqsDwK0RWSqxvMXr9w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jul 2024 20:24:55 +0200
Message-ID: <CANiq72mzAUxPyK3ucu0RidOmwTd+h3+7H4_i5BXfW_w38vhKQw@mail.gmail.com>
Subject: Re: Rust MC at LPC 2024
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 9:19=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The CFP deadlines for MCs are now being announced. For the Rust MC,
> the CFP closes on *July 14th*.
>
>     https://lpc.events/event/18/contributions/1662/
>
> If you have any trouble submitting your proposal(s), please let us know.

Reminder: there is less than a week left for sending proposals to the Rust =
MC.

Blog post: https://lpc.events/blog/current/index.php/2024/07/07/rust-microc=
onference-cfp/

Cheers,
Miguel
