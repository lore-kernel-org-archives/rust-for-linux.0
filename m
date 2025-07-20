Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACC1A23B6
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753015361; cv=none; b=h95iTNVGJ63Ky4n5PGv4QbLXdDBArhz4Z+gwej5OTGtfy/wXQ+D7k0P2Ez5T4eRE5+zAxmuwfGadYXAZBa7wPgLqKuY+OKqJVtvBlMvcqfi6Q4zgAeHCU00Izo6h/WshbS0s94fTwieeokw8/SYvadGUAKFnUoTYQ4W6jmLmOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753015361; c=relaxed/simple;
	bh=Kbxr8gW+74OtkCWLWdTKqVSccwbaM0DA8z0Tt6uRedk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Kr7KTTWrubADob8tNyafR61BtU66ZzK78f/XItoj3fpViBMzRlqqzvseKnReNLKbGOjwWABsCbZPzsDOpCbGX6U0xXHjeZ8MWCWJEVr3lY/BLR5VwliE7/2NqhQK6XbF/VluzynAr3Y3Q+E8m+1UHfeKEVVKSXzWJAhBd/LCFKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imjiGiGD; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imjiGiGD"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5551a770828so3856092e87.1
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753015357; x=1753620157; darn=vger.kernel.org;
        h=autocrypt:content-language:to:subject:from:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IIqpCFqctX6lTYdBJvZmhGnArgwAN/xe4wT+UBOge20=;
        b=imjiGiGDbvqPbMGNP6LRXTQWdJ8ie8bmJ51eFEEjzLHZJRl3xTmx3sg0TN5EY0ZI0v
         BTpAqjVK21m+Cp/dvyDZVLnG9KAoqIJ0ujxcN8yVxdkfPPB58e8qoQ9wYq1trMhXEveQ
         dNJL7FFJV7yoEHRvrvY+deT2P1jQ0qFOLzlf/Qn3lNbnDOXGsGyKrCtog7YQ+NqIAvI8
         XgjC5mWWpVtiiglT4UObma8EQTsehfd/b17p7/z8xg6BfCuB/lvqtHrwN+SpB8pADuI4
         euMoGyxMlqEtMHRGoQE11h9OrYI4Uj/l1DEyYaKjYb7VEhqZTAWhP+DMNMnMXHij/49x
         ss7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753015357; x=1753620157;
        h=autocrypt:content-language:to:subject:from:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIqpCFqctX6lTYdBJvZmhGnArgwAN/xe4wT+UBOge20=;
        b=ShsMTFopQc0D3lPgeyA9cY2ccaiViWFH//EHcwun/g+skRP2tLWcQgQYqaGVAuWd5d
         IMpLN1udln9FzcrKd6nwtQ9K0eMa3i1BnTBIE/xiLOEYM4p5V8YJZsP008ol/p1fuHXq
         zahkFjNs50iyDsfG5749IBBWfAtx1K09cCjI++v29wOlot8MvH8Ne+UF6ro8aXFHtfpu
         XCzdicWFMCWTJKJcQc39ZxScQ1Z0sWzrRdDfDxhE8u1rMn7vtJqV4JDE/QiGg/nPL49n
         c4euyGKhLysnnh8WXUSUufOm8UFlUBegSedakFmFXEwnoixeqXo0lKtB6EX2pyG8sgJG
         xvEg==
X-Gm-Message-State: AOJu0YywWTuWNjRT2EsdiNI4Rnw4hnl6bKayyNcZXicBK7aE5lDjX6x1
	4mYznTHOxiDZsnG8dxLBRZmmxv1r7xgf/CggV+BXcc9VTZd5STdrG1EmP+27B7pglfGyDXPt
X-Gm-Gg: ASbGncvkr3msv3BXyuHpFAQjLLBTVCJ3o3gyjwrR6RjRYu0FJ2yDZVKgtLN63W6qggl
	mfO+8oBXBGBGOCDuzuj7sCFxWNHggoXv8qHC2eo13HdBJ5pIig7ogwnizDRY+pkvnyUri56yZxq
	jVjwYI96y9uv3Vf8UpxtQU/P1F3Bld77g/P3R3FtO6pXBu7WZ0qus6h5iMhbmDTZ38/kIAfuy4D
	7hHfRi5N//HzzeQeVXM4YN9wRVBtm4PCHGn5GSo8+HLQWo3q/le5QfmubMZn0tZv9eIhr9ZxCNa
	7GwCZes9mXT1SvR220UNVJBp73ItlbxEDyxAueTURTtc/xN14dnzidZOGrboPyBjHEBvC1vdHTQ
	b3SlrQ5qeAOk+klPys6pV53qS5MCnUK+M2TLq3rwMT3zlwcuqm/7jzDbapF9mU2iCmdZv0m/EaY
	BJXmX7oCXh+cuuMg==
X-Google-Smtp-Source: AGHT+IFaJMaEVHfhjg0w0NwOzY4R9LyOotM3E2aps42GZzwh3WH2cl+/E01tBKxiwmrlP7GqDB8kug==
X-Received: by 2002:ac2:4e8f:0:b0:553:33b3:b944 with SMTP id 2adb3069b0e04-55a233f4646mr3835311e87.54.1753015356894;
        Sun, 20 Jul 2025 05:42:36 -0700 (PDT)
