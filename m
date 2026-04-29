Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F5340283
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446423; cv=none; b=QOI5On0g/xhGhDyqZD+0LZ9fZX8WwUZUprXq+5e8+VH/dPKvWcTIZ0MfDVUqggC2UPKlwprgq3Az0tH4Xm2QzRVZwyzWhY8UM1VK9k7pU75CHNGbkYAubXOn88UG5OAWaZoPixRc4E5/qCQyYOCJwsVEfoha8IXWKVHUgtApuvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446423; c=relaxed/simple;
	bh=cgvTWorRThUHIM+na5ecvtrvC0WZ8ILVerKnLiOCGyY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=b/rIOXrFBqSe2KXz/Tp5ZgSW2qAt8WRLzRa54kniH6FDdTbY3NJIV2oHwB2Ddl9EDzRrbs6x8LJH6IvDEibSTwSK+aLhrxjsxjs+2TPrgtyub8Cw/E39G1RypbCsj/CaOjg/f5/mHKb6GGHbp8wNI3UniwVklC/1NeZDjZXfWWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=BzugDHX8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I8WJLvIE; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="BzugDHX8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I8WJLvIE"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 4FB8FEC0109;
	Wed, 29 Apr 2026 03:06:59 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Wed, 29 Apr 2026 03:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777446419;
	 x=1777532819; bh=Bb6q9+AI2BWULtT8AEgpL92OhctiJCF8wnNoEwLdT5c=; b=
	BzugDHX8Pl05wOSM0ASTeKfVpjztzN7swjWGVOJOV9r/v/JCa361Gi1X2xYtxaD7
	CQNVVQ55JK/xKwqZUxwN6Nux+sZAUzjSxbdU9t8lLw1m3MRHzs7SrptDZLGUcyMf
	uX1JitHgC+eZv6FxZRyjjjgzO6iuG2msT6oXchg8gVgwP1ER9APaje4mbbVu92wH
	ayszKnZ+7plS3rlMV2UZjmpGMrcPnQErfiq89uKMaNtsHBkp9HK3o7lJh2ZSMJ/U
	gwsqmqnq040QzLx71rU4Y6H2M3rsEhditC4bPG/v7IjKgTXaqM6h8rWnR8ztnHBc
	UeeCc1K8nocR6PuueY2gxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777446419; x=
	1777532819; bh=Bb6q9+AI2BWULtT8AEgpL92OhctiJCF8wnNoEwLdT5c=; b=I
	8WJLvIEgEUefkue6EDrCUh1vBm4SLZ/sHeYQqINlRBF4wDuuVccWn34EOlr1prLP
	0PfnirBzdswCDj/2/xVGrOh9I8dGtD3nxf8+n/HpNHiqszem8X5xxf8+WPMhNdlB
	b+Uf3daueJ+3ZikmBQOpDKO/Jc+S0fzOFvUil3CHdrUJ5GbS9aPrAIOKCAy8JXOg
	3uMFSyD2C30yow/QrH8U/VKq3RQS0U2nJa6nAlT7BQOziBcUo5iM9jfGKErQNKx7
	S5+7hotLXrlpNm0jTWB9Ue08so5pfi5U2HeOLjtlqfR1VpVNkJudTIrl2Nn7ScM4
	tEYyqIzZkBKD2HS6lZnIQ==
X-ME-Sender: <xms:Eq7xaai2PPBDbB1qzBipbw-Hit1KHrqDpjXKUf1kJ3Y0vZ6J3NPBhA>
    <xme:Eq7xaV2JY8TZjVR5NtX3Rc6g30W5MRKG45NNe8fgt-9gBmT0nEhPH4SFxGFloD5IJ
    L6chPx0iJjHEBABCRROjlfklf-rvM8_fIZPjRVBvokOKUvrftYvkTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfeektdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Eq7xadIltUSuSLZdvqrmJ4Dvqnez9fmqrKXPkk3BXh4pW4LALzXvAQ>
    <xmx:Eq7xaW_U09M-GfYLzZocS2zkYgkyiGEM04UwcY89MJ8ucMtwR6onEw>
    <xmx:Eq7xaQJjokfFTnUb9USBqK5liC2wgOo-ff9hJIdQ3LSJYpC1c-JKtw>
    <xmx:Eq7xablBhrVqBA_Y2dnKEKxmBEHjmuv47QKQyoWC0Z5ZY8d__OEq3A>
    <xmx:E67xaeUIxmDrBmwPE-i98s9ZEKnqPl4HhA5kB4U-cBhfxEH8yOZtjZzV>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 779D315C008C; Wed, 29 Apr 2026 03:06:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhuZrXbOafIs
Date: Wed, 29 Apr 2026 09:06:38 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Thomas Meyer" <thomas@m3y3r.de>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no,
 "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <70d41cf9-baec-4527-8f79-eacc33e7674c@app.fastmail.com>
In-Reply-To: <adpCrdG4gZbMAL2v@localhost.localdomain>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-8-david@readahead.eu> <adEurRZBWe9poAI4@jupiter>
 <adpCrdG4gZbMAL2v@localhost.localdomain>
Subject: Re: [RFC 07/16] bus1: add man-page
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I missed this, sorry!

On Sat, Apr 11, 2026, at 2:46 PM, Thomas Meyer wrote:
> I did write a small test program, that creates handles in a loop till it gets
> an error from the OS, and run it against the code from your wip/bus1 branch on
> github/bus1/linux. The creation of handles itself doesn't seems to get
> accounted. If you like I can upload this little test program somewhere.

Oh my, I did not hook up the accounting. Will do so! Your changes look good!

Thanks
David

> commit aa0b3987801e8ea773254badcd17b73ae140dbf2
> Author: Thomas Meyer <thomas@m3y3r.de>
> Date:   Sat Apr 11 14:06:47 2026 +0200
>
>     bus1: charge handles and fix unlink
>
> diff --git a/ipc/bus1/bus.rs b/ipc/bus1/bus.rs
> index 70a6a4f35d96e..e5222fdb931a7 100644
> --- a/ipc/bus1/bus.rs
> +++ b/ipc/bus1/bus.rs
> @@ -20,6 +20,7 @@ enum MessageError {
>  #[pin_data]
>  struct Peer {
>      actor: Arc<acct::Actor>,
> +    charge: acct::Charge,
>      waitq: *mut kernel::bindings::wait_queue_head,
>      queue: lll::List<TxNodeRef>,
>      queue_committed: atomic::Atomic<usize>,
> @@ -36,6 +37,7 @@ struct PeerLocked {
>  #[pin_data]
>  struct Node {
>      owner: Arc<Peer>,
> +    charge: acct::Charge,
>      userdata: atomic::Atomic<usize>,
>      op_rb: rb::Node,
>      #[pin]
> @@ -124,10 +126,15 @@ fn new(
>          actor: Arc<acct::Actor>,
>          waitq: *mut kernel::bindings::wait_queue_head,
>      ) -> Result<Arc<Self>, AllocError> {
> +        let charge = actor.as_arc_borrow().charge(
> +            actor.as_arc_borrow(),
> +            &[1, core::mem::size_of::<Self>() as u64],
> +        ).map_err(|_| AllocError)?;
>          let tx = Tx::new()?;
>          match Arc::pin_init(
>              pin_init!(Self {
>                  actor,
> +                charge,
>                  waitq,
>                  queue: lll::List::new(),
>                  queue_committed: atomic::Atomic::new(0),
> @@ -381,9 +388,14 @@ impl Node {
>      fn new(
>          owner: Arc<Peer>,
>      ) -> Result<Arc<Self>, AllocError> {
> +        let charge = owner.actor.as_arc_borrow().charge(
> +            owner.actor.as_arc_borrow(),
> +            &[1, core::mem::size_of::<Self>() as u64],
> +        ).map_err(|_| AllocError)?;
>          match Arc::pin_init(
>              pin_init!(Self {
>                  owner,
> +                charge,
>                  userdata: atomic::Atomic::new(0),
>                  op_rb: rb::Node::new(),
>                  inner <- kernel::sync::new_mutex!(
> @@ -470,6 +482,10 @@ fn new(
>          node: Arc<Node>,
>          owner: Arc<Peer>,
>      ) -> Result<Arc<Handle>, AllocError> {
> +        let _charge = owner.actor.as_arc_borrow().charge(
> +            owner.actor.as_arc_borrow(),
> +            &[1, core::mem::size_of::<Self>() as u64],
> +        ).map_err(|_| AllocError)?;
>          Arc::new(
>              Self {
>                  node,
> @@ -803,12 +819,10 @@ fn commit(self: Pin<&mut Self>) {
>              let txnode = TxNodeRef::new_release_handle(h.clone());
>              if let Err(_) = to.queue.try_link_front(txnode) {
>                  kernel::warn_on!(true);
> -                c.try_unlink_and_move_next();
> -                continue;
>              }
> 
>              h.as_arc_borrow().unlink();
> -            c.move_next();
> +            c.try_unlink_and_move_next();
>          }
> 
>          // Step #2
