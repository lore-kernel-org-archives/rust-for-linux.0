Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1103D75D9
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740485; cv=none; b=NXSa6V9Vn/+6fZkPfNG57bVaQy/ZEhiUsizbES25+i55vNUX6E6kk/fHm6zSQ8PoZ+MuS+t1Fl5HYlS9VWQyVbJGH29YpFTdMY+BBslLtCbofIvszvnXNr6X8bOxy4bJWStrRX17T+XMKSqaujEoUJXkZNsh+vyAjl1n9omcP14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740485; c=relaxed/simple;
	bh=eNS+sYCVgTwpEagJ67ur0WSZJ8KNZAQMMB8mJ7XBF5Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=b1SXCT19V9LOsLwSZX9kTdOayQuUbFKmGCuHBBaDQdBPvW+Qty3Eog1juxee23Bc5yJ1jaKPuB1rNXMPZCAjrg9sylxMa+He59qLpaQCN9VjoT0H1UXIIrvjjCvOtgNmmonqkyHHmbblP1YG+nwxZxdKFJn3Cfd5/ZcfDZYw36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=gky5150A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s44Ij/XD; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="gky5150A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s44Ij/XD"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 73CC314002B8;
	Thu,  9 Apr 2026 09:14:38 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Thu, 09 Apr 2026 09:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775740478;
	 x=1775826878; bh=VS9/KCdU4MTCkv2xdnX49Mz/dCdNDNAzDrFdQFz/d0Q=; b=
	gky5150AHj78S4uxvntBzGLmDXPkwCYeaM7l6ASw8+gWCrET7KOjP46EqVSg9sPX
	yce/B/mki6sQXKh1/yuh0saohh5Svat3IZyye3F60gOUyqbIgRSDLoPv+knRK+FP
	ika5fJ9RBv63NSJSR2hMhf4sTdRkPtI2gRDf+t80Xr2NI7OUoDk97Sx17qzsmynW
	JU2x7hwHMA3t2YO4y5RCQ/d2Fxh865ru1m1qU1mtLEw1UcmVyqhpgL65DxhcMoQx
	dzkFgfQnsMSokLkKzrsVh8Eii5ko/UfJ3+ixBGq1bRhIQNgkK9kKwKc2g80PtvQw
	1cOhwFzHS+rlOpUY7W8fkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775740478; x=
	1775826878; bh=VS9/KCdU4MTCkv2xdnX49Mz/dCdNDNAzDrFdQFz/d0Q=; b=s
	44Ij/XDzaz42Y/uL4JetsMhide0muhNbrBZv5bzHFoZumng74er1o0GZ3L4zrCla
	UmGYqlVNf7YAdPIiVgyR1PWbfFJM2qdIXrcQtQQqQIFaOlFU0It6ZedIKbWlWs60
	KAjoqAp7mxad2MwJtJyjK/nQa8KrsX9wAcm97NPrvh/IxEft/cU4Y5wHOkTp0cGr
	AzJxy9qpRqBYXvbGm4Zu/T5UKesotgSgMlFwf11D099Ei9/XC457/WS5zx+JeooS
	j0lcf/i7LpTuIghAn+FUkdsaem0Wk7T7rfRaSFRpE8M9pumBWg7otKHdGHVhQXpj
	9NqnVKKBhg5TbD9KtB2dQ==
X-ME-Sender: <xms:PabXaSU70UTWr_gDUWXUrW9nQ6KmsCPG4lFsD-W82UvS-Gl5k7S1EA>
    <xme:PabXaZZA5L9KHRHzAYscr34dAzMs8NaClbcUdYM6pnI75xRGSKsf-E_x1uHUAvhz5
    WkVN95Ed77hcQmcv-myvd9FeAjXJSyni85gJnCggdt7BIsTgj7Yn1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvieehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdffrghvihgu
    ucfthhgvihhnshgsvghrghdfuceouggrvhhiugesrhgvrggurghhvggrugdrvghuqeenuc
    ggtffrrghtthgvrhhnpeethfetfefhfeetffffffetveeujeelieehteegheffieelveef
    hfekgeekfeegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghvihgusehrvggruggrhhgvrggurdgvuhdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthgvghesjhhklhhmrdhnohdprhgtph
    htthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshes
    mhefhiefrhdruggvpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PabXaf_mFuz9egNy3BE7VivUbBWVfHou_Z5Vz4IkrgqZNAQHWHYprQ>
    <xmx:PabXaZiCfQcjjFc3afev7z-eI19FDpu3V-a1udAF5ccGw5hMz22bbQ>
    <xmx:PabXaXdgJtVA8INSftckuc_QkE1-KjTljE7o-M_cL_KteIT1lKffDA>
    <xmx:PabXaYpKTKpdjVRc_GMsowKgHayzJzfcw73pLk5t9NBfSo4Ab10GNA>
    <xmx:PqbXafbgrzjMH8L6VYQNLZhxfuL2XaA8Lbd6dYHqXQAQGkE8i_keDW2a>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB48115C008C; Thu,  9 Apr 2026 09:14:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhuZrXbOafIs
