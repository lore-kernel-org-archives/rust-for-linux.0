Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37F2D47E4
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260709; cv=none; b=Ay0s/qtBymVr5jh1xhBLEz7M3CBYtPa+pmKpCcI2JL2D1dn0y1SDodDhqX3BMy4/sf/T2IltWPGL5BuX7D/hDAeIt2qmWr7PtrIi8SFcoqemhM73TcEV/LoRl3xua75p6FiYMc6mJHRhIjScKcaBounDNWsjg3Rp300dQ6faUTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260709; c=relaxed/simple;
	bh=v6JwegAm4ikhwCcSKf50iSKtkRDnGT5dpPezcddbzsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdMfP088IfF+k9XkJh9Njy1fLhsFEaWcCQ3B46MHodBqZM902R+XPY162z0HHFFEs3NndG+8MMTFpa5FmpCGLgD6Z6/ndyT6PtCVZ77olz3o284syZgnV1BqG2ZNfvs+lnjlj5mygs9VXJMTvI8o7HO2myH6CQWV4ZKT/34ARGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCYJW4Ae; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCYJW4Ae"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bda175a2013so84235a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260707; x=1764865507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvwMxPMXkVguu9fyHSVTewNfjFK/r2bpKHgrRbM6C5I=;
        b=RCYJW4Ae+prP7CY5mZw51Nislhlx+MzsmWcbVCVI57zxulB52CjoZ8+F4jBc11s3C1
         Qo/WMzBZZrhti7IeUADFjheb73qWkYd9MLbxq3jDogbkB1wqi2w0mTDswOdc+zYS1L99
         yu9oV+3d+IrDnxYGL/tnmYDR/nhReXkjsUSatgctIObJF4nrWdmSJqjsVriY2XO7x6g7
         YO7bI/ESRrWWyDJNlWo+ybuSqSXJnLXAvtoJQ6De0NuKd6lBSv9wceJfFRk8VRuV9S4B
         QXnc/9J/M3h6XjUhX0aqFqEkJFpGgNaialdAmZCJcKMxNNJMW8zsILVSdz4L5NmpuZDH
         hjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260707; x=1764865507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvwMxPMXkVguu9fyHSVTewNfjFK/r2bpKHgrRbM6C5I=;
        b=N+R/R1IhP8ivl9p/ebqjqCf/2PECU5HQdPJtqDP65w7DV5KvwWK2lO2ycSqUAGdsYI
         ykptjyLyv2Cpr5bj8m9HzOTQa/mvivbggC/vjjJ62uegWAozwjTgwtB4LEUzySndTTwf
         zelXVXvQfuNgo5FYE1uKTPQZO1Wgx/XXXe0D6FxMZa/rCHFAJoYItUBT6N+R4JxkX+P4
         r0uglClHTr2A061FkMcRv+oCBFpd2ImDSsRT6NhD2WDXM+YbmcpQpyLzGBVowUmq80DG
         BpuJGzZ/GE4JWBzjWZDfu7R6O1tcRC9B9XfLdgxC/13heHYVGIY7+8AFOWNrdIEstoZ9
         jujQ==
X-Forwarded-Encrypted: i=1; AJvYcCVekAiSE2aChzgWWb15phJdy1oHQculZqw/V2scR1fgghlL9haUuv9y3yKdTMuF+h52v2Z3pWPz1UkkMQhHzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8U6um3FLAiw63QcGQDJBleooApEtOy0n65CEUVlYah/hDr7C1
	V7y8I9eBq0KmL2g6SFyKdCRQNR5wf2i6jnZkRNIKd/nyVLNR0yKXwzY0eAOw8aN0dhuKc++W6Zl
	O+fpkvN4JiT/zLvoVsVIVtW63b5YXZM4=
X-Gm-Gg: ASbGncvk3b45twTkmK/g/O87Qc108kdHk8C1FpBIl98/sAgnBgX+HmMezg57zkaZd1Y
	zSJEFPWIVxcXqDmzPOu5R4pC51BlMZ1ZwLVqnd0lRnexkpEI11isJ4766RMmC3vwzt+h3In9P39
	pdo06pkbIARuLS61TL9l7Ud6FHpdAPU5X3Ui0VNiaGsJauCscuQAerb1QmHAbmuApOPk4jyNGTs
	JAePhRBZnbI05V28XurFpWIpvNev8bmJ5FFiQRwxH4mwi8MfiTFDJAeqObmGzx1eMLOX7o5UwyI
	GhTzckZaxkOYrx7eLbrjyzqFm2tS8F0ta1zfX5BXxC5QcKkUHZ1PJz/Eb/dZvNNUGheE+v9LFGn
	wbN4oL79g9gKr6rj/HNnRCW75
X-Google-Smtp-Source: AGHT+IGhk6hUZ3a9bzNOnhZkcMChxXS70KNTBUiCe6/sighvrvSoTcvOenGcvVQ52PQpwNpYvz7HWyFhVnzTe7+4tyc=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr14716441eec.0.1764260707343; Thu, 27 Nov 2025
 08:25:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aShM9CAyRPe2gYpK@fedora> <aShi9fAhQzRzWj9X@fedora>
In-Reply-To: <aShi9fAhQzRzWj9X@fedora>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Nov 2025 17:24:54 +0100
X-Gm-Features: AWmQ_blqBDLPT2REzNsWPz_PDt7dJoJrBrS5anBhRpnQUJwiYuPcI0kJZluI9kU
Message-ID: <CANiq72m0Z5ax3_ABSCo6Ogpeuv3u4aGsK2Fixx_q5mAMaNcy3w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Return Option from page_align and ensure no
 usize overflow
To: Brendan Shephard <bshephar@bne-home.net>
Cc: dakr@kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	aliceryhl@google.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 3:41=E2=80=AFPM Brendan Shephard <bshephar@bne-home=
.net> wrote:
>
> Changes in v2:
>   - Reworded commit message to follow the imperative form.
>   - Expanded the documentation to explain the `Some` and `None` return ca=
ses.
>   - Added a period at the end of the documentation comment.

This shouldn't be in the commit message. It should instead be placed
below the first `---` line (the one below the Signed-off-by).

Also, I would recommend not replying to the previous version but
starting a new thread instead (it is good to provide a lore.kernel.org
to the previous version in the change log).

In addition, if possible, it is nice to use `--base` to tell Git to
provide the base commit.

> +/// Return Some [`usize`] that is page aligned. Or None in cases where t=
he next multiple of
> +/// [`PAGE_SIZE`] would overflow a [`usize`].

Missing intra-doc link (this was feedback in v1). In addition, this
reads a bit strangely, and it looks like the first line of the
description wasn't removed? That would make the "short description"
(the first paragraph) quite long. Please generate the docs to see if
it looks good when generated.

More importantly, please add some examples (doctests). They are tested
as KUnit tests automatically. For new APIs, we always try to do add
examples, and in cases where there are edge cases like here, it
clarifies quite a bit, i.e. please provide a representative example of
the `Some` case and the `None` case.

Thanks!

Cheers,
Miguel
