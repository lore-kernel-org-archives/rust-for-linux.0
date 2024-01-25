Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFD2566A
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 02:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706149676; cv=none; b=W75+sSo/P+HpU1v/Gnj0p+qRRySUmhRsyz9UfYRb/ytAHxyrcjxTD5LUbohHu9AYVi9TUbYeFctWW8NPT1OPvmIfbraBNpHm1nL6ET1dJoiPp9Ex5SvumrgE4mDvTGokfDWJPlrV+rBaXrDWvQGGnV/O9vpUluzGtfW+GNcJmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706149676; c=relaxed/simple;
	bh=qnq+G7LkKlEn08znH88snbb7Lp9uGgBR66ovXKeJlfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQLSQfPZJUmekucAFpf7veporCunXIrMfBs0rzOs9YBDvD1p+tWTu0sIYk3b68CBar8JU0Zr0Nq77G0FW3IL10/G5e03iZeTxXDjRXxwcZEcE7joR5DKqo5HRnIwfBQ2FJwTDy4f9A8rwLfHsa3Vs3InZ/hJpXoxxQhqxTVa+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=KqqBqQly; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="KqqBqQly"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6000bbdbeceso38001367b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 18:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706149674; x=1706754474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnq+G7LkKlEn08znH88snbb7Lp9uGgBR66ovXKeJlfU=;
        b=KqqBqQlyXGztBCQd+nXQg1My/BfwtdFVHJBU/TzNNjfSlajiyoMAyl6kfrQHYKKyc5
         VvfUp5B2afVRYfCRP+kXYzuhHeVFpUCybwTttKby1Mx24IHIqWJIgfj01nra9gADJhw/
         yQdknOYVOq9ABfchUfyV8O+Y1SBHqG9mlWJA4nM0K4X8E07OvrpMHS/TQPIAukIFjfMB
         3Ub8SZhl/yOf2vqArbRMqNy6ISLqtcqRV4z9y7zC7C27TCoqVx+kPu2q2iLPehMURDJt
         /43gGU56x1/GuvAmvIILJL2Pi1JVAuqlcrigEKfyIlNy+8quPYGFSzhiN4uMOvoda4qR
         NzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706149674; x=1706754474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnq+G7LkKlEn08znH88snbb7Lp9uGgBR66ovXKeJlfU=;
        b=LZ15Sijv2/uuMEtg57OBC8aEuh1P5g5unZk1zQkyijYlkFFcdJxFRITJMzhLsjyq6P
         BhAQMMSvmGM10rE6TYBZ8MFvcCL5IL/FP2GV0Z3yEot6kgArKBBhMI1YvjPf7CZKnGDp
         //XTaZj75bXmRqZBcAxrvEtG4Qb4nlMgXfwsT4o0woDHv0rWhP4TzXCxbyS2PCsPepWE
         5Bm4BPknnyOhk1xzQ/q6vKgpoHJSTcYI1BtTIdC6GwNtbMywZoviT844FJOI00xut4QI
         XygsQxl3rEcJkO8cwatxsL+L9UgbBbqu/yKqLvgF6kwN2Aat/qJD9bvKTTmGC0iePlEC
         x4Zg==
X-Gm-Message-State: AOJu0YwsdTbHnU4lfv8m1QidzoZxGr84INXqQRI5UO3hBcbtOdMGySI2
	5l77LnW4wil0mN3CTzl2mlZ6am6/PlcLyg29y+VEeO/jEuQoLZ0PPsljfin1eHW2FR20sIkS8Yd
	nET8IBjB72ttMjcR+4go84hIXtmQtvsRWGnOJ3w==
X-Google-Smtp-Source: AGHT+IGzXCpT2tr5AIzjEqYyLg3qi2FnVeAovVO4V7L/EER003yMPuIRNJvBa0lnUo/XKpko8z7uoexlATle0QB2qE0=
X-Received: by 2002:a25:8106:0:b0:dc2:234d:e6ac with SMTP id
 o6-20020a258106000000b00dc2234de6acmr241935ybk.38.1706149673932; Wed, 24 Jan
 2024 18:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125014502.3527275-1-fujita.tomonori@gmail.com> <20240125014502.3527275-2-fujita.tomonori@gmail.com>
In-Reply-To: <20240125014502.3527275-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 24 Jan 2024 21:27:43 -0500
Message-ID: <CALNs47vYXeYeNzbpo0CvH1EX4-od9ZuD1soPTZLaJ+qw=PS3pw@mail.gmail.com>
Subject: Re: [PATCH net-next] rust: phy: use VTABLE_DEFAULT_ERROR
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 8:47=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Since 6.8-rc1, using VTABLE_DEFAULT_ERROR for optional functions
> (never called) in #[vtable] is the recommended way.
>
> Note that no functional changes in this patch.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Link: https://lore.kernel.org/lkml/20231026201855.1497680-1-benno.lossin@pr=
oton.me/

Reviewed-by: Trevor Gross <tmgross@umich.edu>