Date: Thu, 09 Apr 2026 15:14:17 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Thomas Meyer" <thomas@m3y3r.de>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no,
 "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <3b2ad760-3481-4ff1-986a-51ee33a93ea5@app.fastmail.com>
In-Reply-To: <adEurRZBWe9poAI4@jupiter>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-8-david@readahead.eu> <adEurRZBWe9poAI4@jupiter>
Subject: Re: [RFC 07/16] bus1: add man-page
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Sat, Apr 4, 2026, at 5:30 PM, Thomas Meyer wrote:
> Am Tue, Mar 31, 2026 at 09:02:59PM +0200 schrieb David Rheinsberg:
>> Create an overview man-page `bus1(7)` describing the overall design of
>> bus1 as well as its individual commands.
>> 
>> The man-page can be compiled and read via:
>> 
>>     rst2man Documentation/bus1/bus1.7.rst bus1.7
>>     man ./bus1.7
>> 
>> Signed-off-by: David Rheinsberg <david@readahead.eu>
>> ---
>>  Documentation/bus1/bus1.7.rst | 319 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 319 insertions(+)
>>  create mode 100644 Documentation/bus1/bus1.7.rst
>> 
>> diff --git a/Documentation/bus1/bus1.7.rst b/Documentation/bus1/bus1.7.rst
>> new file mode 100644
>> index 000000000000..0e2f26fee3e2
>> --- /dev/null
>> +++ b/Documentation/bus1/bus1.7.rst
> Hi,
>
> here some suggested typo/grammer, consistency fixes ("file-descriptors" 
> to "file descriptors"),
> and some minor content tweaks:
>
> diff --git a/Documentation/bus1/bus1.7.rst 
> b/Documentation/bus1/bus1.7.rst
> index 0e2f26f..4a8726f 100644
> --- a/Documentation/bus1/bus1.7.rst
> +++ b/Documentation/bus1/bus1.7.rst
> @@ -38,8 +38,9 @@ visible behavior of them. However, all nodes and 
> handles of a single peer share
>  a message queue.
> 
>  When the last handle to a node is released, the owning peer of the node
> -receives a notification. Similarly, if a node is released, the owning 
> peers of
> -all handles referring to that node receive a notification. All 
> notifications
> +receives a ``BUS1_MESSAGE_TYPE_NODE_RELEASE`` notification. Similarly,
> if a node
> +is released, the owning peers of all handles referring to that node 
> receive a
> +``BUS1_MESSAGE_TYPE_HANDLE_RELEASE`` notification. All notifications
>  are ordered causally with any other ongoing communication.

Currently, it is the other way around. You get `NODE_RELEASE` when a node is released (i.e., you receive this on your handle). You get `HANDLE_RELEASE` when the last handle is released (i.e., you get this on your node).

