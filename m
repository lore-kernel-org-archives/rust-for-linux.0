Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5B2F1FE2
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151075; cv=none; b=XAi0+Z9VUnjuJ6e5m0D5S9OChuollZQnrVIGsES0if3fBsl7E7BWXTn2WzItD80yC6UyzeF/Rir3IKdSlKxtMjvRCGXyNtjjuOpRR/NXYs7DQSrUiIq4CrdfdaiaWdoYrH/zXVUcABnTtTeuNfHq38EwN9XtI228Ii5QrWiEKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151075; c=relaxed/simple;
	bh=7mHQ1VRdjTsfmUz5G2DWe71KnbFXKlmtSzGNdzBPt3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+4QJfSFqYg8I6XLu0T4TEzstPJuH3V59vHZyocbY0QDi+G3aILzSDLhoUOBPD5FZJF3g0RVBM0ystHX4VKXwp3wt1lasDe2hP6geUGoRV2a0JkBdq7gFuJp3d2vfc6SeBrvgL2hJHXeOLEPbK4kkjnjV93DLyO0WXxz+pD4weo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWtoe6VN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWtoe6VN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bac5b906bcso781945b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 01:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764151073; x=1764755873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mHQ1VRdjTsfmUz5G2DWe71KnbFXKlmtSzGNdzBPt3M=;
        b=YWtoe6VNcxNPA10T7Do/cNqnkygLXW4xX0C4K4ZgJDBGSeqBeCzBfS5xVmNrtQwjBp
         q33us+TXNR4SXjaTgCuAEtNnZ4yzN7y2J5EywuaOjS3lvPx05GOKW1igIyMabFyWDXe7
         VcIYK3pCtba9L6jSZunvJ/6ZrJUFF2i98uHLbOIxS/P3MBNU5nyjuYnzAcLrW3x64kd+
         ZZjMUd04KCNtW8m/FlCUCpTH5W/FXR0MUPfK6Jgs9ivV85Qgj8ESoiIYJ/FqkAuRvi3d
         qh0G8BINdsRqaCgOD5qWPqb4IKaBp/6ILPIYfxiJuG/Sg/9iqwFGbB92olcAX9rQL6PS
         jbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151073; x=1764755873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mHQ1VRdjTsfmUz5G2DWe71KnbFXKlmtSzGNdzBPt3M=;
        b=Aa3JlAPZo8EWG/0Pq8cbAn8iD5PAX1Q4tRrT+US/UJKs741UjDabZU+Ite8/wKg8dn
         lRM594EQcqNn11h69aw+jVqc2N+Ur8311gUGmynLnj6isn31Ofidnhyu1B93NWCiJmKX
         A57bw/pQcCWoxLbKzaw4rySzCIkVvSUXtbTlaj6PGJzyLaoiyjnuIfZZsjd4PKOLk4Cc
         XrToCSambMOCphRLIRD4ZO3BcyhPbAmfb9jOHHMz41VrXrkyFKVfWKdcX82ldlNWaYSZ
         /zSrMhQL8PcADMVhkTtIG/JyLwl64+IqT8qmaeNs7YBTnKjD5i6vyc1asm6RuS7RQCRP
         x3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVm90BDZRqVlOumFRbIiLeYSEr4blsk2d1GNwLXC7QwTAoaA3NZZ/j2xsYZZ5X03VkJMCxV05tDuW4ZF3ykIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/KANB/dFJdprzqtYFgBzo+HCtZAkbfrHSeOeZf9Y5uLWpM1j4
	7fHAkijk4ZOg2eKqmCSYdgR6Mwgw+tcUpIgFZ9L8rD1AbVUivxUVIAtBeRPhB87OLHGXeOW2mK+
	lN5/spcWbIstXVjbIFdh67+I11MzBDy4=
X-Gm-Gg: ASbGnctTfQNExeK57aVPqjKHBszR4UNvzurYuGIL++E+VEvZ4gMsUPectzKoskOqVsK
	/ZRA8CCkliO8bD+e7pauM9R3pI/m7RrOruF/ums7I9fM41/rPQQILBfatv/ZF+AMK6d6QbCmVN4
	4TBRCRqsKt23xmOjIEAOF5Une92E0nR2F4Dcl0XKijvpxhjyGQMvR9vMquMMwmIbNryfGqCJkLT
	9bfhYf//jrNw77TLiSLVXRkVRlP5/sE9w6KpHkKNnWyujYFnSzjuB9Qoxk3+iv0lakNwDbuyKD5
	8la23H9znOqkzwoKTp6+NXp2AcIgM0ze2CCSRpeOc56+VuF3yddIrtVjF7BMNTDaRVse4NXh3IF
	loSsz9r3GaB5skg==
X-Google-Smtp-Source: AGHT+IFWUJD/OFJsIi7ionp3U86q+wmuQeZBPMs00ZPJQzBu76WJ8YVwfw1gF+sDPGVltKQOGoQnZvvegokGD9/vJig=
X-Received: by 2002:a05:7300:7b01:b0:2a4:3593:2c08 with SMTP id
 5a478bee46e88-2a7249fec39mr7449116eec.1.1764151072733; Wed, 26 Nov 2025
 01:57:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114233045.2512853-1-ttabi@nvidia.com> <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2> <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
 <054d9c84-4231-4662-8847-4028228cd290@nvidia.com> <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
In-Reply-To: <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 10:57:40 +0100
X-Gm-Features: AWmQ_bntZ2P7XIQ-a76ZdHb1powt_8RzB70VcFKn6vPRZzYBlZID5TO9jCwn_OA
Message-ID: <CANiq72mEE7DCPNgJ2FS_c7A9C36GgjkD8G-7nV1oLC9RvSbAjw@mail.gmail.com>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"lyude@redhat.com" <lyude@redhat.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 2:06=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> IIUC Timur's proposal would not require an Option as a field, just that
> the method returns one. I tend to agree that this is more idiomatic.

+1, please avoid encoding "states" within integer types and use the
type system instead.

In fact, where reasonable, please consider defining newtypes around
certain integers uses as well.

Cheers,
Miguel
