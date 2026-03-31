Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDD3A3E96
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983957; cv=none; b=c14vzseSCvhpwsPi9SxX+UNtAtenzSP78XiPU2W5n4zZw0M/Any7790PQfx32lP5tKl8xV7lJJN0jTZAG2ukjSnnDrFiQckSS9nZIXkKBI0QKcLpL08f8sjLX4aHLRh2qdDrKkcf4gZ+PKYovf0Rlu0wvgcv5rJLjmXW91HPZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983957; c=relaxed/simple;
	bh=Y2A2z8B+tdRHXVLvkrxQQG53toq8Z+zllK35sGjw8bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXWrkb+qSuLjf2sFjuXqqGzja/lPVEvsxbU3rvWS/CvHls3/704Ao9zNUhjv7InPyS9QAZNLyBRL+/lLRYWubp/cKCqNyhpypLja5DVCDdnl/JTjSG0/j205NO8LpycS2RF8Xo3xKOuC38O7tws0DA2iqgxYLOPWQ9+UXeSn2x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=YqGNwkRR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c02K+3Sa; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="YqGNwkRR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c02K+3Sa"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB79B7A00AB;
	Tue, 31 Mar 2026 15:05:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 15:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983954; x=
	1775070354; bh=lQ7lEGLZhm6bE0/WezNGWZG00vEiIRRQ5XHcl7Awr10=; b=Y
	qGNwkRR0X8N8GB+HqdEwTIAorI8RlEzAdG4X+c6mQKriH4wiUbZHT/pQwH18kkX+
	VzCl9QjN5qP1RqbcusV/zPCgvJ+wlnBOT5tXwcep6UDVPb0JMrioUxltRdcmiwM9
	1JA8wNuZES+PgiXyu0OaSmxOJe2DM6aN/pNbW8JRd76hM2YalEQh8O3epUDN3w0c
	CxUi+0QWR2Ms6f3+UJkJGzZiu+UqVJ4ZtR6+v4e95/1lkXcUdN5cY56ldIez6JqM
	FSWgXJT0xAwnhY8J72kN4yDxEbEhuZ/UMRD1JwsA1vFO4ozRtrOhIbTMeR6UhM7+
	6RgFu9O//dT28LYtPB9zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983954; x=1775070354; bh=l
	Q7lEGLZhm6bE0/WezNGWZG00vEiIRRQ5XHcl7Awr10=; b=c02K+3SaZLrArN8yf
	mY5/Tau9MbjAcdstPNsbgyr/T1wfGBpCr2FUbfiXcCTdxNMfI5Ayr1t5BlHs9xcE
	6n4nHnk1LeQcZJFgz7qxudf2BXKGXXqmqqNV7tIlYG1q1vwCncZ5DOLQLDL/VxGk
	r82cmPSVfV0b81MuzVKtlVNTdBwpj9szpyiWj/RK3+cPEV+ivc0KheaLySbr2+LV
	W/hPfcpIZsmLqP0fT8mb4eYDo81zXxQ57RvrMm02WuYtyrb7P08D4SvLKyYOpjNX
	efk7/QNj0zF3FKY03lF9p7kN8DthFPSnZBLdXm3ZGvqf/d2i24wCiul0g4fvFgnW
	iTdXQ==
X-ME-Sender: <xms:EhvMaY58bh7siEYsbL93dESkkKgjthIGd8-czOlDrIPS8RN84uR1oQ>
    <xme:EhvMaQ5dCZNn-cV7FLUKX7SCBDmGXYTRu6JwUNxxq_5u7lemuPJpghFCOnAvBpwJU
    s2e__z_SjaIBDvoA5-z2D0ZaVd43qLYvMMVsJ0fQ9_0MSNlj8cc4ro>
