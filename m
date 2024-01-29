Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5F657AD
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706535883; cv=none; b=jYL0/SGQYp92TQq8B9LRlrbaCF0NjOCTyrF8bPiIsBxnEBBebOiW9tmNydB63rlz8c1DqSvbzpuZFeqw3bPUUhbOt06VJIS5ATDvT10OTSA74jVX7RKmB+GKSD6bfooLwCGo/bqJW1jjcrwYjJ8QPIeDX553UsNDGdoAmmudwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706535883; c=relaxed/simple;
	bh=fxpr0jfLJ1BZoumvzLNGtLFQyDCHp+0ZqHuTDBKxtD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ttDwS6qtUOdujJIuHngqgzM2PJMSYFb/GbU7vR/QBIkcqj2bhECS8otwtLKvmxu4dRea1f/l6bi2MDqIBrXdc5UTvF7C55pIz+e8s7J+uctjPm/pftCKez4aFVR8vGwxhRua/nDl71j3xZzSUBqEZcLJ3VzrE/KOHAXBn5bYWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=GosVN6dy; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="GosVN6dy"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5102a2e4b7bso3886716e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1706535878; x=1707140678; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxpr0jfLJ1BZoumvzLNGtLFQyDCHp+0ZqHuTDBKxtD0=;
        b=GosVN6dy+OX1VciJaSAN0x2LRZjKHIAetG8CGcQCoDn21RniL6Z+SwVxFx81HHn33f
         TQ03v1meR3B4v0gVG6lMJd1321WhvHAA8x2GxDgr0PytveeVMaexXyzangHCB+KXALbo
         ozt8bwl3izzazhIUjF8HX9PmAj39HCmU2X9ZogQ+eHHJM2Bqnxz7LjAH7HPlFd+Fz3Vw
         8CkamVp/h5Jy8XnklKiX3MgAmXioq508aiiCxThRRiQW0ZQmT+eDlbleG1b3vudBHf1+
         XGLoGsxfoZ/Jboqxu986ksZ+6mzMJ4UfxdVAo93yzAXig5PECfpQo1L8pUmFokF0cEfW
         EW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706535878; x=1707140678;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxpr0jfLJ1BZoumvzLNGtLFQyDCHp+0ZqHuTDBKxtD0=;
        b=jJQhHFaM1LGEWG9Oig8V7cuM011xrf2cWq0YqovhIIzTDbZMn7UrCcH8RkM6J6v2AX
         1OFW05WYk9QXGN3WqHvcnb6o9P/tU4KH32QHqwfnTtOhJ+bfgBfRi2fhJwclIQudkWgC
         E/OX4juocGE5/KzBgtTaV5D8RAuoKRyvJ0fN6UtzmVEb27J/zv6Qd/SMEd8t7ldV2xi5
         lxq/7tt4aOjpAfW7Qcz/45BsNtdk9lEOwQIL2JiKEljTSFVXilem4Y9ri6PlbuHCsQ24
         Mpo+fDe6drsF+jzoJOwlsRsICHAEntyF5F9Nrv/5frTPj0jBbt7W+7rVOsVKKq1N6nNA
         Pkng==
X-Gm-Message-State: AOJu0YxDqJgnxacNyCMWYNrgUvB2PTsIizsKJGyeu8e7x1xY1ZkDIP+L
	JC88bISlo4zzT+jZ+3/1dpVXF//LJVHJ392DAbAo2M0+PBtJxAXJyvHUqVBrs8nJ34BLBJpItcE
	+
X-Google-Smtp-Source: AGHT+IFVqsBbwdgj7EewY8BkGYY23wg0krUJF4qWKa5Y+t5wC7jhahZ9dzmN9BzQNYTV+0Xi1GcBKw==
X-Received: by 2002:a05:6512:b83:b0:511:1790:e3dd with SMTP id b3-20020a0565120b8300b005111790e3ddmr27625lfv.54.1706535878523;
        Mon, 29 Jan 2024 05:44:38 -0800 (PST)
Received: from localhost ([147.161.155.108])
        by smtp.gmail.com with ESMTPSA id fb4-20020a05600c520400b0040ebf340759sm10232554wmb.21.2024.01.29.05.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:44:38 -0800 (PST)
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: lsf-pc@lists.linux-foundation.org
Cc: linux-block@vger.kernel.org,
    rust-for-linux@vger.kernel.org,
    Jens Axboe <axboe@kernel.dk>,
    Keith Busch <kbusch@kernel.org>,
    Matthew Wilcox <willy@infradead.org>,
    Damien Le Moal <dlemoal@kernel.org>,
    Daniel Wagner <dwagner@suse.de>,
    Hannes Reinecke <hare@suse.de>,
    Christoph Hellwig <hch@lst.de>,
    Wedson Almeida Filho <wedsonaf@gmail.com>,
    Boqun Feng <boqun.feng@gmail.com>,
    Andreas Hindborg <a.hindborg@samsung.com>,
    gost.dev@samsung.com
Subject: [LSF/MM/BPF TOPIC] Rust block device driver APIs
Date: Mon, 29 Jan 2024 14:17:22 +0100
Message-ID: <87v87cgsp8.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi All,

I would like to propose a session on the Rust block device driver APIs.

I submitted the APIs along with a simple null block driver as an RFC last year
[1]. Since then I have kept the code in sync with latest mainline release [2],
cleaned up the code, and added a few features.

After talking to some of you at various meetups over the past year, I think we
have reached a point where we can potentially agree on merging initial Rust
block layer support, along with the null block driver. To that end, I plan to
send a few iterations of the patch set before LSF in May, so that we can use the
session to discuss any remaining details.

Since Kent has also proposed a dedicated Rust session, we might find some
synergy with this topic [3].

I also maintain an NVMe driver based on the Rust block APIs [4]. Due to
community feedback, I have no plans for upstreaming this driver at the moment.
However, it is a valuable tool for designing a sensible Rust block device API
that is suitable real hardware.

Part of the NVMe patches are abstractions for PCI. Other users (drm) have
expressed interest in these, so I plan to separate these in their own tree to
make them easier to pick up for those users.

As a last note, I have recently become aware of ongoing work on
implementing nbd in Rust. The work looks promising, and I hope the
author will decide to send the patches, when they are ready to be
shared.

Best regards
Andreas Hindborg


[1] https://lore.kernel.org/all/20230503090708.2524310-1-nmi@metaspace.dk/
[2] https://rust-for-linux.com/null-block-driver
[3] https://lore.kernel.org/all/wjtuw2m3ojn7m6gx2ozyqtvlsetzwxv5hdhg2hocal3gyou3ue@34e37oox4d5m/
[4] https://rust-for-linux.com/nvme-driver

