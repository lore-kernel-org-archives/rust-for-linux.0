Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1EF38CFE7
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983945; cv=none; b=hZGhCB2ochRA45tShOjsKbq94fjWmN7ciSJ12AwOhsJ1tMRR4AtxiOu0+5d90EXGHjtB88tuK33+1+G+q0Zw+U+qu6DSC79XwVWKFMTqKUMmxbEwWb+9r5GX2wZXOUci0phHG/A0yA53Eh054lQLleMEhNhCfcGdv23OFeXFoXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983945; c=relaxed/simple;
	bh=2M1MN3IZQY/Y9lDfFQnjRnCU7KKwHHozvM1iRfr5u8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKiWTMGVi1nbTUUohlG3DpBJroxncw6vTL8yyFIzXMrn2K4LFJ3u1UFQF1VMtJWQqvIP5DTuTGPIk0fVEqmzY55dvZDDaXXSMEFMoTcJGWfYUMpfzIkZ/19yHaM5qa2aFxwM7hCXqEImiwcrVnPC76Nj/JT7Ao8VvfWCX/ROOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=MHqBUyFT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FyrsvQuM; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="MHqBUyFT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FyrsvQuM"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 5D2991D00053;
	Tue, 31 Mar 2026 15:05:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 31 Mar 2026 15:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1774983940; x=1775070340; bh=GEgzVjRgf4y5UNqmjtway
	miScPfaO2iMRHXBr1jqQQA=; b=MHqBUyFTSQFg7vbYYw298Jpm7/oOu1uPo3T0A
	0Zi2ThGKg0UZJYhhpvCbdAvCV7sgcWrWFGl9B9YKYhqN3uH1QAj3vgkrQF7j+Zix
	6KIaGFjJSaAvU0v3MQDhulDmSyN9KSdSO98CBwBoeawMoZdHunQgbsUl4bPyxY1t
	c58mSDHdEhN3btO+HzE/yfEc+w3PzH1umwxCtDw2ROhpCqCe7NoYxAgkRpcvGmqZ
	hHGh6cWi++PSUe4OFbu9CVQ4xU7Chml4b4ZPG48l7fspFvKqC8A58z4uHbRDYtYK
	nlV5XM11TD32yBydfrbDfCrgskrs+7pICVXBOj+cOedVSI2Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774983940; x=1775070340; bh=GEgzVjRgf4y5UNqmjtwaymiScPfaO2iMRHX
	Br1jqQQA=; b=FyrsvQuMzjfXITeLzQpwvTwu/gY+BUbGefCHsHZfIWs9pleM9bT
	ZAqy7DSp9ZcrxNP3sRBrkBoUuhuLKs3YNXY0++Ar6xxj1uI0db4p/eLD7mtazbq6
	5rncAo39ff+wgpzeXMANEJSdos87TeHaWN4JOc2/YEcjTHQK5bnKlErMxRJcvLFo
	9ERM1deswyqcSstQcPGqM4TacEHbvXW6ruMI7+Rq8aeA8UAIsZ1uN68oCPa8p0Hy
	g4mLUxCCHVTwXPn40cKTKtKbLgMW21xHLkuWVADbfxBt9aIaG8CcnJnVT9xPzhgy
	GBkI8jaep9blxAlRFiEGClw0uyH0HfiHuJw==
X-ME-Sender: <xms:AxvMafeYke4O_jbbKOLIEePX8FLkKso6sC0DthSmSqYf_ORPb3D0oA>
    <xme:AxvMacPLTvyqWCwC-9inFq4PP9YHkB_SyYQolqmM_MD9E3tqFyJ-Wl4hEq6he6GYP
    oqkpeqqXtKBAxtmYs0jiXOrDUR7qyEKKJXJisyMufT5W_9F7_60AXk>
X-ME-Received: <xmr:AxvMadgBTJgDYlh4hAwwE92JeS0Ss5Sw2Ny2TiUFwTc_wIwKY8iF919Uo8MXTSdGH5jU-oDXeAETKBWV92m3qqeQbmFC8iRIeC4X2GPLhOdEwmVEpcGt3DCpb7IkEaR5r7mpVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgvihhn
    shgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrthhtvg
    hrnhepteeuvdehgeevtdevieegleeigeegtedttdettdduteegteetffefveelhfeugefg
    necuffhomhgrihhnpehlfihnrdhnvghtpdhgihhthhhusgdrtghomhdptghouggvsggvrh
    hgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiuges
    rhgvrggurghhvggrugdrvghu
X-ME-Proxy: <xmx:AxvMaf3mRP4vg2mt0UoThVOND5kgzALTggHEcEwlEfe40Xkocw2vSA>
    <xmx:AxvMaXjdWi-XlxcmVvlYBZ1XfjoPqtF7l0FMMwhcZetxLqdY-OXNKA>
    <xmx:AxvMafdp4FVfBVbMYLsAwQ6zijGjG6sJ27s_u7eCP-EhF8Cx-8ZNQQ>
    <xmx:AxvMaakbYJk11N8q4VQoZPi68B-81hEtLl_p8z9PeFtgjWcllhsKyw>
    <xmx:BBvMaZMsQPFeQeSVyr8WL-72khMtxcj6t9ovVtde9UxMV2HUIvNkv9dr>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:37 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 00/16] bus1: Capability-based IPC for Linux
Date: Tue, 31 Mar 2026 21:02:52 +0200
Message-ID: <20260331190308.141622-1-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

A decade is gone, the ideas stayed the same. After roughly 10 years
we finally got around to write a new version of bus1, a
capability-based IPC system for linux. The core idea is still the same
as 10 years ago and you can find a good summary by Neil Brown on
LWN [1]. In the meantime, we have successfully introduced many of the
concepts of bus1 to Linux distributions (mostly as part of
`dbus-broker` [2]) and are convinced more than ever that we should move
forward with bus1. But for this initial submission I want to put focus
on the Rust integration.

