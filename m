Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C599328243
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398928; cv=none; b=Tt4aPgpQw4FhkMs1Inr9+02yk2u7C+wuANrac/I53JQEUgt/Y7cCRB+43/AJGhq+6Upj3FaN9F3MQfF9OMrQTuknTEGWnFl1BCpeov49lMEkY6YniZRi2mpaBkyx5Diq5U42ZWZdWAQML/8DG0zWnekah7XCVAj3xhUUT+RDFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398928; c=relaxed/simple;
	bh=pyzRCOD1UmU2geAXFDx/ZeUikbKuoCXAHdKTbQBsFF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gmnlv7mEhu+ogA6RnpkFfnX69HQP+Jw7kBf02sr9fDLO911qOGMvJ9hB/+65cgMXUt+K8WoTIQDmeKcfXI1tJf8HYpoaxnR/bUwzr9UF+JhZ4bC1TdbRbZHAGTyN6U8vpJqQ/yuAsk9bCU2SEmDyqLm+ZYtRKNA78SAGOMd73BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cW+jbT2X; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cW+jbT2X"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b936b85cc71so411633666b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 13:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772398925; x=1773003725; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mezHDVLpKDYbfdxOWPZQ4Kx1amzQes9ySZ/VWutVgTQ=;
        b=cW+jbT2Xru8yclqJcKuOYywZrrJA1dcII+MMQwxtd4tV4nhJD8spYnYji/UPlYUZfT
         TrFS16K5oLHEV9/7Ay3397kREiM+DgcStRhBuiifkQzlgTqcB+9ETt4+k/+H1AvZ2nPx
         Ag+Uwan2GAIcvgMD5M4EDVvF7Mi490WguvokI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398925; x=1773003725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mezHDVLpKDYbfdxOWPZQ4Kx1amzQes9ySZ/VWutVgTQ=;
        b=t3eZEA+sPjs1epnISp6Y+hTimnoth0s0sa8DH7bhtfSIYilu3mZ+B+x/hgn3cKJEBD
         TdoQLgbCu2NguX9lupbOve+pF0MHM0PbtrsbzmAA00rxSzpTE1rqS+BaD+tTz9JhxMSP
         XffnwtrI+OUH8EMYVPgHI09AJ4jMF9rY+RH625hRszQpzC84cHD5b0p5otgCLIZyDR3g
         MPNBqOfj1lC6CXI4vYDl6okm/DVsBVuFBORu2LRjoRzHsx5DmuszDn461WBLdEqu6Bko
         KpbMI41yYvu+BoSD14sUeHpWUgbx5JhnMHFm185k0m8DT6XMD26/5wKM5iGC+MLOUSqb
         gJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVXPVS4zVYGT2fOlWZ62OfN/pcMdGlDyNoLCeCfjl3swah26F0TTatAd08+FztlP5XPLapb8g3tvdseAe0v4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqRZx531EdO5vDLQG5HvFHWMJgMbKwkYDOocqed5lJH4dWAq/f
	dIsEsliRlITTJDNlfQ7BuVhBLNr0udeU5BjqMF0hKPvaItdHc0di7tI8t/Tl6udSQJkPZ4yhNCP
	NJ0Bb5w28ng==
X-Gm-Gg: ATEYQzyLP5IwJ7Af+7gXEsYuifaJCdPA8S3KMwz5FhPqBlwaQlvz5usjLOu83D8gTZ0
	rxIZ0D1l8BE+LxyE6cTSY5mP4G/d8riYmicQWSCtcexHENfc0fBe7UWEsYmHRwhAT0L4pCGYbbk
	SB9Hks9XK9I1Gbh9kWYX9ak8Mc5JVwde/iswj+b9YLxHJI5ZY3OcfDSq0IYfNML8jrhNMnD6PdJ
	ytlUwfLa4LGy7VAG0Dm9BmEM5PW8SIs0ZldDlrzTVAkSDft9GgUS18Q++oDFNDxTlEMFCZh8ugG
	+jh/Bx4KCv2urPLV46FqwhIeFTg+QnS+14IEu/1CN3XJ7QwRlvfToVFrU/csKTeZ9WUsMbHL+bi
	KocbNHlGgclI3JJcuuMuGCt3yAPMk8g8sFXw9WXTBE4ozy2qa5AnFDIxKePku6RR4ZaXPV1RgIz
	CPH/2KWNwPPqgpBlrXkshp47JSL0QrZx4tzL3VfbmdZK0FvAIyXFkkTHlJazNFISskP7SeCPFX
X-Received: by 2002:a17:907:9710:b0:b87:d44:81d with SMTP id a640c23a62f3a-b9376538cddmr560814766b.45.1772398925325;
        Sun, 01 Mar 2026 13:02:05 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm398837666b.53.2026.03.01.13.02.05
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:02:05 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65f812e0d93so5825061a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 13:02:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxMfL7zZ3XoD5jIJXVi6OlfPyOJlYby7V4LC1wF26PduvTz/aPTQbhWlKsVf/8qMIBOt8jDeHTrVUW44kczA==@vger.kernel.org
X-Received: by 2002:a17:907:3d50:b0:b8f:a8bc:a081 with SMTP id
 a640c23a62f3a-b9376385cccmr645983866b.19.1772398924758; Sun, 01 Mar 2026
 13:02:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org> <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org> <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
 <DGRQ4L6IAZA6.3LD6VRCPOHDWX@kernel.org>
In-Reply-To: <DGRQ4L6IAZA6.3LD6VRCPOHDWX@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 13:01:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjDwsXRcur+-Mf0UysmNP8Vz2XcETgdp60bJnK0Nm+C7Q@mail.gmail.com>
X-Gm-Features: AaiRm521b_BDFdXtKKGw-6vzQShQzqlQVJfesicPtfpZkTxitLHg1Ed9dzI-ArE
Message-ID: <CAHk-=wjDwsXRcur+-Mf0UysmNP8Vz2XcETgdp60bJnK0Nm+C7Q@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Mar 2026 at 12:21, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Otherwise, since you asked, the string length is currently limited to
> PAGE_SIZE - 1 as it will be copied with sysfs_emit().

Well, the string length from /proc itself might be long, but do we *care*?

It's only meaningful when it matches a driver name, so anything longer
than the longest driver name is irrelevant - it's not going to match.

So the thing that would matter is the longest actual real driver name.
Aren't those typically just a few bytes (eg "regulator-bus-drv" or
"__typec_altmode_driver" being long ones I find with a bad grep
pattern that might miss millions of other cases)

IOW, it looks like it would be fine to just say "use just a 32-byte
buffer" if a buffer is needed.

Of course, if no buffer is needed that's even better.

             Linus
