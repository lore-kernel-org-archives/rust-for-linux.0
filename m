Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5553C3AC
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790066; cv=pass; b=OD1jin2C990dihNdGeWVlTiYxP72/Vkr749lRw6dA87D65gll+ndVoQebdidpC+ZmDk2F4Op+ar0jwTHblrt7utwiGOp2WMYQVmuUy8LPa9+XgSa2JMtnRz4UHhKlKZOIH5QB/83dezqislyOSi4p3B0MBQhGK/YJTqGvgD1fME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790066; c=relaxed/simple;
	bh=QIPKB89nXgDV1cfQB+FMow3NJ0Z/HH87YQ4Av5NDtpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Si3+UqX/ZEoPhz9clM1wQfUbrP25iFHtiqQuVu5FOwo+f7v635jgEWq1C4BNwa34FIg/uCpX8tyRKuRhVFDHuWUJquLyH6fFmqFOM6fFNEk1BT5eLFoxP7LREi1dHuk7WBPkbPe3USqNKibq5U7cmM57KeQilByriTxZKI6VJDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neLE9dAY; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neLE9dAY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34ad8819612so233443eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 10:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790064; cv=none;
        d=google.com; s=arc-20260327;
        b=hU/ZxpzjE63zHsKYiAKx1nzVRG6MewS4FE5d+kU49wKrkBynN5kcz3weGXacO89UX8
         FrS2TeHsE2bFiVxCgFq3QcIjM++ba0uV6xDVx+JUVV4SVFdSyiOHHvo96KcHlbVhF20z
         ZyrVlbRmhkA2/ObP57vpIk6fOmPrCWI1wdlw/xd42kgLigHCh8cu4R3VieuIOn1qMfFU
         JaDmtW3mhIEr1ehFawSgONqqexqJy93nM/jPPe+IZnLe9JfDUuiXqOafqjOkILy6IWqR
         fHk4mCB6nWjx56IGqvYGTbivNHVZ7ggaOU1nekwRzIEGTVk2MV8hLG2wIZBJcI8R/rln
         Q+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        fh=9g4W3K9XxFsc9ZrOkrarOQmp5KcOtq5qoT3MAHUg2XQ=;
        b=YzMDg9XQhVHudod5F/OpqmU+r+luVwvxblEFkvcNO03/ilXi4VM+wL6qFUCPE/PURr
         ZAcQ+jwBHA7knjBWsv2rh5iQs9WIB2EsnAybH9RTzEusVW39CVyd5+jwokxxZxod/cnP
         HENMf8h7V9OpI1AcIEfSQIT4hsG6JwVv8BVHk5Gaev6rwMzka1kYmGYqKWMw94T/P5CK
         nRUmS3aOmwGW1XCuP7ArNyo3/3q75nxf21U1k4yk2FRDe3cKk1o+rtiq85rPIW+QaGSS
         xFMjR0HdHWJk8/vFT6kFgmkEs0gIUDDLMFSebFY/TdeGThgw6NYBYe1lOctZdRw33qXc
         F+aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790790064; x=1791394864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        b=neLE9dAYSQhGiJKSU7ZKOZN9I7n4pWI3QqWnC2v21t/EDQHwpXabp7zLBYv3ponCi0
         S8lOPRFP9mB1kdhYrxGm+RYWzmiFZCOCJ5n/os9Hr1lsLQfv8kvr5DWqipoRc6x7TUAo
         X7u+UleIJrMAirYRxwweXC8AymsUdIYEC9vhev4tzF4PVKp7PmJlWiRtmd1PoMAuVuw8
         0Sxy6Xn82QW9XsHSbjL1A/251rWQpF8sRxEAvjwqBxgevENU5Bhm/IpjdDi2MCEO+rKK
         msbZ7Byr+RwPUAihqvJ8j80dWjdTHjr7k6OLMWdgFm51ZE0ZdfmnlZ9FXYYMRVzyFA5C
         Rh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790064; x=1791394864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        b=jThyTTFuhO41iY0pmt4Cn5P+Maxr30dUWH9P+c70Di9o601LfNlU/bTcnMefJez42q
         SQ1KknFiOJ9bmThegKopFYiXNImzGqOKR6tAdlsGEK0Rb/6ZtkO+jBxdZP0F/3tfUXuz
         PnuUgC2NOpN0czpqlEuf/oDzoTOt3Tgfxyc+drGFBddFmLBQAX1l3AGXxVus/844JLW5
         cRU3dcXBw+TyfLauUrwyqE1x77NPH+M7i8Z4Z6nRc9swUZbRhXdC3HHvLJLyA+f5o/gY
         jRbb/OBxEeH6b0rckFldZV1waVZoe0zs5lI8il3kjx8LyVnFlVqJHBAxQbJWQ+otiK9F
         8pAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwbYfKfAKZkGE3lUuq5tApfly/lt7a/94AFZLKbsX8O27yoq97Ryzm/KG+BKUrNnc/wXYENwUhC1qiwr5Uag==@vger.kernel.org
