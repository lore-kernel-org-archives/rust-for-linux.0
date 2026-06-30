Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03081450909
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834213; cv=none; b=VodLOtJ4L8rBT4QutNZ+LIw616hVETpVC9yWAbN1eFLUPBOpTXO70N8moKwcLf0l4DPsb+MrfNnqs19usQ1Jz4piEk6/oP3HhdD40EVPNwUQv7R7s6fJ8KGeEaF/ODlg18GO8CE4k46qr6U7rhmvY/P4a3UepmxJzPX+/eeBos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834213; c=relaxed/simple;
	bh=aqUwzODJXitno7dT5jgjJUU9tcfO6dAji0U1J60gUM0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lxKwhLbE3QhKZwRYjVfwif9hLH6cQRF6nsVm4M5Uq8rGpxRv/jR762Ktj6Cx3KnxNTnEdkjwXJtK2+Yjb41xyM5gh+3oTupic3dZ7yppMUmKj6sieHGEODYi03DSAXzboop1mtsHNQjGMtU+tg1Hg/Z+w4hzpz0bPmCY16XPp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkHpQ7XT; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkHpQ7XT"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so954651eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782834211; x=1783439011; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX8g/k8yrBFhKJutLCj94XGUjlLYYTnZwSVrPSJLJUA=;
        b=bkHpQ7XTLK7GvmJ10AKZ1hhZw9qRzWHOPb4CP0jeHBRdWvf/7/KDFE+nEbQ61h/MUC
         3/0GtYQDrynanppsgk2AOE+e/sHi91xcP7jmSnkr5QDHjWQa6FvRrtFlMl/mBP8d1o3y
         XuKkyk0bxqMeRZJDFlxxDpn77VIVXcFx/ACMBEYqEmS7Vp4c/01Gs+lTEmSYQz2gW8g9
         2gM4OZuMcKVtXZ1qGjty65aThqSeEicGaVsBzBVEKnIcNZj6zA5+8Bl9COvgLgTi49UV
         XIbIK26vHZrvHCn1BrXnlqlxMHpuOSHhYHwQjtmjtcjlZVc2nrzbrQWldAwblFpaZkAD
         4UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834211; x=1783439011;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YX8g/k8yrBFhKJutLCj94XGUjlLYYTnZwSVrPSJLJUA=;
        b=RFCo7qwJD7iQp2GzikT2Xo5Ncb8zpNajlIo3FHcRNnVwTlnrHxRnEIuMrdyLUc6Yrb
         HXaPmGHNYWNgNtN37BEQoTLGR7Uyn00XsbC1tHfNB/kghbsZevRa5xfZGD01Ul1o7R+h
         lns8GMsbJQfBmTttv0BFUblk3u7BbOQC07y59oseu34EKEDtsGGz1kDfh+ETpmtozrWy
         OjdkyiE/8HQLNNlKWxblQyQks50tZgdF3mDjpgAnjDGt3aMoxQS+Btc0bXSya4I8W/Av
         OZsI7nV8znOWVuefGH3M4a8/fTFXXpUV+LD0lJGuyX3FCc9D0BA+XXHAfl2LYH0uFrjN
         iR2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0YWN10wPttFSCWdlDvreWzSkv5s1HXq6V5J9mYzsAyhLH0J3Wol3d5c+tyunL4EGVxbkSsgnpY23oyUYW7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0QJasfqpkYzTO5fMTF/LV8tA9UVkoEdlbvpuKBndFHK45CPpO
	M4IE+R0VYGb5CkLAfCXw4BtedkDrBwLspZZKSOiTBTcUGT2bMcMtFb0=
X-Gm-Gg: AfdE7ckQPvjxVjGMwT2xSFyB7+GifyyeraJxwKviOK9SX4xJx8eL3v+V6uvnN1WKqEg
	xxaWr2z0SlKEATwwx7Zi9XzKeF09mgFa3me52MNWZtJRQ6wMCbqWAMyIKUbXIdeHJUpnSfQehn2
	h2S/quh1qNS2dUbGuZSoMobjkqeKDVG9SEcIHTUW15+gRrkzrKxH1BGl+lPntYT27++IORwWVb9
	2OOHgcYcZ7VeTMZqwz/ObFSDllodiJFCBJx+9cZ7+3qo6v3+pP88bVgZ89XUYQneFGOjIf/w9bD
	HwShWfySjT9IdOEP3DzF0yV8mhLDxwyeko6tW4//I/b4qBDQvkvFpWtiHw5oUFUkb1OPkGayFPv
	Z08J2zZ89+aDbjmHPiUGxHuDVjh7wFnqBVo1r47wICAxzX6ZTyCplfoUFS7Xl1n9zdm6YV2Xg+y
	53sxOLoXTX97+YUBKory7xOkamXpTJQ58oxD7PNJ6VA+yK7F7v
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr3421948eec.16.1782834211044;
        Tue, 30 Jun 2026 08:43:31 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5c4c3sm9520156eec.2.2026.06.30.08.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 12:43:25 -0300
Message-Id: <DJMHZB23PNGV.2SM0ER4JFQYI@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations
 initialization
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
 <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com>
In-Reply-To: <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com>

On Sun Jun 28, 2026 at 7:16 AM -03, Miguel Ojeda wrote:
> On Fri, Jun 26, 2026 at 11:44=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> -    // SAFETY: All zeroes is safe for the `file_operations` type.
>> -    let zeroed_ops =3D unsafe { core::mem::MaybeUninit::zeroed().assume=
_init() };
>> +    let zeroed_ops =3D pin_init::zeroed();
>
> I would just remove the variable and put `zeroed()` directly in the
> fops initializer like we do in other cases, but it is fine of course.

I thought of that as well but I tried to touch as little as possible (I
assumed that was in a variable for a reason). I can send a v2 if that is=20
preferred!

Thank you,
Nicol=C3=A1s