>  Communication on the bus happens via transactions. A transaction is an atomic
> @@ -71,8 +72,8 @@ Peer Creation
>  | ``int bus1_peer_new();``
> 
>  Peers are independent entities that can be created at will. They are accessed
> -via file-descriptors, with each peer having its own file-description. Multiple
> -file-descriptors can refer to the same peer, yet currently all operations will
> +via file descriptors, with each peer having its own file description. Multiple
> +file descriptors can refer to the same peer, yet currently all operations will
>  lock a peer and thus serialize all operations on that peer.
> 
>  Once the last file-descriptor referring to a peer is closed, the peer 
> is
> @@ -108,7 +109,7 @@ a handle from one peer to another, while holding 
> file-descriptors to both
>  peers.
> 
>  The command takes ``flags``, which currently is unused and must be 0. ``from``
> -and ``to`` are file-descriptors referring to the involved peers. ``from`` must
> +and ``to`` are file descriptors referring to the involved peers. ``from`` must
>  be provided, while ``to`` can be ``-1``, in which case it will refer to the
>  same peer as ``from``.
> 
> @@ -118,7 +119,7 @@ uninitialized, and will be filled in by the kernel. 
> ``src`` must be initialized
>  by the caller. ``src[i].flags`` must be 0 or 
> ``BUS1_TRANSFER_FLAG_CREATE``.
>  ``src[i].id`` must refer to an ID of a handle in ``from``. If
>  ``BUS1_TRANSFER_FLAG_CREATE`` is set, ``src[i].id`` must be set to
> -``BUS1_INVALID``. In this case a new node is create and the ID of the 
> node
> +``BUS1_INVALID``. In this case a new node is created and the ID of the 
> node
>  is returned in ``src[i].id`` with ``src[i].flags`` cleared to 0.
> 
>  In any case, a new handle in ``to`` is created for every provided transfer. Its
> @@ -137,7 +138,7 @@ Release Command
>  |         ``uint64_t *ids``
>  | ``);``
> 
> -A release command takes a peer file-descriptor as ``peerfd`` and an array of
> +A release command takes a peer file descriptor as ``peerfd`` and an array of
>  node and handle IDs as ``ids`` with ``n_ids`` number of elements. All these
>  nodes and handles will be released in a single atomic transaction.
> 
> @@ -174,7 +175,7 @@ Send Command
>  |         ``struct bus1_message *message``
>  | ``);``
> 
> -The send command takes a peer file-descriptor as ``peerfd``, the message to
> +The send command takes a peer file descriptor as ``peerfd``, the message to
>  send as ``message``, and an array of destination handles as ``destinations``
>  (with ``n_destinations`` number of elements).
> 
> @@ -184,7 +185,7 @@ currently partial failure is not exposed, 
> ``errors[i]`` is currently always
>  set to 0 on success.
> 
>  All destination IDs must refer to a valid handle of the calling peer.
> -``EBADRQC`` is returned if an ID did not refer to an handle. Currently, only
> +``EBADRQC`` is returned if an ID did not refer to a handle. Currently, only
>  a single message can be provided with a single send command, and this message
>  is transmitted to all destinations in a single atomic transaction.
> 
> @@ -217,14 +218,14 @@ Recv Command
>  |         ``struct bus1_message *message``
>  | ``);``
> 
> -The recv command takes a peer file-descriptor as ``peerfd`` and fetches the
> +The recv command takes a peer file descriptor as ``peerfd`` and fetches the
>  next message from its queue. If no message is queued ``EAGAIN`` is returned.
> 
>  The message is returned in ``message``. The caller must set ``message.flags``
>  to 0 and ``message.type`` to ``BUS1_INVALID``. ``message.n_transfers`` and
>  ``message.ptr_transfers`` refer to an array of ``struct bus1_transfer``
>  structures used to return the transferred handles of the next message. Upon
> -return, ``message.n_transfers`` is updated to the actually transferred number
> +return, ``message.n_transfers`` is updated to the actual transferred number
>  of handles, while ``message.transfers[i]`` is updated as described in
>  ``bus1_cmd_transfer(2)``.
> 
> @@ -240,8 +241,7 @@ transferred handles and data written to the 
> transfer array and iovecs.
> 
>  ``metadata`` is updated to contain more data about the message.
>  ``metadata.flags`` is unused and set to 0. ``metadata.id`` contains 
> the ID
> -of the node the message was received on (or the ID of the handle in 
> case of
> -``BUS1_MESSAGE_TYPE_NODE_RELEASE``). ``metadata.account`` contains the 
> ID
> +of the node the message was received on, or the ID of the released 
> handle in the case of ``BUS1_MESSAGE_TYPE_HANDLE_RELEASE``. 
> ``metadata.account`` contains the ID
>  of the resource context of the sender.
> 
>  Errors
> @@ -250,7 +250,7 @@ Errors
>  All operations follow a strict error reporting model. If an operation has a
>  documented error case, then this will be indicated to user-space with a
>  negative return value (or ``errno`` respectively). Whenever an error appears,
> -the operation will have been cancelled entirely and have no observable affect
> +the operation will have been cancelled entirely and have no observable effect
>  on the bus. User space can safely assume the system to be in the same state as
>  if the operation was not invoked, unless explicitly documented.
> 
> @@ -294,12 +294,16 @@ can have (temporary) visible side-effects. But 
> similar to the atomicity
>  guarantees, these do not affect any other bus properties, but only the 
> resource
>  accounting.
> 
> +While resource accounting side-effects are temporary and do not violate bus
> +atomicity, they may be observable via system monitoring tools during the
> +operation.
> +

