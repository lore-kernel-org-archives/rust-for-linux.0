Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792667624;
	b=nxu2uZTaFLgJZ5EsUyeRrcK/omMIIpI9NSVrXi7DJ3u/jWDnLRap3WlnDzdWLDE1c7kH
	 MDRpJTnI8ZskdyoSyJKtHrAd6xZR/Kuw+noFs8tQDOTB4x+4MQ7khGCB7oMItHSBZO+ow
	 JO29jqUbKE7QDvRz2eencRwhBrchQlettQwU8vC6XcuKK7g3oiSXP94+cBpeOb4FFiG3B
	 skm5SpPlmZC4euH3jc96MmqlyXXcfY4UVzguoeMYEvJkECWGFnSSLwLeEhV+G3bHZdSe6
	 lEAJ1V3/bz7KdwO3pEDHGKD7KCD2CpEW1gH8kWk/Foy7etj0HfAXQFPCyxr45M6eLtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
	b=ZItob5S6OAF+tc0lghZypL8SNlMIWdgMSjpNtflRiLMezg0eckqNnt4D+KODD8NZOYB4
	 Xb9pzhtKZ0wozjp+92pD5svimsuNR1AcceCIwpS8vqKcR5amCa6jmeusTyu7TUevlapz7
	 DrS7Sv8mTLTeIxxkOm0X79GBVHklwxW6dkMApqLTXcfYK4FTO6dAhtwr8pU6uA4v7ayWR
	 p3sCdw29X4hiqPCjMlgKr+1hXZF0bPMm7ZIaoXo82MPV7ENp/gyHjK/XDuVPJvWak9IQC
	 X6LzYQ+cjpIkbMA4ANNQKlsnnINiDvrDFwcskmj5UIwb5RXLgXY57C6jlS60jnVf1tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzcsCzOK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89052606A319
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 11:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89052606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzcsCzOK
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so232627eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 04:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792667624; cv=none;
        d=google.com; s=arc-20260327;
        b=UFr26ju9Tosv/TIJmmmnepkq3JnvvpmxPjy5J1IScEaLfOt1cNv0lP0BkCRI6R/lSk
         U6z3qkiRuTK2BHgMjXJkSXoDL1vfpl0KA1dWjSLOLW63o7UglUOwZpOje3RmJa8gcfZJ
         89bZqcdC5r8X4XoXx4EC2W2Deqrd5yBkmxkTaqTspdngdBEM+gtqpLjCrYRXz9pZZkSP
         jHO2h/Ck27oPmD0RL38ETNYPv7TzGyNkttC4fj3ZhfVxQpDvQsLt7mF69CGpnTFsmtT0
         Xflk5+a/zxn+lPWna+W/t2dOKevTjUK9DYMcoVrvuQmT0aDo/gSyXfrqqJd2rKCr/MRt
         KxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
        fh=S5hCXDeVhdQvIFPmBhvJV/lcXRK4r6g/9TtoWyPRrAo=;
        b=HUv+csgOhoS1sl3YieHrRp/PapdMxKeFBMb21PjHW7FghhLPsDLdyAylN+TNE0BiD8
         XEcQn9y6fY0wkjROK0DOKVkxC0GgSO89o4YXJjpUOXQ1qgD/F2m9OJHA6R7rAJGh+31U
         T4iW7H+0aOvtabg1CiK25VOc8Vsh+/Mazzt2z4OLvC3J+7bcZ4wahdOx7YKa8ffCn6VC
         s9aPKtf1DxxLVMpvjyarKYcrymPLF1NNSbqh6aIvGr8cEX/97xsgqoUfHdERoqs7xq4c
         tARpeqVZW0i9+eWDFCK/fGI8ibkvWfftqQ0sYnb3iBAeU4aDoqNZAEi5cKYAX1pFCjhr
         dCsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667624; x=1793272424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
        b=XzcsCzOKIM1dH7X3ne5kpMLOkyW/kS/lF37y0oepZqm1lgSq0khIYNbARTOd93oqMU
         TfXjKrpV5RZBx81RtZXBePBatu/+IAWU3v4339o0MHOYOStsXtZ1gZg+ftfhrJJ97o9X
         jqknYd4gvq1/exI/EqLx798hDLeSye599FMXrfnHhM0GvQ2yXwCcnFwSF9N9+LTzHkyh
         vFCD63AmEY3JMAQwK+XD8g1FJcFNszVqG2czhj24/nSh5TVzQtFFLGhnadtrjVjEoHGV
         b5OBD27hWUq70n97TAknRmxcqTPS8aubwZjUdzwNgjSOnK0TLvQ6uQ6EHWUf7qS8H1w3
         NK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667624; x=1793272424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
        b=vlGDRGRl1JrV3auwuefo7a2Cx4CW5O4r+iHKa3QhmoRax5Nw4vVn9p+RNLgmmI55tX
         eARKY0HhdYCVylBwrgXJGFzN7C1eAeuV/un9Eo5c9P3k0N2ivUHzrAMCpm/4Dbl/fwfI
         YaZ7q/0FiJp+l6JADTBxAVRoYsSTD7YXvULQU6TIsZEJDoyJwGFfj+5JhQ4K/o6Yb7/F
         k/i6Ih7+2Oru6cLAePLtBhYWwiHvfDv8E6w0sfWUogEKjLyBMwp29dQONMn03FdNoLVX
         +FWL3hPr8fod51/fnO8QABEesBM1R7i34rYsLBWFZ8zdKs8IgIsPFRIcWVv46727myGI
         KAPg==