Received: from [192.168.0.122] (broadband-5-228-80-49.ip.moscow.rt.ru. [5.228.80.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c681sm1114989e87.106.2025.07.20.05.42.35
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 05:42:36 -0700 (PDT)
Message-ID: <c187d747-4a47-4c9c-a057-8e8394f3134f@gmail.com>
Date: Sun, 20 Jul 2025 15:42:35 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikita Krasnov <nikita.nikita.krasnov@gmail.com>
Subject: How can I get involved?
To: rust-for-linux@vger.kernel.org
Content-Language: en-US, ru
Autocrypt: addr=nikita.nikita.krasnov@gmail.com; keydata=
 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
 sXwISql2dLWvF4EeopUcuqEmcKFKXR+Ifbxj7A==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tiakEVcJiHvAEBtIeT5iNMmp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tiakEVcJiHvAEBtIeT5iNMmp
Content-Type: multipart/mixed; boundary="------------jeMrwRHqZpdicOFyqi7U0vWH";
 protected-headers="v1"
From: Nikita Krasnov <nikita.nikita.krasnov@gmail.com>
To: rust-for-linux@vger.kernel.org
Message-ID: <c187d747-4a47-4c9c-a057-8e8394f3134f@gmail.com>
Subject: How can I get involved?

--------------jeMrwRHqZpdicOFyqi7U0vWH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there!

I'm new here, but would really like to get into the R4L and contributing =
to the
kernel. Here are some of the questions I have so far:

1. What is the main fork for this project? Is it [ojeda/linux.git]? Does =
it mean
   that all R4L patches first get merged there and then go into the
   [torvalds/linux.git]? I assume [next/linux-next.git] is not something =
I need
   to worry for now?
2. What is the current status of R4L? I see that the project is marked as=

   experimental and there are no in-tree drivers or modules yet. I've als=
o seen
   a [template] for creating an out-of-tree module. Does that mean that i=
t is
   already possible to create some sort of driver/module in Rust?
3. How can I get involved (besides reviewing patches; I am already subscr=
ibed to
   this list and reading some of them, but I don't feel confident enough =
yet to
   comment)? I am fairly confident in my Rust skills, but have little to =
no
   practical experience doing anything in the kernel (except maybe config=
uring
   and compiling it a few times).

There is [this] thread I've created about (supposedly) missing driver for=
 my
Xiaomi RedmiBook Pro 16 laptop. Do you think it would be feasible to impl=
ement
it in Rust? Though, I assume it wouldn't be possible to mainline it since=
 R4L is
still experimental, right?

[ojeda/linux.git]: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/=
linux.git/
[torvalds/linux.git]: https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/
[next/linux-next.git]: https://git.kernel.org/pub/scm/linux/kernel/git/ne=
xt/linux-next.git
[template]: https://github.com/Rust-for-Linux/rust-out-of-tree-module
[this]: https://lore.kernel.org/linux-acpi/6c7e2d8a-8c79-4311-8126-c888a6=
519c71@gmail.com/

Thanks!

--=20
Nikita Krasnov

--------------jeMrwRHqZpdicOFyqi7U0vWH--

--------------tiakEVcJiHvAEBtIeT5iNMmp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEpkOhtFujpzRWyb0a4A5zBMF+d4YFAmh85DsFAwAAAAAACgkQ4A5zBMF+d4b9
gg//SJy7ECkDyvM5lxYSna+MOo5O4yF+NpqfFoVsifBJqNcWN6ZdNAVg+gm+nkSM98utyyZmX0Qv
i8Ga7uIG9z5ZuYnNPyj79DMb70LoLjJVOzqbLIgqMFv/XYVhSCPqJz1vEIB6ZJWjXRAFcyIn5etF
5f9BvcymufqA7B+3ooWRXkqoDINE7hvXqKF57TWV+PTuoiUEzvBP/NTvoO0dEReQzD2vZUJrPJnb
DZ7OXcEAgaPdzfUpzw6RWFIChU5vr++Q1EasAYSmn0z783rSbjFQM9PWcHbET9EtkRz8iX5cSvkp
RfNrQX680gLESf1tHYZPndyywFsH6ySmVN+8vj077HoPGp11/eOPwDb1yv+g99GZNxrCuaX1Wygn
rXEaajZ20xpgO3PvkENMJv7IWPHt3iWuLDvkyD8j/TTWx5b8P/jL+t37oWMH6U1uSO0342tHo2U3
cCksWzYQX8kph/xXwmjLS0OaJMszbano9sOa5NguDv8p8RxpujJSOA4R+XApI7Avr/IWGkYwGTxa
5gDKV7QeCCAgzd/uAtjPHF6lpyRRCJ08GjNw67FtPm8bD3E0UoGaYksfTV0yCGvXVH01tu4fQXQy
mnnw1XcBGff5VF6Gx7eOQgSDApO15qF8Xm20Jsy634gl7OjOHSMrnFzX6EwUY4yU9sv/POalyVmY
vpI=
=DBaT
-----END PGP SIGNATURE-----

--------------tiakEVcJiHvAEBtIeT5iNMmp--