(Patch #7 contains a man-page with a full introduction of all concepts
 of bus1. I will refrain from copying it to this cover-letter.)

The biggest change is that we stripped everything down to the basics and
reimplemented the module in Rust. It is a delight not having to worry
about refcount ownership and object lifetimes, but at the cost of a
C<->Rust bridge that brings some challenges. For now, we settled on
boxing everything that is exposed to C, and calling bindgen manually,
but we would love to improve on several aspects of that in the future.

The bus1 UAPI has been stripped of any convenience helper, fast-path,
or more complex API extension (e.g., promise handles, oneshot handles,
unmanaged IDs, fd-passing, file-system handles,
streaming / flow-control, etc.). This does not mean that we do not want
them back, but they were not necessary and can be replaced with round
trips or other workarounds. Now we are left with the core of bus1, and
we believe it is much easier to understand and follow.

I am only sending this to Rust4Linux now, because I want to get feedback
on the Rust integration first. You are very much welcome to comment on
other parts, but those might be changing heavily depending on the
feedback on the Rust utilities. I will be sending the follow ups to
LKML proper and then shift focus to the UAPI and bus management.

The series can be split into the following parts:

#1 - 4: Small extension to `./rust/kernel/`, which we make use of later
        on. These are small in size and should be easy to discuss
        independently.
#5 - 7: Add basic module scaffolding, UAPI definitions, and a man-page
        explaining the user-space API and intended behavior.
#8 -13: Rust utilities that will be used by the bus1 module, but are not
        necessarily specific to bus1. A lot of this is about intrusive
        data structures.
#14-16: Implement resource accounting and the bus1 core in Rust,
        exposing a C API. Implement a character-device based UAPI in C.

I will gladly split the series in the future, if desired. But given that
r4l generally does not merge unused code, I can carry the utilities just
fine.

If you prefer browsing this online, you can find the series on
codeberg [3] and github [4].
You can also find me on the r4l zulip (@dvdhrm).

Let me know what you think!

Thanks
David

[1] https://lwn.net/Articles/697191/
[2] https://github.com/bus1/dbus-broker
[3] https://codeberg.org/bus1/linux/src/branch/pr/20260331
[4] https://github.com/bus1/linux/tree/pr/20260331

David Rheinsberg (16):
  rust/sync: add LockedBy::access_mut_unchecked()
  rust/sync: add Arc::drop_unless_unique()
  rust/alloc: add Vec::into_boxed_slice()
  rust/error: add EXFULL, EBADRQC, EDQUOT, ENOTRECOVERABLE
  bus1: add module scaffolding
  bus1: add the user-space API
  bus1: add man-page
  bus1/util: add basic utilities
  bus1/util: add field projections
  bus1/util: add IntoDeref/FromDeref
  bus1/util: add intrusive data-type helpers
  bus1/util: add intrusive single linked lists
  bus1/util: add intrusive rb-tree
  bus1/acct: add resouce accounting
  bus1: introduce peers, handles, and nodes
  bus1: implement the uapi

 Documentation/bus1/bus1.7.rst |  319 ++++++
 include/uapi/linux/bus1.h     |   82 ++
 init/Kconfig                  |   12 +
 ipc/Makefile                  |    2 +-
 ipc/bus1/Makefile             |   29 +
 ipc/bus1/acct.rs              | 1792 +++++++++++++++++++++++++++++++++
 ipc/bus1/bus.rs               | 1510 +++++++++++++++++++++++++++
 ipc/bus1/cdev.c               | 1326 ++++++++++++++++++++++++
 ipc/bus1/cdev.h               |   35 +
 ipc/bus1/lib.h                |  202 ++++
 ipc/bus1/lib.rs               |   22 +
 ipc/bus1/main.c               |   41 +
 ipc/bus1/util/convert.rs      |  259 +++++
 ipc/bus1/util/field.rs        |  359 +++++++
 ipc/bus1/util/intrusive.rs    |  397 ++++++++
 ipc/bus1/util/lll.rs          |  378 +++++++
 ipc/bus1/util/mod.rs          |   94 ++
 ipc/bus1/util/rb.rs           | 1324 ++++++++++++++++++++++++
 ipc/bus1/util/slist.rs        |  677 +++++++++++++
 rust/kernel/alloc/kvec.rs     |   67 ++
 rust/kernel/error.rs          |    4 +
 rust/kernel/sync/arc.rs       |   21 +
 rust/kernel/sync/locked_by.rs |   30 +
 rust/kernel/sync/refcount.rs  |   16 +
 24 files changed, 8997 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/bus1/bus1.7.rst
 create mode 100644 include/uapi/linux/bus1.h
 create mode 100644 ipc/bus1/Makefile
 create mode 100644 ipc/bus1/acct.rs
 create mode 100644 ipc/bus1/bus.rs
 create mode 100644 ipc/bus1/cdev.c
 create mode 100644 ipc/bus1/cdev.h
 create mode 100644 ipc/bus1/lib.h
 create mode 100644 ipc/bus1/lib.rs
 create mode 100644 ipc/bus1/main.c
 create mode 100644 ipc/bus1/util/convert.rs
 create mode 100644 ipc/bus1/util/field.rs
 create mode 100644 ipc/bus1/util/intrusive.rs
 create mode 100644 ipc/bus1/util/lll.rs
 create mode 100644 ipc/bus1/util/mod.rs
 create mode 100644 ipc/bus1/util/rb.rs
 create mode 100644 ipc/bus1/util/slist.rs

-- 
2.53.0