X-Forwarded-Encrypted: i=1; AKwUvBwgUQJmdBeofwyK6erufEpfC+KraxpTTunmBWqSl0DbzBHx7L6CtE4157qzUnkSjN99LHGd1pWHx+cTKpO6RQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIEJD9cestxfritOf094j29PP3uL9BJ/ZmgRvlfxkI6/43ixjzT
	UnHSLTyD6is8ZlhN1uroIauz1sJo/rO/H1S4t4lDJFI13VdHNFvCvTRjUE6HpJiU6hAyrZZ0HvQ
	n8Dn1FONrkSwtniaqH0/X0OQhRH4G0VU=
X-Gm-Gg: AYBFou1gFMGBH0vHWhEr+iahQBMNUGZdNDUjnsK1fWmtx5t2nNw7ykgHBfFyISnlAu4
	nCTUFgfUzJfTmBcEUhXcDJtYuPhQl8HD+WuOEi9qR9HjjH8QxVHlZu7nj/FiWRcHVMOhECOJcIg
	G7nItDhVnVdj4g0phKm1hXh89EVpQ87zr9r3tynDTPAZ5rJYhPH4KPgx+qLjIcH9pZLZorvDP49
	4DbuBg2oHLAnmHUFZZtJjHQJL9QpVYqiI5i8V1V6yopigRMpPC4giKSYw43UCk2NN4BG/+6dX2E
	hqbTHW4CY+UcawD0xfKBpU+LUM4Dbgnu0ah6Pg4RgU1DuK3y1qNN2x427IAd7hiqjDcdWex64o8
	ddBAQnSJp5TFrMvR9ZEoIs7gFeK+bpk7EZ5UQ0tAgHeyyCIRIxUCaJH4+sIVwWc2FQH1svXs5fu
	gd4y6vEDWafYzMldPa7m1MSIt5fPwZw5gtiS6hd1fvUwBpGWiSmTZZC511UvFVUL8GRiAmXkWeJ
	50ymRgbApg5s78/JP7VeQ63+t8ml4aHhcmH
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id
 5a478bee46e88-3685522022emr5207256eec.0.1792667623553; Thu, 22 Oct 2026
 04:13:43 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <as_r8n7p_wdbChuQ@google.com> <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
 <DM596TT7E841.1U05OKY9N6I6C@nvidia.com> <CAKmqyKMbs_N6C8MAKGUU11DW1y5nJRWPqnUcrVZoyi0SDjsv3g@mail.gmail.com>
In-Reply-To: <CAKmqyKMbs_N6C8MAKGUU11DW1y5nJRWPqnUcrVZoyi0SDjsv3g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 13:13:30 +0200
X-Gm-Features: AclHuK8IRxRyOadDqQczFV7IA6tccuepCRvhA3-QGnHUz-1woYEjtN6EKSEPPVw
Message-ID: <CANiq72kWv2HHniM3HXM=DkTbaNWSHsqfA_dKQNihfAdmA_sgnQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] lib: Rust implementation of SPDM
To: Alistair Francis <alistair23@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, lukas@wunner.de, 
	linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
	Jonathan.Cameron@huawei.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, bhelgaas@google.com, 
	alistair@alistair23.me, djbw@kernel.org, linux-pci@vger.kernel.org, 
	wilfred.mallawa@wdc.com, a.hindborg@kernel.org, gregkh@linuxfoundation.org, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, boqun.feng@gmail.com, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, gary@garyguo.net, 
	ojeda@kernel.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:34=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> Oh! That is a great idea. I have added that locally and it's pretty
> nice. I'll tidy it up a bit more and then send a v5

Yeah, to clarify, abstractions do not need to be complete. In fact,
they should only cover whatever you as a user need, since the kernel
does not want dead code anyway.

In general, though, we also avoid adding them locally and we involve
the subsystem maintainers etc.

Cheers,
Miguel