X-ME-Received: <xmr:EhvMacdAaV9fZQg8whAbVGcX37RZeOBYbLIsNPvy9wEk8qaidboz_xTQqA-U-J1NhhhBVndupb-E5urDIbfr36RhWASnEbyvebC-Luv9oTU6THFoO8PkZvTaD9cCf8PW5OkL0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:EhvMacBsl1L2CoVlyOBvB2xDbZN4hPg19knateF_bV9kV3pEu2SdoQ>
    <xmx:EhvMaX8Db6RrIlBOzk2SyzSt98P31ksDvgYv1ZXkKAYUauhKe2NkMQ>
    <xmx:EhvMafLkEmppiJiUcR0bvoxDk6PNe-1P3FEtf1BPIq3eoXYW-lHQOA>
    <xmx:EhvMaYj6v5YFyxOXiTyfsCI6CQuBsN6jlelcq7BJNnedpnurl16G1w>
    <xmx:EhvMaTqziz2Ah5ar2DlTBdc8NIEKMjQ--AnIcN6_yhEYUY1240LdRHOu>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:53 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 07/16] bus1: add man-page
Date: Tue, 31 Mar 2026 21:02:59 +0200
Message-ID: <20260331190308.141622-8-david@readahead.eu>
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

Create an overview man-page `bus1(7)` describing the overall design of
bus1 as well as its individual commands.

The man-page can be compiled and read via:

    rst2man Documentation/bus1/bus1.7.rst bus1.7
    man ./bus1.7

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 Documentation/bus1/bus1.7.rst | 319 ++++++++++++++++++++++++++++++++++
 1 file changed, 319 insertions(+)
 create mode 100644 Documentation/bus1/bus1.7.rst

