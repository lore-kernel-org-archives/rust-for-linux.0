Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D531E49B
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Mar 2024 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710957532; cv=none; b=RpDHQ4vbEjhx++t/6EeGg+7MuC87iU8dI20KYz/dh5dXwhqYZYuhr0ZOqk53kyjqbHW2f55oPcUIipRBWZI9WAd9PsGqSrflPFTNf6Rp2u44PIBhIQt92evnCT4ByqIBRz0Vd1ocaGgAoD4luaA1ul5wsKkbysSwz1Wfhv29cu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710957532; c=relaxed/simple;
	bh=YtXdrU849Kwc0OUOQcjaL99LbcAPmCdoQB53Ug/gyfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=imS9eK6ZBUFTGqJjKyDf0k/yM452Jy92SzsVeteBLoDo2NoJYehBlk9plf8SYb9xtL5pY/IBcoRAjFh85MjzI7xMgPzSad9RXiySRlcQNpjeE/r/UCh73iiCm0nccFTFyNfsnNnstnV5z0Zc+G1w6cf/0oxeq2RKjSloBitGmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIfpQJSS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIfpQJSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710957529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Axnmc3c8wXrwtc1SqEBNyEeeabqX4hMnATXLfXqHXCQ=;
	b=hIfpQJSSUQ/zPaV69Zpvtjdi4Q4wBu4iV/ONfv7tBLkG8HDDMftD3+17HCiQXlp8eJ3EEm
	UWqDzK/pRRTSbrqVoogHkrOVU1TBYmJ1VWwiJk4lOM8Nfyh+7EJzspOhectVT4/GicHQhk
	8kTx2UXAi7o9rxwLJeZg4tZ5JBuf9BU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-YEQzWpb2N7yw4lRAmkY6Bg-1; Wed, 20 Mar 2024 13:58:47 -0400
X-MC-Unique: YEQzWpb2N7yw4lRAmkY6Bg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a46e26556a2so5316366b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Mar 2024 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710957526; x=1711562326;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Axnmc3c8wXrwtc1SqEBNyEeeabqX4hMnATXLfXqHXCQ=;
        b=b11nK+33Wj9HmyG1nPL3Wo2frx5qCyPHD7UsPy4bATjHaonfI6eV5PiOeqefcgqn0E
         BeVTotklj6GaUVRkLr6HgZeUHi23+Tu/U2QxlTaKI7zWjcJwGcQG0aY7BpZL9Gpy19j8
         WZSp9/3AHK60ypbHD/QeO4rewok4IU4jgpGXdB5q8soXBXhQqB8DfCimNAA5gO3Nmkle
         LO8wymKzAK22R3QHFHVhnbf6qODAjrcsCxNCb6p2sKefBQ/7f/0wEONfbGusTYqkiMWc
         aip4/tK/uKgTFpQE+FRsXReC4td0N3MlRvp+1QmHk7VGpI0P4pmjVqLBj1C79ODe3IUM
         EI1w==
X-Forwarded-Encrypted: i=1; AJvYcCUhu20N1rFC1gfs3D41QL6+VrIej2k6GODeR5bvHsWVMPaa97BfXV+BwKM38fXwbspRosM8fXuf/TbGd20SscgiJjhqagtwL8Iqu60s5vo=
X-Gm-Message-State: AOJu0YznhuheGhgkL8JU6KbVOXLScm9PLnETSVYLDWaftwVnwb+i3+58
	41+u4x4GevtzslXeFTtBY6YdZhmVjBsdlwn/Et2ngs++jnUTtVked1rPu+oux6lCF0BsDHMV6Eq
	BAsdTvPoGahAiBJRns3s4hyEV0RZo7YwlPF1/yIs8CrRkVpcJEajjo95acW5FGBS4
X-Received: by 2002:a17:907:807:b0:a46:c09b:f1f3 with SMTP id wv7-20020a170907080700b00a46c09bf1f3mr8390468ejb.41.1710957526674;
        Wed, 20 Mar 2024 10:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Zx5r74eNhXZfhgJG5SH2zSD9Ut4jqyawrs+DA3asxApbNiexXMDrJi/MSunnoKnvm8HnXg==
