Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90319C556
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Nov 2025 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009621; cv=none; b=CdpqHbxnpxbybZV7lPAYqrkmeoIsuAD9Lwtj4LnZvqNg8IOOzOPffxnDO6gu7Efg4blx9GkZyUVI79S23C54TvVtB6cherbibU+5EH2z0uenl9xJJYcoOtn1GvrfzG0z7Dr4gefpLHHvWTU+bPMt7U6dHlgvyBklnoa9Fl6fM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009621; c=relaxed/simple;
	bh=becdGP2alRJ2u1AdEeRmaLP7ThHZQI0eIuX4AXNQ4Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYSh5qh7Bkea8Pd14VubueckB/s6K2iNhS6jIIX0Pfhl///+dMiGetQoBRW6+iShwKiN+1q8xvz0MDQNa4nyJ8SMyWkWrpyVu8KnczNr+0LASctTlAcUjyVJvmgNAtqpNWv/h2VVNf46Ho9BOpJm4z622G5eM/AQcemi6z8HOvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ks7WCdDl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks7WCdDl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a2687cb882so473875b3a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 01 Nov 2025 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762009620; x=1762614420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YiAzuZ3UregSrMpF9J31H4Yx7ePy+2MOlCUjA8nJCA=;
        b=ks7WCdDlLigxXHjPcJDq7rRN4iM1gi975yI9wejfBe1LEToibzFS0ChatgRmyTzoae
         XLOCzoxzexqMKJkn+qf8/0Yri9P5qWy+4GjtuM4mzQIUZUryAiFUulQSlBda/Y5f8JOe
         gpMVz2vBi0+Ng9kDf9V5/cz+C9urIxoeSTWLcC4YP9N25m+cDDKDRcu01h+RLZK4ACZl
         2vCZ/v0mA4Y/W8Mm8/ycdSz8UhoAZyQmqMk6S80208QggdpnjVNDMGaC5AcNus78VzvO
         FO4xOVjC63QhjQxNfrMKdSOO65p4epi6t/YHvTtZZYp82MzVVN+gaoHfVfevoQMUINo2
         Y1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762009620; x=1762614420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YiAzuZ3UregSrMpF9J31H4Yx7ePy+2MOlCUjA8nJCA=;
        b=cOCZ0w1xQ8aK+P1FrM9BbWKmYFBBjDywLfacaSLURlXp/xwKmVf+YArTm7QO38gqwD
         3iKPPI9IuIK8PjMP1sVy10C6mUDr1zpha8d9raZIjt8cR7yKJbW9XGsJPGdkS8zUC5CY
         L3EbbaC9Kew3+9djrGVqS5G1XVzFL5PEqo+aKk48bNR+dBKQi4iQAgJb26h3dbCPuvgp
         EjbyM92df409+gPdBoUKMu5j//1hCPT6nHWsJH+PPzuwQxC7RWoiHG/qTJG1adXjorFF
         COTtL2yoH3fU52vyOgbsxaSUe9IAEQicYiSJWFWexdiIH5f1gN9XNili8m6vqp41abFb
         XpMw==
X-Forwarded-Encrypted: i=1; AJvYcCWgCvF9YkmJNPHNzLFeYp4PvpNw3YIA1aCsCGnqSMAGm5ZoxmRvEjBoviKXXt/AY/EKSq5rX6HMjdbQg2PJTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81HJXHoa+eLi0fPkw+AXHzokwdDG8oDA5+oElRniQ1X7/KdII
	iPAL4duuJIeqDFsEsIX7U7Fi4iYjHfWqySpUfY97S0xrSkv5lxhFAIMmrGg6LqoJyDKaZLn+14E
	Vf+G+k4CEdUWtzV6J3SFc2VyGP8SlKhw=
X-Gm-Gg: ASbGncsC1l125BatdRfUtZNza7BjE1tqPWHN3uPbABwAa9DZUkbxJeNxaegdPxOmqIq
	Bc8joe/jMqZ2Zz1dkQaO6X22qoiyts9sMGt5cVKueFgrIfupQGOUncnrQh0BdxR7r5fxEWjgYMZ
	MNF4DCjsEyfiYw1ek75SCphyFHNFpfMiPRHXyBwA/EsuvJF6+Jf7GYwJe69rSEkdbIn9YhY3Vlf
	pGybcbOoY/vAmCiuMIpk7NPqLYof3vqOluwSQyAphNs/EB1gEQ9mO/96FVycXa5Hbomr8dKPO8U
	tlviXmJ2oIIOpe+OSk9n4GQXOaNpy0LOA2oZbxLZodaxgFSgorvW+iIxjSf+NxHmoQFBkemntlS
	sDpYk5XO/mup2Cw==
X-Google-Smtp-Source: AGHT+IGi6G3P46MnlLa6pHrqzoZMNbq5z4mcGHcJTxA29pvYP66KNHtzQiBAWUFWhhFhSjojWQFNPtYK8TTJX1H3rRs=
X-Received: by 2002:a17:902:d2cc:b0:295:6d30:e26e with SMTP id
 d9443c01a7336-2956d30e5famr6001545ad.8.1762009619849; Sat, 01 Nov 2025
 08:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
 <aPnnkU3IWwgERuT3@google.com> <DDPMUZAEIEBR.ORPLOPEERGNB@kernel.org>
 <CAH5fLgiM4gFFAyOd3nvemHPg-pdYKK6ttx35pnYOAEz8ZmrubQ@mail.gmail.com>
 <DDPNGUVNJR6K.SX999PDIF1N2@kernel.org> <aPoPbFXGXk_ohOpW@google.com>
 <CANiq72k8bVMQLVCkwSS24Q6--b155e53tJ7aayTnz5vp0FpzUQ@mail.gmail.com> <DDXFFQCZJW8Y.3GMX8666EJQ2I@nvidia.com>
In-Reply-To: <DDXFFQCZJW8Y.3GMX8666EJQ2I@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:06:47 +0100
X-Gm-Features: AWmQ_blyOPSYdkZpX6T0yNaf0355JZzLQBA5jSJ7sUHzLUv-DNemVpz3bwTrLh8
Message-ID: <CANiq72=MetoQajmJ5Hwmopp32YZZmbNu5a5EtQve5rxP7z0uMQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 3:27=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Are you referring to this discussion?
>
> https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.=
org/

I saw that one and the patches  -- perhaps it was in meetings, but
dealing with guarantees that are only true in the kernel (assumptions,
conversions) has come up before several times over the years.

Cheers,
Miguel