It is not so much about system-monitoring tools. Those might even observe more side-effects, given that they can violate some system expectations. It is more about bus1 itself:

We want to guarantee that if you can observe any effect of a bus1 operation, you are guaranteed the causing operation succeeded and you observe all its effects atomically. So you never see partial effects, and you never see effects that are later on reverted.

Now this is the ideal, and we want to make some exceptions. In particular, effects of the resource accounting are not atomic, and they might be reverted if the operation itself fails.

I am not sure your paragraph really captures that correctly, but I might be misreading it.

>  However, note that monitoring of bus accounting is not considered a
>  programmatic interface, nor are any explicit accounting APIs exposed. Thus, the
>  only visible effect of resource accounting is getting ``EDQUOT`` if a counter
>  is exceeded.
> 
> -Additionally to standard resource accounting, a peer can also allocate remote
> +In addition to standard resource accounting, a peer can also allocate remote
>  resources. This happens whenever a transaction transmits resources from
>  a sender to a receiver. All such transactions are always accounted on the
>  receiver at the time of *send*. To prevent senders from exhausting resources
>
> mfg
> thomas

Thanks a lot for the suggestions! Applied!
David

>> @@ -0,0 +1,319 @@
>> +====
>> +bus1
>> +====
>> +
>> +----------------------------------------------
>> +Capability-based IPC for Linux
>> +----------------------------------------------
>> +
>> +:Manual section: 7
>> +:Manual group: Miscellaneous
>> +
>> +SYNOPSIS
>> +========
>> +
>> +| ``#include <linux/bus1.h>``
>> +
>> +DESCRIPTION
>> +-----------
>> +
>> +The bus1 API provides capability-based inter-process communication. Its core
>> +primitive is a multi-producer/single-consumer unidirectional channel that can
>> +transmit arbitrary user messages. The receiving end of the channel is called
>> +a **node**, while the sending end is called a **handle**.
>> +
>> +A handle always refers to exactly one node, but there can be many handles
>> +referring to the same node, and those handles can be held by independent
>> +owners. Messages are sent via a handle, meaning it is transmitted to the node
>> +the handle is linked to. A handle to a node is required to transmit a message
>> +to that node.
>> +
>> +A sender can attach copies of any handle they hold to a message, and thus
>> +transfer them alongside the message. The copied handles refer to the same node
>> +as their respective original handle.
>> +
>> +All nodes and handles have an owning **peer**. A peer is a purely local
>> +concept. The owning peer of a node or handle never affects the externally
>> +visible behavior of them. However, all nodes and handles of a single peer share
>> +a message queue.
>> +
>> +When the last handle to a node is released, the owning peer of the node
>> +receives a notification. Similarly, if a node is released, the owning peers of
>> +all handles referring to that node receive a notification. All notifications
>> +are ordered causally with any other ongoing communication.
>> +
>> +Communication on the bus happens via transactions. A transaction is an atomic
>> +transmission of messages, which can include release notifications. All message
>> +types can be part of a transaction, and thus can happen atomically with any
>> +other kind of message. A transaction with only a single message or notification
>> +is called a unicast. Any other transaction is called a multicast.
>> +
>> +Transactions are causally ordered. That is, if any transaction is a reaction to
>> +any previous transaction, all messages of the reaction transaction will be
>> +received by any peer after the messages that were part of the original
>> +transaction. This is even guaranteed if the causal relationship exists only via
>> +a side-channel outside the scope of bus1. However, messages without causal
>> +relationship have no stable order. This is especially noticeable with
>> +multicasts, where receivers might see independent multicasts in a different
>> +order.
>> +
>> +Operations
>> +----------
>> +
>> +The user-space API of bus1 is not decided on. This section describes the
>> +available operations as system calls, as they likely would be exposed by any
>> +user-space library. However, for development reasons the actual user-space API
>> +is currently performed via ioctls on a character device.
>> +
>> +Peer Creation
>> +^^^^^^^^^^^^^
>> +
>> +| ``int bus1_peer_new();``
>> +
>> +Peers are independent entities that can be created at will. They are accessed
>> +via file-descriptors, with each peer having its own file-description. Multiple
>> +file-descriptors can refer to the same peer, yet currently all operations will
>> +lock a peer and thus serialize all operations on that peer.
>> +
>> +Once the last file-descriptor referring to a peer is closed, the peer is
>> +released. Any resources of that peer are released, and any ongoing transactions
>> +targetting the peer will discard their messages.
>> +
>> +File descriptions pin the credentials of the calling process. A peer will use
>> +those pinned credentials for resource accounting. Otherwise, no ambient
>> +resources are used by bus1.
>> +
>> +Transfer Command
>> +^^^^^^^^^^^^^^^^
>> +
>> +| ``#define BUS1_TRANSFER_FLAG_CREATE 0x1``
>> +|
>> +| ``struct bus1_transfer {``
>> +|         ``uint64_t flags;``
>> +|         ``uint64_t id;``
>> +| ``};``
>> +|
>> +| ``int bus1_cmd_transfer(``
>> +|         ``uint64_t flags,``
>> +|         ``int from,``
>> +|         ``int to,``
>> +|         ``size_t n,``
>> +|         ``struct bus1_transfer *src,``
>> +|         ``struct bus1_transfer *dst``
>> +| ``);``
>> +
>> +A transfer command can be used for two different operations. First, it can be
>> +used to create nodes and handles on a peer. Second, it can be used to transfer
>> +a handle from one peer to another, while holding file-descriptors to both
>> +peers.
>> +
>> +The command takes ``flags``, which currently is unused and must be 0. ``from``
>> +and ``to`` are file-descriptors referring to the involved peers. ``from`` must
>> +be provided, while ``to`` can be ``-1``, in which case it will refer to the
>> +same peer as ``from``.
>> +
>> +``n`` defines the number of transfer operations that are performed atomically.
>> +``src`` and ``dst`` must refer to arrays with ``n`` elements. ``dst`` can be
>> +uninitialized, and will be filled in by the kernel. ``src`` must be initialized
>> +by the caller. ``src[i].flags`` must be 0 or ``BUS1_TRANSFER_FLAG_CREATE``.
>> +``src[i].id`` must refer to an ID of a handle in ``from``. If
>> +``BUS1_TRANSFER_FLAG_CREATE`` is set, ``src[i].id`` must be set to
>> +``BUS1_INVALID``. In this case a new node is create and the ID of the node
>> +is returned in ``src[i].id`` with ``src[i].flags`` cleared to 0.
>> +
>> +In any case, a new handle in ``to`` is created for every provided transfer. Its
>> +ID is returned in ``dst[i].id`` and ``dst[i].flags`` is set to 0.
>> +
>> +Note that both arrays ``src`` and ``dst`` can be partially modified by the
>> +kernel even if the operation fails (even if it fails with a different error
>> +than ``EFAULT``).
>> +
>> +Release Command
>> +^^^^^^^^^^^^^^^
>> +
>> +| ``int bus1_cmd_release(``
>> +|         ``int peerfd,``
>> +|         ``size_t n_ids,``
>> +|         ``uint64_t *ids``
>> +| ``);``
>> +
>> +A release command takes a peer file-descriptor as ``peerfd`` and an array of
>> +node and handle IDs as ``ids`` with ``n_ids`` number of elements. All these
>> +nodes and handles will be released in a single atomic transaction.
>> +
>> +The command does not fail, except if invalid arguments are provided.
>> +
>> +No subsequent operation on this peer will refer to the IDs once this call
>> +returns. Furthermore, those IDs will never be reused.
>> +
>> +Send Command
>> +^^^^^^^^^^^^
>> +
>> +| ``enum bus1_message_type: uint64_t {``
>> +|         ``BUS1_MESSAGE_TYPE_USER = 0,``
>> +|         ``BUS1_MESSAGE_TYPE_NODE_RELEASE = 1,``
>> +|         ``BUS1_MESSAGE_TYPE_HANDLE_RELEASE = 2,``
>> +|         ``_BUS1_MESSAGE_TYPE_N,``
>> +| ``}``
>> +|
>> +| ``struct bus1_message {``
>> +|         ``uint64_t flags;``
>> +|         ``uint64_t type;``
>> +|         ``uint64_t n_transfers;   // size_t n_transfers``
>> +|         ``uint64_t ptr_transfers; // struct bus1_transfer *transfers;``
>> +|         ``uint64_t n_data;        // size_t n_data;``
>> +|         ``uint64_t n_data_vecs;   // size_t n_data_vecs;``
>> +|         ``uint64_t ptr_data_vecs; // struct iovec *data_vecs;``
>> +| ``};``
>> +|
>> +| ``int bus1_cmd_send(``
>> +|         ``int peerfd,``
>> +|         ``size_t n_destinations,``
>> +|         ``uint64_t *destinations,``
>> +|         ``int32_t *errors,``
>> +|         ``struct bus1_message *message``
>> +| ``);``
>> +
>> +The send command takes a peer file-descriptor as ``peerfd``, the message to
>> +send as ``message``, and an array of destination handles as ``destinations``
>> +(with ``n_destinations`` number of elements).
>> +
>> +Additionally, ``errors`` is used to return the individual error code for each
>> +destination. This is only done if the send command returns success. Since
>> +currently partial failure is not exposed, ``errors[i]`` is currently always
>> +set to 0 on success.
>> +
>> +All destination IDs must refer to a valid handle of the calling peer.
>> +``EBADRQC`` is returned if an ID did not refer to an handle. Currently, only
>> +a single message can be provided with a single send command, and this message
>> +is transmitted to all destinations in a single atomic transaction.
>> +
>> +The message to be transmitted is provided as ``message``. This structure
>> +describes the payload of the message. ``message.flags`` must be 0.
>> +``message.type`` must be ``BUS1_MESSAGE_TYPE_USER``. ``message.n_transfers``
>> +and ``message.ptr_transfers`` refer to an array of ``struct bus1_transfer``
>> +and describe handles to be transferred with the message. The transfers are
>> +used the same as in ``bus1_cmd_transfer(2)``, but ``BUS1_TRANSFER_FLAG_CREATE``
>> +is currently not refused.
>> +
>> +``message.n_data_vecs`` and ``message.ptr_data_vecs`` provide the iovecs with
>> +the data to be transmitted with the message. Only the first ``message.n_data``
>> +bytes of the iovecs are considered part of the message. Any trailing bytes
>> +are ignored. The data is copied into kernel buffers and the iovecs are no
>> +longer accessed once the command returns.
>> +
>> +Recv Command
>> +^^^^^^^^^^^^
>> +
>> +| ``struct bus1_metadata {``
>> +|         ``uint64_t flags;``
>> +|         ``uint64_t id;``
>> +|         ``uint64_t account;``
>> +| ``};``
>> +|
>> +| ``int bus1_cmd_recv(``
>> +|         ``int peerfd,``
>> +|         ``struct bus1_metadata *metadata,``
>> +|         ``struct bus1_message *message``
>> +| ``);``
>> +
>> +The recv command takes a peer file-descriptor as ``peerfd`` and fetches the
>> +next message from its queue. If no message is queued ``EAGAIN`` is returned.
>> +
>> +The message is returned in ``message``. The caller must set ``message.flags``
>> +to 0 and ``message.type`` to ``BUS1_INVALID``. ``message.n_transfers`` and
>> +``message.ptr_transfers`` refer to an array of ``struct bus1_transfer``
>> +structures used to return the transferred handles of the next message. Upon
>> +return, ``message.n_transfers`` is updated to the actually transferred number
>> +of handles, while ``message.transfers[i]`` is updated as described in
>> +``bus1_cmd_transfer(2)``.
>> +
>> +``message.n_data``, ``message.n_data_vecs``, and ``message.ptr_data_vecs``
>> +must be initialized by the caller and provide the space to store the data of
>> +the next message. The iovecs are never modified by the operation.
>> +
>> +If the message would exceed ``message.n_transfers`` or ``message.n_data``,
>> +``EMSGSIZE`` is returned and the fields are updated accordingly.
>> +
>> +Upon success, ``message`` is updated with data of the received message, with
>> +transferred handles and data written to the transfer array and iovecs.
>> +
>> +``metadata`` is updated to contain more data about the message.
>> +``metadata.flags`` is unused and set to 0. ``metadata.id`` contains the ID
>> +of the node the message was received on (or the ID of the handle in case of
>> +``BUS1_MESSAGE_TYPE_NODE_RELEASE``). ``metadata.account`` contains the ID
>> +of the resource context of the sender.
>> +
>> +Errors
>> +------
>> +
>> +All operations follow a strict error reporting model. If an operation has a
>> +documented error case, then this will be indicated to user-space with a
>> +negative return value (or ``errno`` respectively). Whenever an error appears,
>> +the operation will have been cancelled entirely and have no observable affect
>> +on the bus. User space can safely assume the system to be in the same state as
>> +if the operation was not invoked, unless explicitly documented.
>> +
>> +One major exception is ``EFAULT``. The ``EFAULT`` error code is returned
>> +whenever user-space supplied malformed pointers to the kernel, and the kernel
>> +was unable to fetch information from, or return information to, user-space.
>> +This indicates a misbehaving client, and usually there is no way to recover
>> +from this, unless user-space intentionally triggered this behavior. User-space
>> +should treat ``EFAULT`` as an assertion failure and not try to recover. If the
>> +bus1 API is used in a correct manner, ``EFAULT`` will never be returned by any
>> +operation.
>> +
>> +Resource Accounting
>> +-------------------
>> +
>> +Every peer has an associated resource context used to account claimed
>> +resources. This resource context is determined at the time the peer is created
>> +and it will never change over its lifetime. The default, and at this time only,
>> +accounting model is based on UNIX ``UIDs``. That is, each peer gets assigned
>> +the resource-context of the ``Effective UID`` of the process that creates it.
>> +From then on any resource consumption of the peer is accounted on this
>> +resource-context, and thus shared with all other peers of the same ``UID``.
>> +
>> +All allocations have upper limits which cannot be exceeded. An operation will
>> +return ``EDQUOT`` if the quota limits prevent an operation from being
>> +performed. User-space is expected to treat this as an administration or
>> +configuration error, since there is generally no meaningful way to recover.
>> +Applications should expect to be spawned with suitable resource limits
>> +pre-configured. However, this is not enforced and user-space is free to react
>> +to ``EDQUOT`` as it wishes.
>> +
>> +Unlike all other bus properties, resource accounting is not part of the bus
>> +atomicity and ordering guarantees, nor does it implement strict rollback. This
>> +means, if an operation allocates multiple resources, the resource counters are
>> +updated before the operation will happen on the bus. Hence, the resource
>> +counter modifications are visible to the system before the operation itself is.
>> +Furthermore, while any failing operation will correctly revert any temporary
>> +resource allocations, the allocations will have been visible to the system
>> +for the time of this (failed) operation. Therefore, even a failed operation
>> +can have (temporary) visible side-effects. But similar to the atomicity
>> +guarantees, these do not affect any other bus properties, but only the resource
>> +accounting.
>> +
>> +However, note that monitoring of bus accounting is not considered a
>> +programmatic interface, nor are any explicit accounting APIs exposed. Thus, the
>> +only visible effect of resource accounting is getting ``EDQUOT`` if a counter
>> +is exceeded.
>> +
>> +Additionally to standard resource accounting, a peer can also allocate remote
>> +resources. This happens whenever a transaction transmits resources from
>> +a sender to a receiver. All such transactions are always accounted on the
>> +receiver at the time of *send*. To prevent senders from exhausting resources
>> +of a receiver, a peer only ever gets access to a subset of the resources of any
>> +other resource-context that does not match its own.
>> +
>> +The exact quotas are
>> +calculated at runtime and dynamically adapt to the number of different users
>> +that currently partake. The ideal is a fair linear distribution of the
>> +available resources, and the algorithm guarantees a quasi-linear distribution.
>> +Yet, the details are implementation specific and can change over time.
>> +
>> +Additionally, a second layer resource accounting separates peers of the same
>> +resource context. This is done to prevent malfunctioning peers from exceeding
>> +all resources of their resource context, and thus affecting other peers with
>> +the same resource context. This uses a much less strict quota system, since
>> +it does not span security domains.
>> -- 
>> 2.53.0
>>
