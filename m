Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B350094C
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768770215; cv=pass; b=GIVmeZyjqdd+5N5IGsmotVQImM3NKLNdw/1S8uqPaVyvQ+sDSmcxNyZeZkDHi9f6J4m7fANgoKdeyTddvhndPeErMnyU9vaNbtA9jgblxBgcFrEEru0zX9JSyYjjqp0iJhBpEJIAvn+OhFIAjvyao40LwMrTj8oI3M4qz/tlGt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768770215; c=relaxed/simple;
	bh=b2nqxPhHjCUvS3UuphlHWGr4EgB77Inkxv/9yoRh6kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5+3yFy3wgNq4G+2WpkAXpTPZGt1sK9aIlgm4lWuua3eaHsn3vTfKb/Cuh13aAK+Q3RGrylq4XrgIjLrXRMOXQMUYyz66+ZzHgxuhJFsVC6jCjVO0pow8VVKGWSxRj2KM0+sGMAraHHfvC6dJqBQZ9aJPlFkipp9vZmYobquemE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiOykUUi; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiOykUUi"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12336c0ae91so302651c88.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 13:03:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768770214; cv=none;
        d=google.com; s=arc-20240605;
        b=Lz0KHXVhwu0EPRKo84PKHuCiuPmlm6vhw6VlLHeqtJXarFyD0O3k00D/O37cu/n+SN
         1RlHfVDQnqmxQsDqMimc9oRMzx2HSgxlajyRvtkyfyIUf/s/JViXcEP29wOnLYDJIork
         Gcf5sqZhpqHMxm4MMr8hZyYZS2oVln9helNe3PL0ji6M1KsqxRzgvvb2jvM4Oen89RXN
         9llH7VJiJJSmqaLi1rEPgrEeH7sCRqCN7TfDoVKww4lAadRs+MSSuOzLd4orYcEY9C9B
         00hnBAqwPWYgqxABfgINUGSE7mk7jiRlWc/w84Pcmm2Nr73Wp6uDeP2fR+7nWRAv0CWr
         vtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DybRvojstEgUa8lSG1mDFKgY1lyWAReRvg7k37dvks=;
        fh=mvXlI+UcGL0lQEwYf+siEoiBeAVJSxOk42L1qKEQuWc=;
        b=CccW1vqnwCQEMhOAms/sBNVchfdx0vkyJF4mUDsry0VKbYUCYYCueTyJDLBTWPaj8R
         1IZu+/hT9SKxTjq5AKKpYzCFnSAYlTv6+3jghYS3DV79+T+OLNu9EyXRf1UTJXKQmaiC
         yo9ojPtz9R/hfeJVa8e9pLHF2g1sXM9pW5C1lKC2W9qQUvWFEBNKmzl9sTJWMcxymP3L
         zTC11tY1fMT3PtAF0X4azczAWDEibkAg/tQLvCL5XfSWwoPnjODiQkCLUiTzTh6QaquB
         VBKfIVouWqDNBmYUEFLlY8agIssQ6P3UHFKjajIwUc4nMHLxw08j5gtnRQXgp2H1Tbtr
         SnnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768770214; x=1769375014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DybRvojstEgUa8lSG1mDFKgY1lyWAReRvg7k37dvks=;
        b=iiOykUUiugUi5jmsHE/qQwbgoI5TZ4XS5ml9lPpijuUXp3Ah5VQLKeu6LWPZVLuber
         K/GbEFDPFsH+XdhFwhS+eN+ocSrexH3F0AYoCSd3+747r99dGf0X/OVpdWHagv7b5eDc
         EjWyAuOlkT6hYFiwqpTUSUrklNLgyc8FXPAy7yuLYorruN7h4wGW0nRFbmE8lBGG5GNe
         BfebQc3TbXtbCkDNunISCzoDzz+jDmMIvOGSfxsygiwNb3eYNXPnwpv9AX3QevoP7LG6
         UErMi4tkchH3wMHrCy6QGXa5I9hSNi8Miid5ChogBDFF7GDO0a1AoYO2Rbm0CFWete7c
         84Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768770214; x=1769375014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DybRvojstEgUa8lSG1mDFKgY1lyWAReRvg7k37dvks=;
        b=Vi7eP4WEChLGZr7Zq2HKZkiR0EM5smuxG8U3NWVcVMM3CHdolcwihIgk5Q3d9Dxr+B
         xTdhzEqb+P//lxYSgMKR+8bsYk8rYgmIC+/pm8/AIDAJI8/XuT+45gnF26KMoek0/U2o
         TMYY7wi0g9e0bCV6N1XaFY8dNezWU6AZ0Xt0W1DsxnIXaD1pAqvFrgaowaMJ5x5uYb7A
         THkeFfrSoNB4KSt/mWidppV3ozab/UXNJIdijOmKZjYvy/a5sNW0Ef8ixHBE0PLxmN6Q
         t/w6VOIrc53oXx3uySn5oHLX2VFRWJUf0/StNtJ7YIlMRgNIsyq4pqR2RnB+tOoyQy19
         O/MA==
