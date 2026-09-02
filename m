Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B74A8FDD
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377908; cv=pass; b=h9C17kIxpsc8OoV8QvmPIMa40KbsVpYyZnC+A8p9GOfutdvprOG9/NOKnKCKexFnSZtqRR7UMgaZwaNiLRX689PnuDd9Hhmu6BdxGgBvufKASQHJQ+btf7UM5vNfSTJIly+77Q9ArxpuSszfuoPdQg1b/Tqil4WhWPQGxYgbi9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377908; c=relaxed/simple;
	bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m362ei3W8hdVDo5BrP6WjDMoKSQ9+Q+R0tRBXR8KwgiOz/0ysDhcxVIsTskvn+tW5P5tqTOJjzr4Ol/aGbBb+gUPjE0mL6dv4lF6E0xeZ0QEzPOOvZzx39h68bYsuhLTVBET6DaTRUueCHgBkDd8PDSmk294cj6ZwTCC5Cd5kHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEXmUauc; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEXmUauc"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cc372d6b2so18735656d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Sep 2026 12:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788377896; cv=none;
        d=google.com; s=arc-20260327;
        b=RlnbtkMoopuv28/LZRxbNa2o7FNi+V31E/ATFz2S8rsKAY963SogPbdP1st0SFYrf2
         jlxozJh7a6GdRvjrCD4ESBntglbl2OmIlVD3gPLjjEVLkg2bamsEItOa6oECuIvrIGfL
         dVb9jVRQK/X+SLLv4zyoqQqcIV0wMDc2TqZK8ugaFcsh2U03csukNCjMv7GuJeoBc1kP
         VFsEZJpaN6YKfcL832LOGVQLhoY3tt754BpH9VR5SeBBFo0YdevwDgWYe2Jch/jT+Ucx
         ZIUSFPIY4YaJzKanxFUwNkpemimR4mdMFTczDpZYWGQbcTCieIJCx8QOUBeclld+0pyf
         a/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        fh=zG3WNcb8P3CGhqFg1toOQ4IQcT0BpTwjwZrrXGyo59o=;
        b=P0alWwVpNF5OliZ1uiLvKofBHefkPwQdqJ0356budOi++76qicwSFgAtVar2ctxvuS
         FRUOgrW3Nrcdzaxpt0TzXFfUxV4cBso+qLUz23QHtatLnLaWeY3luOmSNK7bx+sqB4lc
         ahwyUNc0kqnnCfWzfbX95RQJErMDzOkQIpkYuozJsRFogk76TDU5tS0G3zU6ELWgGJe3
         lVer+pK9WbicGEjIz4OK/Ea6z+1x8npexOx52Gxmk97gpDWcrXuhhm2xmdRpUrpD4HPo
         q6lDuNkRI9PvBUZ7vbP+p5lY3da3Nl4r5LxhTQY5X/3ZESUPLqiqCOLipfzSHkl1v9XP
         8B6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377896; x=1788982696; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        b=KEXmUauc+ZkwkZCWvWyWC7k7azK95lh0+eeOaxObKFmzM4zg/Ki9JD8fzIXJxu4usO
         q1/2W99BbN2VtDzpkcUhru+8iJsT6Oid+lkWbZ9JsQb1yX/R9frHWfV6H+w0Oo68PcRT
         dDI8rd31XIVFfx4/1PZfpnrdOY4Kg3MWxl3yO0NX6lJPi2f5Yo1sjt7e+e+PS5NK+b2G
         +7UVfoXITlwxOmWKAvkw15T5JOvXZvRhu+JKY+ctCRmwrpbV/2QRxQXue9nLRxojNL/i
         iGBdbsCIXsGvHyE9Ftg2HDi11y4geEnMukq5vnT7JDbL+URSNtNm+qq9TRXixn+9WBjr
         3OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377896; x=1788982696;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        b=pnjdK5t0wtywRKYbsN7kU9Qy4L8mS/o0t86bRQVSBoEPeNFhv8KxyVPkj+phtNoNIm
         ewrdMRy/KKwZIGuKgw7D1DTj8N3TDrDjyBT+eNx91WH1GLPwvsIjuWk4XyDC1tSMC5Ad
         pP3TJJGwSwEwX8ySc1Py0+r5fD+J9giW42TT5appgzOggqPaDOR1+TT1W0pDqw6jmrhN
         SjBmni02q1L682Dps5xanEAtBDVW6FOk08paGCikcpLmDA1ti17d54DQtGAqlog/Kh4V
         iWOdBgDT1GGZ8C+R/8h108budRCOwDYrnHzdsdEntj5q944AIq1coXp8hxHg4GDeygN0
         6Zvg==
