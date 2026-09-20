Received: from mail-pj2-f30.google.com (mail-pj2-f30.google.com [74.125.227.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD693E0C66
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Sep 2026 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.158
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938837; cv=pass; b=i6XQvnVuEGIeV+auAYcOORuxWWUtSHJ+OmmHkH8YFH3MfgowGkYWXPR4YOabAH2TP4btsEIb8fuf79qotR4rA1UnrIUUIdVF52m8eI4669IpZaYVsbUKffBGjvfsJvH1eB8ZitA4Ch7Ay4pvv2lKCl/AUSJet/t22MbqAVO0rF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938837; c=relaxed/simple;
	bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lq8nPYdv4ldMMNT6pBYKmsj0E9RX8o3GqehDRWxdF6OZ694qzL6xy8f6+DmU7Du8G83NRNXsDFdCcqHdmt9pSiY4EEVCAsLl6gYUU4eCFFxCBmhWWjG7KYygWH0LvVM47Twl7AW6jsvSS6wgwMrIQvD87s74OD7f7+kxDWeynvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B86AkbOT; arc=pass smtp.client-ip=74.125.227.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B86AkbOT"
Received: by mail-pj2-f30.google.com with SMTP id d9443c01a7336-2d6ff2f2c4eso4885995ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Sep 2026 14:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938835; cv=none;
        d=google.com; s=arc-20260327;
        b=MMWNKUKJMEJYKrAv7tbLbzP6PGLijp8C2yQ+5phnRT3KhaMMXVaclyluTIf6ur2MMJ
         LJDY3HhxzuHf0aoOfAIVWydvsB6Y5bPuZASNd5R2DXL755Gnxzm0ngZHrqY1pxQo7IxZ
         8oWJXZiR1xNuut4LcOS/gX13TlUc5BuBx8WA1n389/HwV8U7VmOoYsojVF3koeMKkS6z
         CYGQy0gusDgdGbhMQrxP5SgJtANLi2Y/olTnqYkZrjFRIuPSce2c0jthfd9pkgpgoK6S
         /6glHvKq6m7CJVhqnBBhfQMA0ErB8tg8D2lAIhC5BVhCN0OU+0UlOT96uo7O4gZpyaaX
         3Mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
        fh=8tPSMjkkzTeOHbhJIuzcGc0ZjEhuR6tuGhDIVhSyAdQ=;
        b=EaepJE3pIFJ3YwHm0LSFd1yOX35uGOc1TaeT5BQyYmoixn6lXjKdT3x+15Q4e+IGbY
         3rqgurMOjCedlL4n+IlzRo4L1gLxvJ6PzNWtYk0HgNt8HnN4eZsyhI+6GH3hGokJAgjk
         vhAbrTAsxJpV9mfnNwBN27u/c7UYInnJdkHVQe2MRI2vzrXOQjrxcn+ttYdxvoRmRAPn
         4Gz2TTSswK0vIcROEqXwdWZy9ruLa+0vuFPLTwYqJlXgXUUsX1qcNtR0IuxlMnNvs7rQ
         bwhOuKxbuzcNA20umM8Yr1XQJE95xZ8XBebdg3jOyV/g0Z7Ypl+KWiVYjAGe3gIKN74u
         J/rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938835; x=1790543635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
        b=B86AkbOTEtGatdYajaYeLdQlCQhJna5J4tA25aQJWOkPlRHNTKg2Kh2geHUPcBoTGN
         szvnMfmf8zq/aoz2dtjblZsS6uzS0RyMwGwdirrCzeRf4ojqh3/23VJpqPqsL3yFkRpD
         UA5gi7o2uPnG3v/jcg/874nVCr3e40CkMuQJ1Cmojm0zgFUzEWBJBz0wjFuIkbR1Q52g
         BM66OBg/fH90SJZlCEvMliiRNCM3jM2Ionu2HnRfiw0oh42tByE0/Fo+DqGFb2RDuV6Y
         IVAc8RbH65brIyr8o/PEY4XaU+z/x65jh7UPzs6h0WPf6nIvzJ9hT8GmWF4mjn7OdZJp
         38rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938835; x=1790543635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
        b=wubHjM+92OcheLsVoYzBW6aLNYuPJY/+e3dVgHtqD6y1+eFUJ4VJyt5Ze1PbV+09sM
         yaO/VOHGJJMGOSLG/sGvJ9NrpdPI9314wibWPuQq/tchV4QTFYlnfODXEDbUDq71Ti1k
         5RneaQPHT5Naxbz6UdklQArsRis2/ffXSdGoq2MHx7370tr9jZs99TR4bD4GEPCLfEGx
         U+aPdZoql1zNj8PbzcqfOgMPETGjIztGlCUQHwTCGl1nXRZ6S6WBymkd4FaqxWylWLRy
         TYMdZUm41rCBI8PNlgCMATM0ji1Zi3t4HW/cVxzqUKU3omcUayKb3mAYJgOtbJFrm+nG
         Qexg==
X-Forwarded-Encrypted: i=1; AKwUvBxts9629LBkH2kd+a9zuSHRAJqUpm+bs8809hjwmdAD1a+BvR1nRaAkdvgIR1QGs7WktQuXWRTaYJYh4eF1AA==@vger.kernel.org
X-Gm-Message-State: AFuF++lAjexa9w7AZPvnVpHoZiKm+r25O03IiZt7Xt9YZ1LLmmZVwwmu
	bBcw0WwijLK6KJf7f6A5Rxo6m5RTGcARCUs28trCWg3xuUHDjVvKbYqiZXY6Yt7eJ1QWMfdc15w
	kLxwGP9S43O1vfuaME7mgB9OrZhXzuVM=
X-Gm-Gg: AYBFou1b4OuzvMYeycHf8ccXVH3IeIxX0bEYlcaJrruwLROrssN0z/tW0l4i0MuOlzP
	GmHPJDV9LEi+AgznQ6L+rGZO+yhYdTMIv8jbx59kZwsBCdrYmm2boPNDTISoHOIh14OvgnJVNw5
	/qlnnUNxZHXK/nBBsvmAhEcOdhkwwvgJuG9w/h2vgHuB9i10k1gSkbddc73LDydnxA/X1lF2W4K
	2kaKHUN7cKgCvZKQr8cwWZjttDSwQbCP6UQm8u0h0J20WMmO0/D1RIiAvbkurXkDc3d7rfQmJ53
	5kKGJkFDzAjBJqj/SGBPL5oI5fH/vqEasOpXh5zX7PCOELITLmU4A285yDyKc8Ww0oxUC8q+l/I
	LZUpHYFXh3XBijcoIHOzsh6tdpwPK89EmUk+1/yqGCvrw5qDdgEnSxHMtd6nbsW9vM8mpOIjnZ+
	J6AFrQaZOALQZtD8k70kb1/mQQEy1H+RDXt66xOtg6QG7VrdO1YsA=
X-Received: by 2002:a17:902:d482:b0:2da:dd0a:99e0 with SMTP id
 d9443c01a7336-2ddb69d813amr157911745ad.2.1789938834978; Sun, 20 Sep 2026
 14:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
 <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn> <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
In-Reply-To: <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Sep 2026 22:13:41 +0100
X-Gm-Features: AcwNN1UF2OK4koMxfuVb-f2s0ZLXbtaVivf1KWcwd41G2Lkymw99mRpzMbx8-i0
Message-ID: <CANiq72=vKg0c4CL_h7PcZ8gSZ4U-KgZVXJ1kNA8HNha86+wEEA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, wang lian <lianux.mm@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 17, 2026 at 6:15=E2=80=AFAM Chunfeng Song
> <springbreeze@stu.pku.edu.cn> wrote:
> >
> > Since the fix already has three Reviewed-by tags, I assume it just fell
> > through the cracks. Would a resend help? I am happy to send one -- I ju=
st did
> > not want to post a duplicate of your patch without checking with you fi=
rst.
>
> I am happy to pick it up as well.

Cc'ing new addresses for you since I got some bounces -- hopefully that hel=
ps :)

Cheers,
Miguel