X-Forwarded-Encrypted: i=1; AJvYcCXXKVIAHct/3kszNBY4VuErph7bBvNOxsGvfBO+K66tYDI66jzMoasIGHOaRhFWLqY3ddIrIf76qGG7dOjvVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyrT5bW/NdshDobFMOughEEwoPmDLwUKKIRZBbxVhhm15scJLF
	2VVx+EO3oGIiiMjtxknvNBuz3u0K807hZkF6kEZn/9ALueO4EfScW9ruXUhjkbfTZgW1CCTb7UT
	Ce81Lo/w+WEKutDJ4vYbA3Wa+WUOtX70=
X-Gm-Gg: AY/fxX7+81bUDMh9L1mfvYJ6jfWlF9RwcMwABbR/o3mO6Uccm7RO8U3zxf/tpOfMs2x
	W+YBh4YlyNPFUHd1iKhuIs+2+79X1QiTTP6f8/Sl0YS5LXctZ8istZ4METfMd2eWSS8F0mSEdEy
	3Nvm82c8Oay1+2rHzSXQPwBym+6bvZeGTrACPUrLUoMyc+vPxHaTfHqEKOAvJ6ZjjVYN/EkBWCi
	bZY0141vQUGtgdst7VCzTPufhbQ/ZjViJLm6GVK/cXAAG2wI6puMN7gJ+hLg+Dzn4mb7DMNIsOq
	nRJXbvD7bGZH6NwIRKUaZR5WW7yls2FDt0skeEl3VxQcSkt83oUe2dGIoYay1lK+HaMiw9eDz/c
	z616oav0QDA59
X-Received: by 2002:a05:7022:221b:b0:123:34e8:aea0 with SMTP id
 a92af1059eb24-1244a72605cmr4948487c88.1.1768770213707; Sun, 18 Jan 2026
 13:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113144547.502-1-work@onurozkan.dev> <m2jyzo26y1.fsf@posteo.net>
In-Reply-To: <m2jyzo26y1.fsf@posteo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 22:03:20 +0100
X-Gm-Features: AZwV_QgDq5w5TdC79s03wgxE0zvXJ-9CgNQWOVrUWxvooiN7hqRN2iShnY1Vb_s
Message-ID: <CANiq72mrJ8yF-LVuXbsz3z_Sf3d3AXk2J_NbGNeu9Nsfgg8Zbw@mail.gmail.com>
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, yutaro.ono.418@gmail.com, 
	borys.tyran@protonmail.com, daniel@sedlak.dev, tamird@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:13=E2=80=AFPM Charalampos Mitrodimas
<charmitro@posteo.net> wrote:
>
> This is a nice change to have if it reaches the general consensus.
>
> Acked-By: Charalampos Mitrodimas <charmitro@posteo.net>

So, typically, Acked-by tags are given by maintainers of the code.
Sometimes, other stakeholders give it too:

  https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked=
-by-cc-and-co-developed-by

I will keep the tag, but if this was meant to be a Reviewed-by or
similar instead, please let me know.

(Nit: it is usually -by, not -By).

Cheers,
Miguel
