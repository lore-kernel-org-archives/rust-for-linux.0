Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B633A3839
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983954; cv=none; b=QDbJwk8JYzbOswZNam2Yg0ViHCLfBIcUXhEr3RUJqM5kG++E1bfrlrxMABAx5e00kj0hTFLpB8hPpg2Wn3GH2aGldzrouiOrPe3BGOpXSjBGZfsEgMcX+2j7jViyp+HmP3AOkeA6w7pZ9hOoavtey3Q4mfYvzeg5VX0Z0Ws9LVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983954; c=relaxed/simple;
	bh=7KRBWBvvH33+F/Eh0nVW0/Vj1AsXKz5c7mZE20nYVVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHHZ77iqQOhE4/JNZJbjipPuWnqyn8tLrxMjkAt9AP3dUnBb31VYoo5gC85mpWe92F47CtX3KJN2WBlrllAAf34RYzFoykV7vFqp0VHQxUBtdonfnhHKYEIYtg7cwb4O0jWQsCEmht3hPPuOyu14mWgLeQTpzJEeFEml9kaTUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=ovPZgm6w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dzieXQTW; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="ovPZgm6w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dzieXQTW"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 97BCF1D0014C;
	Tue, 31 Mar 2026 15:05:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 15:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983952; x=
	1775070352; bh=uUKwphDu8M/nGGcufUTjShmH/7tnOBKbG+03zqfdX74=; b=o
	vPZgm6wHNkHnHYdkcq+SW92nzXUU2wGRRlrXy8TrFwxJFgCKZVhaDJ7sSRj65Gr0
	DnMQuR2NpfNonqzGg0syJaR3EnT/UXzvjBWVLdDVPWTVVIKN4aET0cVyFUoDAj95
	mP8jd3PzmE0e/rOosWb/sqD6tmCxkrE2wqdIb1Z6ZJrgqTzuhtUxaNBV8FjEti/3
	d6nl7mpnrpJQCDNuchlGUWSwnDeSUqeYR4c8bPObNGwb7/utl/2xPtveYmbZapVY
	7cFHCnQXBL112075W/lOMtMBahzWU7/6vE5U653TP2oniZDDICh2XZ4h6UhzY0kd
	fhVSgysq0Ayzxj9EDooBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983952; x=1775070352; bh=u
	UKwphDu8M/nGGcufUTjShmH/7tnOBKbG+03zqfdX74=; b=dzieXQTW8kEqD4+IN
	5Okp4SQ4tTLPiTlSYFsn8SEmAp2j5Zi5QC5Fz0rmppdrL7vR0wfeTIvS0W8mOxSB
	URkT0m9BKsmvAn4bXWNAFXXAWCB1sW9Ge9MhYzXhF5BkvcQonUVKi8r7INCscXGt
	3DvkTJ1AIQqxzmYY4JdMmtmRDXUQdRnQmCX7EyeHHfZ+l+pqILNTAI+6hLxJosnP
	EzJ8zuiNOC985K6FrFbrGcL6FDjU9N4jLvaYA5fmkL4veQ4CYGONbNliUvc+4p8W
	kt/e8cWP6Da0waWEWZU5qTvWRcQ/D7L/eDFIGGhpIOKWpFABuNF7w66/WOp0ducs
	UNYOw==
X-ME-Sender: <xms:EBvMaTbJBcWc2LjfSUTQA2tbqDrdMxkcqHUpCIhsEkFqI3n2VDtK2g>
    <xme:EBvMaZbwM8ulQpG9pfE1N90tcN5LtyYIM7HCsunSmgzwTnl-ihux9u9P_T8fpFWmk
    TJMbwlXcECq-JBlmLFUFoGpDTsRXjH83-lLNYlWQsm9ptFA7Ydhi5Y>
X-ME-Received: <xmr:EBvMaa9BdnsiyGP3_cEa0AmgXKG6GMr2jv5-mlCzkMSJ03qjtHaqhqfgAan5Ll_hegJrp5PoE2bQrOJjbTylRwFvCV8srMFWieaMjV3rfZDWy1BCjjO3qQ8kn2jZn0xMxrQCOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:EBvMaYg_0fh3lccP_XxewFQi4DLDrjdyoYrIa58si6IbJop0TcP4qg>
    <xmx:EBvMaadyzR5SSxFl13vvXRY3jgUn79I2KHxRelA2QJ5m_KbjwTSp9g>
    <xmx:EBvMafooBoWDUquPtoAXrXASuBmewJ8Td9LIruYRg62AJE57vkV8eg>
    <xmx:EBvMafAh00ZtADET5chPHCnk-Si_9mLXdW9krBBvxUnD3UqK3eX1AA>
    <xmx:EBvMaWKhQ5noxZ6wWa8zUbn87wpoVTjkMRLKBjRBi0nqux1ss-j51jSd>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:50 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 06/16] bus1: add the user-space API