X-Gm-Message-State: AFq9FYLY3bAjCjjHDB0ZYIIJCZz83c5JEiy3WU0PoJlQN94Z4FYFc09J
	6wbH3uqjw9MqvGTWJlMXZeaLqjXIBQwUQ4uYqsqrVnxi+Phm93gzRciCLV1p/bk26SUmB2apjDK
	hxsRz997wVEoAvw8PjiuS6Rj0mYwI1CM=
X-Gm-Gg: AYBFou07KhCDembav3Ik0r1Npl+vtJoFPz3L858nW30uek9MaDWUTBzt0U7sfyYTO9A
	fref1WUsa1HRvL10s/OXFg16RPbU6Aa8HcO6O7W7eho/6fIbCGlQmEHUwYGRYkqm8MA0By7n01F
	5CXCQWA/rcKoWdTlaaBzHfHidyf5YHxTBduDMc9RROK2FnIyYayexkWh478ur2tzFvH7zC/PvgE
	CITz9Ir3MHMt4v5Vuv2e1G4JCOvpEKpKJeH0DBHv1AzWwTgqrgdMwhF93XxofdxWFivNkaUHceM
	t1oa92rNCBTWBR2PG09sSk5IUQia4ee3bXWKZIa2bnnJRob10jxADpfr57xCGuWfv9Km4jEtwsz
	3ewqBwuugfSG46feahipLx9WoM0e/GjHhHQNxbXXW/iqSQYgb5dn3P7sQtPIXevJgpt1deGQigT
	//IwMnBcM4CG1DOjBTAasK/DCXbBcesH4YkkxIbUw8fDkaLF4qFpB+tSR97kYGyw==
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr4199997eec.1.1790790064283; Wed, 30 Sep 2026
 10:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924005052.2805129-1-gary@kernel.org>
In-Reply-To: <20260924005052.2805129-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 19:40:51 +0200
X-Gm-Features: AclHuK8-tNSnrbUegQmqadgpN1Vx-fpMXj_ECffz7b1Y1rIMfXI_7fEe_oGZOcw
Message-ID: <CANiq72mjeXdGB14ySO3RyiRrLtm2wQK-FJ4VkMSiHkJsGY-3rQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:51=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently rustdoc will generate function names like
> "_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
> doctest located at rust/kernel/io.rs:824, when building with separate
> outdir using `O=3D`. This creates overlong symbol names and is also not
> reproducible.
>
> Fix it by doing a custom remapping to trim it to something like
> `_doctest_main_rust_kernel_io_rs_824_0`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks!

    [ `rustdoc` already remaps these paths when we use Rust >=3D 1.95, thus
      this fix is needed for older toolchains. - Miguel ]

    [ Added `TODO` comment about the minimum version bump. Reworded title
      and comment for typos. - Miguel ]

Cheers,
Miguel