X-Received: by 2002:a17:907:807:b0:a46:c09b:f1f3 with SMTP id wv7-20020a170907080700b00a46c09bf1f3mr8390453ejb.41.1710957526324;
        Wed, 20 Mar 2024 10:58:46 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id sd9-20020a170906ce2900b00a4628cacad4sm7529443ejb.195.2024.03.20.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 10:58:45 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:58:43 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org
Cc: airlied@redhat.com, lyude@redhat.com, pstanner@redhat.com,
	ajanulgu@redhat.com, mcanal@igalia.com, lina@asahilina.net,
	a.hindborg@samsung.com
Subject: Nova and staging Rust abstractions
Message-ID: <Zfsj0_tb-0-tNrJy@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi all,

In this mail I briefly want to announce the Nova project and subsequently talk about the first
efforts taken in order to upstream required Rust abstractions:

We just started to work on Nova, a Rust-based GSP-only driver for Nvidia GPUs. Nova, in the long
term, is intended to serve as the successor of Nouveau for GSP-firmware-based GPUs.

With Nova we see the chance to significantly decrease the complexity of the driver compared to
Nouveau for mainly two reasons. First, Nouveau's historic architecture, especially around nvif/nvkm,
is rather complicated and inflexible and requires major rework to solve certain problems (such as
locking hierarchy in VMM / MMU code for VM_BIND currently being solved with a workaround) and
second, with a GSP-only driver there is no need to maintain compatibility with pre-GSP code.

Besides that, we also want to take the chance to contribute to the Rust efforts in the kernel and
benefit from from more memory safety offered by the Rust programming language. Ideally, all that
leads to better maintainability and a driver that makes it easy for people to get involved into this
project.

With the choice of Rust the first problem to deal with are missing C binding abstractions for
integral kernel infrastructure (e.g. device / driver abstractions). Since this is a bit of a chicken
and egg problem - we need a user to upstream abstractions, but we also need the abstractions to
create a driver - we want to develop Nova upstream and start with just a driver stub that only makes
use of some basic Rust abstractions.

In particular, we want to start with basic device / driver, DRM and PCI abstractions and a Nova stub
driver making use of them.

Fortunately, a lot of those abstractions did already exist in various downstream trees (big thanks
to all the authors). We started picking up existing work, figured out the dependencies, fixed a few
issues and warnings and applied some structure by organizing it in the following branches.

Remotes: drm-misc [1], rust (Rust-for-Linux) [2], nova [3]

- drm-misc/topic/rust-drm:  [4] contains basic DRM abstractions, e.g. DRM device, GEM; depends on
                                 rust-device
- rust/staging/rust-device: [5] contains all common device / driver abstractions
- rust/staging/rust-pci:    [6] contains basic PCI abstractions, e.g. PCI device, but also other
                                 dependencies such as IoMem and Ressources; depends on rust-device
- rust/staging/dev:         [7] integration branch for all staging Rust abstractions
- nova/stub/nova:           [8] the nova stub driver; depends on rust-drm and rust-pci

All branches and commits are functional, but the code and commit messages are not yet in a state for
sending actual patch series. While we are working on improving those patches we would like to ask
for feedback and / or improvements already.

@Greg, can you please have a first quick look at rust-device [5]?

- Danilo

[1] https://cgit.freedesktop.org/drm/drm-misc
[2] https://github.com/Rust-for-Linux/linux
[3] https://gitlab.freedesktop.org/drm/nova
[4] https://cgit.freedesktop.org/drm/drm-misc/log/?h=topic/rust-drm
[5] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
[6] https://github.com/Rust-for-Linux/linux/tree/staging/rust-pci
[7] https://github.com/Rust-for-Linux/linux/tree/staging/dev
[8] https://gitlab.freedesktop.org/drm/nova/-/tree/stub/nova