Date: Tue, 31 Mar 2026 21:02:58 +0200
Message-ID: <20260331190308.141622-7-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the user-space API of bus1. Everything is contained in linux/bus1.h
for now, and exposed via a character-device. This allows hotloading of
the module during development.

In the future, a syscall based API, as demanded previously, can be added
as well. The ioctls on the character device are designed with this in
mind, and can be easily translated into syscalls, as is already
documented in the man-page.

The API has no inline documentation. Instead, documentation is provided
in ./Documentation/bus1/bus1.7.rst.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 include/uapi/linux/bus1.h | 77 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/include/uapi/linux/bus1.h b/include/uapi/linux/bus1.h
index 4297e7a00ab9..b4317675475e 100644
--- a/include/uapi/linux/bus1.h
+++ b/include/uapi/linux/bus1.h
@@ -2,4 +2,81 @@
 #ifndef _UAPI_LINUX_BUS1_H
 #define _UAPI_LINUX_BUS1_H
 
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define BUS1_IOCTL_MAGIC			(0x97)
+#define BUS1_INVALID				((__u64)-1)
+#define BUS1_MANAGED				((__u64)0x1)
+
+#define BUS1_FROM_PTR(_v) ((__u64)(void *)(_v))
+#define BUS1_TO_PTR(_v) ((void *)(__u64)(_v))
+
+#define BUS1_TRANSFER_FLAG_CREATE		(((__u64)1) << 0)
+
+struct bus1_transfer {
+	__u64 flags;
+	__u64 id;
+} __attribute__((__aligned__(8)));
+
+struct bus1_metadata {
+	__u64 flags;
+	__u64 id;
+	__u64 account;
+} __attribute__((__aligned__(8)));
+
+enum bus1_message_type: __u64 {
+	BUS1_MESSAGE_TYPE_USER			= 0,
+	BUS1_MESSAGE_TYPE_NODE_RELEASE		= 1,
+	BUS1_MESSAGE_TYPE_HANDLE_RELEASE	= 2,
+	_BUS1_MESSAGE_TYPE_N,
+};
+
+struct bus1_message {
+	__u64 flags;
+	__u64 type;
+	__u64 n_transfers;
+	__u64 ptr_transfers;
+	__u64 n_data;
+	__u64 n_data_vecs;
+	__u64 ptr_data_vecs;
+} __attribute__((__aligned__(8)));
+
+struct bus1_cmd_transfer {
+	__u64 flags;
+	__u64 to;
+	__u64 n_transfers;
+	__u64 ptr_src;
+	__u64 ptr_dst;
+} __attribute__((__aligned__(8)));
+
+struct bus1_cmd_release {
+	__u64 flags;
+	__u64 n_ids;
+	__u64 ptr_ids;
+} __attribute__((__aligned__(8)));
+
+struct bus1_cmd_send {
+	__u64 flags;
+	__u64 n_destinations;
+	__u64 ptr_destinations;
+	__u64 ptr_errors;
+	__u64 ptr_message;
+} __attribute__((__aligned__(8)));
+
+struct bus1_cmd_recv {
+	__u64 flags;
+	__u64 ptr_metadata;
+	__u64 ptr_message;
+} __attribute__((__aligned__(8)));
+
+#define BUS1_CMD_TRANSFER \
+	(_IOWR(BUS1_IOCTL_MAGIC, 0x00, struct bus1_cmd_transfer))
+#define BUS1_CMD_RELEASE \
+	(_IOWR(BUS1_IOCTL_MAGIC, 0x01, struct bus1_cmd_release))
+#define BUS1_CMD_SEND \
+	(_IOWR(BUS1_IOCTL_MAGIC, 0x02, struct bus1_cmd_send))
+#define BUS1_CMD_RECV \
+	(_IOWR(BUS1_IOCTL_MAGIC, 0x03, struct bus1_cmd_recv))
+
 #endif /* _UAPI_LINUX_BUS1_H */
-- 
2.53.0

