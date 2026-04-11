Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D01262A6
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775911610; cv=none; b=rRiuzrXzYq3vt2ubMYB6Xpehl9QmExRFiJINelscVinMh+z6aSoIkGINkncX3BTky1Yr4eMKfDnt/1nNDcqIBosjenjkZoXLrfCbSN5xTUTljwbdbxgVchWXrTSERWr6ERl0gbxmIz225lWkjjRaX3qKPtrLPe9vRd880NH7UEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775911610; c=relaxed/simple;
	bh=BSLzqjL2jogudaCEFfl0WD3CP+0J4XFNOBrXEMfRiyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZnQ3oIm/MfRm0HQuIHOGAT/X3m05V3ZPF+EhVXW/i+OZsgG1rgzSH+4Ei8beBtcp7CDrm8h+eUj/mNCF6gejeBJD4C1m8TTMkX1Bf1+oGCjcp1+Q8a/99SeI9/t9AA8b9Y6CQn0T3rO+6DW8k86qaBLqSkZWUP09l41y2mu0A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de; spf=pass smtp.mailfrom=m3y3r.de; dkim=pass (2048-bit key) header.d=m3y3r.de header.i=@m3y3r.de header.b=CR8kOgOU; arc=none smtp.client-ip=213.133.104.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m3y3r.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=m3y3r.de header.i=@m3y3r.de header.b="CR8kOgOU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=m3y3r.de;
	s=default2402; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=sbqYHjVQ+tWww2qc6Nl7l6le2Tjv72fCh6LiFtyepzw=; b=CR8kOg
	OUYAkRDfkFroSH2uAaFjdm/FRE3qru/F5Z0aqJRl6ZU4TbIuWcX2bjB/L+k//psFjVEJdS7TpPSxz
	/JKtgfOw/Jlm2hcGakF4tDO8zMgKuzULiFtK5rdz1ADRFO8517tyrExbmJ3E1FNQyi+huAHmZ2iXw
	mm+GyQsga0QW5ZiSZ/IGdVbFtCgxo7L7nnRFFuCG2DHrdSZ6cYL+5NyV7+PmrkBnjWIZIw7lTB3UN
	NTny5lwbGeSZMapHg+ZK0mj0QSqsgNvrppdkWdWiB60h68bLlTjelLQUHUtgwX8wdoN0e/9vzwjbC
	ptUEg4rytetFZ4Hk2y4500uQBEJg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www17.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <thomas@m3y3r.de>)
	id 1wBXjT-000OnG-18;
	Sat, 11 Apr 2026 14:46:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <thomas@m3y3r.de>)
	id 1wBXiv-00085D-2F;
	Sat, 11 Apr 2026 14:46:38 +0200
Date: Sat, 11 Apr 2026 14:46:37 +0200
From: Thomas Meyer <thomas@m3y3r.de>
To: David Rheinsberg <david@readahead.eu>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [RFC 07/16] bus1: add man-page
Message-ID: <adpCrdG4gZbMAL2v@localhost.localdomain>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-8-david@readahead.eu>
 <adEurRZBWe9poAI4@jupiter>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adEurRZBWe9poAI4@jupiter>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27968/Sat Apr 11 08:24:24 2026)

Hi,

I did write a small test program, that creates handles in a loop till it gets
an error from the OS, and run it against the code from your wip/bus1 branch on
github/bus1/linux. The creation of handles itself doesn't seems to get
accounted. If you like I can upload this little test program somewhere.

I'm a rust beginner, so be gentle :-)
Here is my try of fixing it:

commit aa0b3987801e8ea773254badcd17b73ae140dbf2
Author: Thomas Meyer <thomas@m3y3r.de>
Date:   Sat Apr 11 14:06:47 2026 +0200

    bus1: charge handles and fix unlink

diff --git a/ipc/bus1/bus.rs b/ipc/bus1/bus.rs
index 70a6a4f35d96e..e5222fdb931a7 100644
--- a/ipc/bus1/bus.rs
+++ b/ipc/bus1/bus.rs
@@ -20,6 +20,7 @@ enum MessageError {
 #[pin_data]
 struct Peer {
     actor: Arc<acct::Actor>,
+    charge: acct::Charge,
     waitq: *mut kernel::bindings::wait_queue_head,
     queue: lll::List<TxNodeRef>,
     queue_committed: atomic::Atomic<usize>,
@@ -36,6 +37,7 @@ struct PeerLocked {
 #[pin_data]
 struct Node {
     owner: Arc<Peer>,
+    charge: acct::Charge,
     userdata: atomic::Atomic<usize>,
     op_rb: rb::Node,
     #[pin]
@@ -124,10 +126,15 @@ fn new(
         actor: Arc<acct::Actor>,
         waitq: *mut kernel::bindings::wait_queue_head,
     ) -> Result<Arc<Self>, AllocError> {
+        let charge = actor.as_arc_borrow().charge(
+            actor.as_arc_borrow(),
+            &[1, core::mem::size_of::<Self>() as u64],
+        ).map_err(|_| AllocError)?;
         let tx = Tx::new()?;
         match Arc::pin_init(
             pin_init!(Self {
                 actor,
+                charge,
                 waitq,
                 queue: lll::List::new(),
                 queue_committed: atomic::Atomic::new(0),
@@ -381,9 +388,14 @@ impl Node {
     fn new(
         owner: Arc<Peer>,
     ) -> Result<Arc<Self>, AllocError> {
+        let charge = owner.actor.as_arc_borrow().charge(
+            owner.actor.as_arc_borrow(),
+            &[1, core::mem::size_of::<Self>() as u64],
+        ).map_err(|_| AllocError)?;
         match Arc::pin_init(
             pin_init!(Self {
                 owner,
+                charge,
                 userdata: atomic::Atomic::new(0),
                 op_rb: rb::Node::new(),
                 inner <- kernel::sync::new_mutex!(
@@ -470,6 +482,10 @@ fn new(
         node: Arc<Node>,
         owner: Arc<Peer>,
     ) -> Result<Arc<Handle>, AllocError> {
+        let _charge = owner.actor.as_arc_borrow().charge(
+            owner.actor.as_arc_borrow(),
+            &[1, core::mem::size_of::<Self>() as u64],
+        ).map_err(|_| AllocError)?;
         Arc::new(
             Self {
                 node,
@@ -803,12 +819,10 @@ fn commit(self: Pin<&mut Self>) {
             let txnode = TxNodeRef::new_release_handle(h.clone());
             if let Err(_) = to.queue.try_link_front(txnode) {
                 kernel::warn_on!(true);
-                c.try_unlink_and_move_next();
-                continue;
             }
 
             h.as_arc_borrow().unlink();
-            c.move_next();
+            c.try_unlink_and_move_next();
         }
 
         // Step #2
