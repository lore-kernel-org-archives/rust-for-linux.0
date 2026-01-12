Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A657364058
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234226; cv=none; b=FhO7EuQ5cJZ8Rbkil8BQBKCNxUlOgJRCDM5MMBV0c/SoWXJN3YdabI/pXa4voctxbPuqywb9zhe79LJgOvHB4+QNSSqeDXPjsEAkb2RaflGNP1RX8tWT21rxX7SGFN493C02AzgHxjPKUwprLCzSLRR+C5qHiHcbiB8l2leBdms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234226; c=relaxed/simple;
	bh=dn/EPjKNYXdLp+uPGuGt+WNWn9yXqDiTB5N1K1Vg0CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlc6lfwpaxfg6CebCVWHCKZcGWD4JcOza0CPcpxH0JMr74qwStY4V/31G/lkTLaL5fkiSOe/7xqAXGRuUQ8uyQWO61Vh0JNQYeid3KMGzfA+XFQb8dOrgxE30rhknVsFs4ExSfVRq1q/+rKbClD9ayKItUTMK4a5AAmNhXSc7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MJg7RaIk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MJg7RaIk"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b672f8e40so7276844e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768234223; x=1768839023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29v6Paigsiyn+ZGmf1bcFbc2y3Q27qqBzODLocSfnys=;
        b=MJg7RaIkBPynwA5tkLgL6mOWxzVxWSScEjCTeHJ2AaFokx/s7PtWvk/+wpJyS5xG9S
         SbYJy4/2LPIy54XNWrGvXGA01EtoZtIs6bBPbgYuFL3TB6CEJ9uNGh32XXeHyPP9bt+s
         KgCr5Amr8ft5uaDufVKXGUCzg3Cfs1hp9XC9MsBlVfhBi3aY5Zr6oJ9TpelROUIjG1oo
         Vi9aiCTKvBuPaSQsS9stqW2CyBJQ8uhw2FnMubO9tXpL78Y3noGofuNt6rGZ7//xcbbq
         CgmA/1GG6mkzvoXaErSXUmJv1V/Pb8q397CHlsSL9Bf5pbMW+3HVZ/HlnxI39xxncQmr
         oA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234223; x=1768839023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=29v6Paigsiyn+ZGmf1bcFbc2y3Q27qqBzODLocSfnys=;
        b=LKYYJ073wbDMMTalhHCiPqc4Go8z0xCXsC/RxCmzb5771Wcp2u2Tlfl618HrYZqu1y
         Q48l664TNPprcZ0biJU3p6UrBAUFtYJL3u2H5dAS+pAjgXaAG/XJi+rwUvnL5Xy0vsOz
         G0Mu6OPJfRU/rGhMGwvf4EWT3bGAT3URWSeBsBDArRM7DpiJaEn2LI+KaghfviFUhX6V
         Uh7lZ7hDHpt+FkluneQ5IicGwOlKavspDJpGxVUsz4KfcHmqzwnGbEyMuZ3KfKl2w3pD
         Y77ooUXxd4PFD28xdknm+U7toEbZbQJXrsAFQhYKvxMtduDXB7FxmvlA2pYGxF9b/VlE
         ysxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm6xfO4o1CqIcg7H+9KxO5h5fxj1Xf9BkY2SyX4wzXx5vSkRynNDqqPzCenTiUJCOZi5vN+lHZG1A0/qKuSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV60lp0SIfFaC+rNSMVuZbcVr5JdXNp2PRzXV5IJykYgXHEuq8
	YpZPvBi8ZkSKmygHWHWrj6l68McKzEoKldRsyZVlpVDfGTH+wg4Q3GM+1EMYLkh8+C8ao79ijY0
	eHjK5kAGdZ7TFrY5Cbh/PdmnmfgjLEKj4T80uEnwm4Q==
X-Gm-Gg: AY/fxX6MLQZhCHIFM13wYOFW2hi5QClVseHZd4244KkBvnGfOprG1Xh3I9p1jXyQTXp
	/BS1Cj1P1S27jELo9D6z/Q99dBb8tg437AW/v+OG5DuQk3LHBZT5NvxGVeu2QnGgix53iGJ3Hoe
	UyteDfqLDm+KuF3zIt4LEKU7CFK9P5PQBBrv0or/uQvaA13RLaF2riox3Nf+OXibNbxBpssT9k9
	4a+1kgWY5AxzT5dk6FWKjroIdGZJ58oIkia3HJCQYx1doFonGge9id6Z24xydwuvIRPaelYTHRJ
	9mcW1AgGJ71gG1u7MvkWYWEMCGQk
X-Google-Smtp-Source: AGHT+IH/F+8UXQBWMafUa0//9n2IK4silrmko5qlNCMfJ8DEs5mEIhjV2bBpeLqY7hW8xcqrtC2JpVhGxus6l6EFR1Q=
X-Received: by 2002:a05:6512:220d:b0:598:8f91:a03f with SMTP id
 2adb3069b0e04-59b6f0406a8mr6412089e87.51.1768234223211; Mon, 12 Jan 2026
 08:10:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com> <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
 <aWS5Yg9xScOR51Q1@google.com>
In-Reply-To: <aWS5Yg9xScOR51Q1@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 12 Jan 2026 17:10:12 +0100
X-Gm-Features: AZwV_Qgkd6h8AXwXfDoqiqH4MwCnOw8_crkJuF07wB8G_ViiItLjEuT1rWUfrDQ
Message-ID: <CAAofZF58s-q4WxOFYk1K29x+ceiX7rjFuNo498VVqL5AZckkNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 10:05=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> [...]
> Yes, we can provide a new `struct PerCpuQueue` with same contents as
> `Queue`, where the `enqueue` and `enqueue_delayed` methods take a cpu id
> parameter.
>
> Then, all of the functions for obtaining queues at the bottom of the
> file are updated to return &PerCpuQueue instead of &Queue when a cpu id
> sone option here is tohould be provided to spawn on that queue.
>
> This way, you write:
>
>         workqueue::system().enqueue(my_work_item)
>
> or you write:
>
>         workqueue::system_percpu().enqueue(my_work_item, cpu_id)
>
> This way you must supply cpu id with system_percpu_wq() but not with
> system().
>
> --
>
> Another approach is to add a new `enqueue_cpu` to the existing `Queue`
> struct. In that case, all of these four combinations become legal:
>
>         workqueue::system().enqueue(my_work_item)
>         workqueue::system().enqueue_cpu(my_work_item, cpu_id)
>         workqueue::system_percpu().enqueue(my_work_item)
>         workqueue::system_percpu().enqueue_cpu(my_work_item, cpu_id)
>
> which approach is best depends on whether you want all four combinations
> to be legal or not.
>
> Alice

Thank you Alice.

Personally I'm more oriented to the 1st version you mentioned. Seems a
cleaner interface for the user.

Should I start with a new v1 about this, or better increment the actual ver=
sion?

Thank you!

--=20

Marco Crivellari

L3 Support Engineer