X-Forwarded-Encrypted: i=1; AKwUvBwukSGsFH4F+Y5Qkcwd8mBYQ2jGBONXz3f7zKqbxbT/WenSUbl48ZwbUxHPsSNzihCB7P7wr2fcpeJLESZyyw==@vger.kernel.org
X-Gm-Message-State: AFuF++neG0L5B9yz28t/y2R1adAY3LOCaWWf2Kd5/qR7j0wN6f64wo1f
	wChjF2HySg3vOHlFTfH0fiK8DGWxDPg+ZmUmkBKUnnnry9VQv+lF4DvODcWqRmzOD1VRyRqVlz1
	q+Q05VtkHa3stJLMh0+1hPFgpgFKRr+E=
X-Gm-Gg: AYBFou1jW0kZkJXFbZHi4JkyDYcKPDirgs7cX5lci5ccJF+wtgSZxximSalYUgIV/Gc
	0kv5Us8hPe/mnhB1qd2qlVWfWhg1sbKb6Fx7DRUCqufCWtFq1qFlU/LP17Ft+FwhN9K6mqluvc9
	o40odAjP7KpKpEEg8kXACA/5k+gC3lOE9e5/Rib2+ImcKzl/AVt7x16unzXIsduuA7jn5XR6ZGu
	bWCClo31L0dyGRu8HLbg0lZ1er7AqE+v8BPpmWiTwI6kzNFlCddJ2BK/YiHsh9Surmv0QBx8BCn
	aikueoZfceRG2sjbO3XOdClAn8d7lIDAyuivm7LQ0aqeMSnHGys7LWnEkLcZbdmZBkNv1tbHM2u
	4CNWDJ9fXesC6+9OPCvYZkQ3c/HLxhVo9AndVyN4x
X-Received: by 2002:a05:6214:2123:b0:908:951f:415 with SMTP id
 6a1803df08f44-90ebb005390mr85498866d6.13.1788377895624; Wed, 02 Sep 2026
 12:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org> <apZCTUYiN5FHCkCm@nvdebian.thelocal>
 <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
 <apZbKc5xMQ1yTBTu@nvdebian.thelocal> <DL3SXIIA4FID.2V3K5YC91RM3V@kernel.org>
 <apetgjQ9zWpJATj3@nvdebian.thelocal> <apfJhtr6BpMosz1q@nvdebian.thelocal> <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
In-Reply-To: <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 3 Sep 2026 05:38:03 +1000
X-Gm-Features: AcwNN1V_5ha_snCzThXD4CKKNnM_EsprQAGBXp8YrnRXkYcD_qK4vrhdwG6Bj_k
Message-ID: <CAPM=9tyXx=BVy9E6PZNwYwab0SWWpFOFgX2jktqPVumiqY2viw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 05:27, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Sep 2, 2026 at 9:05 AM CEST, Alistair Popple wrote:
> > On 2026-09-02 at 15:21 +1000, Alistair Popple <apopple@nvidia.com> wrote...
> >> Ok, so just to double check are you happy with an accessor to return
> >> gsp_static_info as well?
> >
> > Still interested in your thoughts here though, just to avoid churn because I'll
> > probably pick the wrong answer :-)
>
> Yeah, exposing that for gpu_name() seems fine.

Though userspace doesn't probably need this, but we could I suppose.

Dave.