diff --git a/Documentation/bus1/bus1.7.rst b/Documentation/bus1/bus1.7.rst
new file mode 100644
index 000000000000..0e2f26fee3e2
--- /dev/null
+++ b/Documentation/bus1/bus1.7.rst
@@ -0,0 +1,319 @@
+====
+bus1
+====
+
+----------------------------------------------
+Capability-based IPC for Linux
+----------------------------------------------
+
+:Manual section: 7
+:Manual group: Miscellaneous
+
+SYNOPSIS
+========
+
+| ``#include <linux/bus1.h>``
+
+DESCRIPTION
+-----------
+
+The bus1 API provides capability-based inter-process communication. Its core
+primitive is a multi-producer/single-consumer unidirectional channel that can
+transmit arbitrary user messages. The receiving end of the channel is called
+a **node**, while the sending end is called a **handle**.
+
+A handle always refers to exactly one node, but there can be many handles
+referring to the same node, and those handles can be held by independent
+owners. Messages are sent via a handle, meaning it is transmitted to the node
+the handle is linked to. A handle to a node is required to transmit a message
+to that node.
+
+A sender can attach copies of any handle they hold to a message, and thus
+transfer them alongside the message. The copied handles refer to the same node
+as their respective original handle.
+
+All nodes and handles have an owning **peer**. A peer is a purely local
+concept. The owning peer of a node or handle never affects the externally
+visible behavior of them. However, all nodes and handles of a single peer share
+a message queue.
+
+When the last handle to a node is released, the owning peer of the node
+receives a notification. Similarly, if a node is released, the owning peers of
+all handles referring to that node receive a notification. All notifications
+are ordered causally with any other ongoing communication.
+
+Communication on the bus happens via transactions. A transaction is an atomic
+transmission of messages, which can include release notifications. All message
+types can be part of a transaction, and thus can happen atomically with any
+other kind of message. A transaction with only a single message or notification
+is called a unicast. Any other transaction is called a multicast.
+
+Transactions are causally ordered. That is, if any transaction is a reaction to
+any previous transaction, all messages of the reaction transaction will be
+received by any peer after the messages that were part of the original
+transaction. This is even guaranteed if the causal relationship exists only via
+a side-channel outside the scope of bus1. However, messages without causal
+relationship have no stable order. This is especially noticeable with
+multicasts, where receivers might see independent multicasts in a different
+order.
+
+Operations
+----------
+
+The user-space API of bus1 is not decided on. This section describes the
+available operations as system calls, as they likely would be exposed by any
+user-space library. However, for development reasons the actual user-space API
+is currently performed via ioctls on a character device.
+
+Peer Creation
+^^^^^^^^^^^^^
+
+| ``int bus1_peer_new();``
+
+Peers are independent entities that can be created at will. They are accessed
+via file-descriptors, with each peer having its own file-description. Multiple
+file-descriptors can refer to the same peer, yet currently all operations will
+lock a peer and thus serialize all operations on that peer.
+
+Once the last file-descriptor referring to a peer is closed, the peer is
+released. Any resources of that peer are released, and any ongoing transactions
+targetting the peer will discard their messages.
+
+File descriptions pin the credentials of the calling process. A peer will use
+those pinned credentials for resource accounting. Otherwise, no ambient
+resources are used by bus1.
+
+Transfer Command
+^^^^^^^^^^^^^^^^
+
+| ``#define BUS1_TRANSFER_FLAG_CREATE 0x1``
+|
+| ``struct bus1_transfer {``
+|         ``uint64_t flags;``
+|         ``uint64_t id;``
+| ``};``
+|
+| ``int bus1_cmd_transfer(``
+|         ``uint64_t flags,``
+|         ``int from,``
+|         ``int to,``
+|         ``size_t n,``
+|         ``struct bus1_transfer *src,``
+|         ``struct bus1_transfer *dst``
+| ``);``
+
+A transfer command can be used for two different operations. First, it can be
+used to create nodes and handles on a peer. Second, it can be used to transfer
+a handle from one peer to another, while holding file-descriptors to both
+peers.
+
+The command takes ``flags``, which currently is unused and must be 0. ``from``
+and ``to`` are file-descriptors referring to the involved peers. ``from`` must
+be provided, while ``to`` can be ``-1``, in which case it will refer to the
+same peer as ``from``.
+
+``n`` defines the number of transfer operations that are performed atomically.
+``src`` and ``dst`` must refer to arrays with ``n`` elements. ``dst`` can be
+uninitialized, and will be filled in by the kernel. ``src`` must be initialized
+by the caller. ``src[i].flags`` must be 0 or ``BUS1_TRANSFER_FLAG_CREATE``.
+``src[i].id`` must refer to an ID of a handle in ``from``. If
+``BUS1_TRANSFER_FLAG_CREATE`` is set, ``src[i].id`` must be set to
+``BUS1_INVALID``. In this case a new node is create and the ID of the node
+is returned in ``src[i].id`` with ``src[i].flags`` cleared to 0.
+
+In any case, a new handle in ``to`` is created for every provided transfer. Its
+ID is returned in ``dst[i].id`` and ``dst[i].flags`` is set to 0.
+
+Note that both arrays ``src`` and ``dst`` can be partially modified by the
+kernel even if the operation fails (even if it fails with a different error
+than ``EFAULT``).
+
+Release Command
+^^^^^^^^^^^^^^^
+
+| ``int bus1_cmd_release(``
+|         ``int peerfd,``
+|         ``size_t n_ids,``
+|         ``uint64_t *ids``
+| ``);``
+
+A release command takes a peer file-descriptor as ``peerfd`` and an array of
+node and handle IDs as ``ids`` with ``n_ids`` number of elements. All these
+nodes and handles will be released in a single atomic transaction.
+
+The command does not fail, except if invalid arguments are provided.
+
+No subsequent operation on this peer will refer to the IDs once this call
+returns. Furthermore, those IDs will never be reused.
+
+Send Command
+^^^^^^^^^^^^
+
+| ``enum bus1_message_type: uint64_t {``
+|         ``BUS1_MESSAGE_TYPE_USER = 0,``
+|         ``BUS1_MESSAGE_TYPE_NODE_RELEASE = 1,``
+|         ``BUS1_MESSAGE_TYPE_HANDLE_RELEASE = 2,``
+|         ``_BUS1_MESSAGE_TYPE_N,``
+| ``}``
+|
+| ``struct bus1_message {``
+|         ``uint64_t flags;``
+|         ``uint64_t type;``
+|         ``uint64_t n_transfers;   // size_t n_transfers``
+|         ``uint64_t ptr_transfers; // struct bus1_transfer *transfers;``
+|         ``uint64_t n_data;        // size_t n_data;``
+|         ``uint64_t n_data_vecs;   // size_t n_data_vecs;``
+|         ``uint64_t ptr_data_vecs; // struct iovec *data_vecs;``
+| ``};``
+|
+| ``int bus1_cmd_send(``
+|         ``int peerfd,``
+|         ``size_t n_destinations,``
+|         ``uint64_t *destinations,``
+|         ``int32_t *errors,``
+|         ``struct bus1_message *message``
+| ``);``
+
+The send command takes a peer file-descriptor as ``peerfd``, the message to
+send as ``message``, and an array of destination handles as ``destinations``
+(with ``n_destinations`` number of elements).
+
+Additionally, ``errors`` is used to return the individual error code for each
+destination. This is only done if the send command returns success. Since
+currently partial failure is not exposed, ``errors[i]`` is currently always
+set to 0 on success.
+
+All destination IDs must refer to a valid handle of the calling peer.
+``EBADRQC`` is returned if an ID did not refer to an handle. Currently, only
+a single message can be provided with a single send command, and this message
+is transmitted to all destinations in a single atomic transaction.
+
+The message to be transmitted is provided as ``message``. This structure
+describes the payload of the message. ``message.flags`` must be 0.
+``message.type`` must be ``BUS1_MESSAGE_TYPE_USER``. ``message.n_transfers``
+and ``message.ptr_transfers`` refer to an array of ``struct bus1_transfer``
+and describe handles to be transferred with the message. The transfers are
+used the same as in ``bus1_cmd_transfer(2)``, but ``BUS1_TRANSFER_FLAG_CREATE``
+is currently not refused.
+
+``message.n_data_vecs`` and ``message.ptr_data_vecs`` provide the iovecs with
+the data to be transmitted with the message. Only the first ``message.n_data``
+bytes of the iovecs are considered part of the message. Any trailing bytes
+are ignored. The data is copied into kernel buffers and the iovecs are no
+longer accessed once the command returns.
+
+Recv Command
+^^^^^^^^^^^^
+
+| ``struct bus1_metadata {``
+|         ``uint64_t flags;``
+|         ``uint64_t id;``
+|         ``uint64_t account;``
+| ``};``
+|
+| ``int bus1_cmd_recv(``
+|         ``int peerfd,``
+|         ``struct bus1_metadata *metadata,``
+|         ``struct bus1_message *message``
+| ``);``
+
+The recv command takes a peer file-descriptor as ``peerfd`` and fetches the
+next message from its queue. If no message is queued ``EAGAIN`` is returned.
+
+The message is returned in ``message``. The caller must set ``message.flags``
+to 0 and ``message.type`` to ``BUS1_INVALID``. ``message.n_transfers`` and
+``message.ptr_transfers`` refer to an array of ``struct bus1_transfer``
+structures used to return the transferred handles of the next message. Upon
+return, ``message.n_transfers`` is updated to the actually transferred number
+of handles, while ``message.transfers[i]`` is updated as described in
+``bus1_cmd_transfer(2)``.
+
+``message.n_data``, ``message.n_data_vecs``, and ``message.ptr_data_vecs``
+must be initialized by the caller and provide the space to store the data of
+the next message. The iovecs are never modified by the operation.
+
+If the message would exceed ``message.n_transfers`` or ``message.n_data``,
+``EMSGSIZE`` is returned and the fields are updated accordingly.
+
+Upon success, ``message`` is updated with data of the received message, with
+transferred handles and data written to the transfer array and iovecs.
+
+``metadata`` is updated to contain more data about the message.
+``metadata.flags`` is unused and set to 0. ``metadata.id`` contains the ID
+of the node the message was received on (or the ID of the handle in case of
+``BUS1_MESSAGE_TYPE_NODE_RELEASE``). ``metadata.account`` contains the ID
+of the resource context of the sender.
+
+Errors
+------
+
+All operations follow a strict error reporting model. If an operation has a
+documented error case, then this will be indicated to user-space with a
+negative return value (or ``errno`` respectively). Whenever an error appears,
+the operation will have been cancelled entirely and have no observable affect
+on the bus. User space can safely assume the system to be in the same state as
+if the operation was not invoked, unless explicitly documented.
+
+One major exception is ``EFAULT``. The ``EFAULT`` error code is returned
+whenever user-space supplied malformed pointers to the kernel, and the kernel
+was unable to fetch information from, or return information to, user-space.
+This indicates a misbehaving client, and usually there is no way to recover
+from this, unless user-space intentionally triggered this behavior. User-space
+should treat ``EFAULT`` as an assertion failure and not try to recover. If the
+bus1 API is used in a correct manner, ``EFAULT`` will never be returned by any
+operation.
+
+Resource Accounting
+-------------------
+
+Every peer has an associated resource context used to account claimed
+resources. This resource context is determined at the time the peer is created
+and it will never change over its lifetime. The default, and at this time only,
+accounting model is based on UNIX ``UIDs``. That is, each peer gets assigned
+the resource-context of the ``Effective UID`` of the process that creates it.
+From then on any resource consumption of the peer is accounted on this
+resource-context, and thus shared with all other peers of the same ``UID``.
+
+All allocations have upper limits which cannot be exceeded. An operation will
+return ``EDQUOT`` if the quota limits prevent an operation from being
+performed. User-space is expected to treat this as an administration or
+configuration error, since there is generally no meaningful way to recover.
+Applications should expect to be spawned with suitable resource limits
+pre-configured. However, this is not enforced and user-space is free to react
+to ``EDQUOT`` as it wishes.
+
+Unlike all other bus properties, resource accounting is not part of the bus
+atomicity and ordering guarantees, nor does it implement strict rollback. This
+means, if an operation allocates multiple resources, the resource counters are
+updated before the operation will happen on the bus. Hence, the resource
+counter modifications are visible to the system before the operation itself is.
+Furthermore, while any failing operation will correctly revert any temporary
+resource allocations, the allocations will have been visible to the system
+for the time of this (failed) operation. Therefore, even a failed operation
+can have (temporary) visible side-effects. But similar to the atomicity
+guarantees, these do not affect any other bus properties, but only the resource
+accounting.
+
+However, note that monitoring of bus accounting is not considered a
+programmatic interface, nor are any explicit accounting APIs exposed. Thus, the
+only visible effect of resource accounting is getting ``EDQUOT`` if a counter
+is exceeded.
+
+Additionally to standard resource accounting, a peer can also allocate remote
+resources. This happens whenever a transaction transmits resources from
+a sender to a receiver. All such transactions are always accounted on the
+receiver at the time of *send*. To prevent senders from exhausting resources
+of a receiver, a peer only ever gets access to a subset of the resources of any
+other resource-context that does not match its own.
+
+The exact quotas are
+calculated at runtime and dynamically adapt to the number of different users
+that currently partake. The ideal is a fair linear distribution of the
+available resources, and the algorithm guarantees a quasi-linear distribution.
+Yet, the details are implementation specific and can change over time.
+
+Additionally, a second layer resource accounting separates peers of the same
+resource context. This is done to prevent malfunctioning peers from exceeding
+all resources of their resource context, and thus affecting other peers with
+the same resource context. This uses a much less strict quota system, since
+it does not span security domains.
-- 
2.53.0

