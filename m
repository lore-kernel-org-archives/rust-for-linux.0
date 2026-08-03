Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD03B4EA4;
	Mon,  3 Aug 2026 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791078; cv=none; b=ulWCdPTziI4fb5abtewrqPhX2BQ8INMsuvLQ5WyxCD69x0MGP0aB4m93VM2f0+/yA1AW9v0WBWv0BME/vP0dbF+tgEIKVOHKwoK9Zt3ofopXrC1zz9VFW50ZWoeJjfZdCGFFy0PdshsbL4vM0OxHk7ajmtPl0Oq8eYL6mWMU1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791078; c=relaxed/simple;
	bh=T/MaYaDhfX+oTNtT9EArHi+ETsxEhYGEnKt082Gc0Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dh5quWD4VZpgFLPFKCUbZFqOkleUly8TAlE2Ze+nOYOatdfIoaW5Z2lpXAfvZa++XhoRJ0QjY0L6H5xtQaOFeEcx2Cx2uh+i86eFhG+ZCsIEk6fxazSH0mlKFg2c6x37WkxH0t1SQvXiRaapGk3ZwcSR6ghnIOy1pfU1neBQEhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIOK1WlV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIOK1WlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550401F00A3A;
	Mon,  3 Aug 2026 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785791076;
	bh=1wcla+cpyTUwdL1zK44hfxerjucjva9kw2ePOFeXSM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GIOK1WlVIGt/41ZD2q3T/RQiNzIQuNgGhlgNzvEzswLomYHzde9u93rIkfLL5JX/y
	 7GzHGoucFEdkz0BJeJUbM04P1DvjKH8OHbkj7vG3gZ5sKVlXvsrIrBHAQB6QAmZvQZ
	 p/34ljcxbFNUkUrx5rg6eS+bfnkHeIOgJHcUECy0bpl/JPpgeF6PKIHkktZXax19H1
	 JIv28IRr4WnReW7LWHNlGNgVm68XGiC05AA/sc4vO9v/30UJXPj3f6jmUbeKADlr+H
	 6xXE3svBtlySxrVKQ5LLT9KXDQwPfohqk/z5iZb7suuP8Kvqu83Zf+58eHUDXKqfnr
	 tCNl85yiN7q1Q==
Message-ID: <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org>
Date: Mon, 3 Aug 2026 23:04:32 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rust compile failure in next-20260730
Content-Language: en-US
To: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>,
 Harry Yoo <harry@kernel.org>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162> <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
 <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 17:32, Gary Guo wrote:
> On Mon Aug 3, 2026 at 4:10 PM BST, Vlastimil Babka (SUSE) wrote:
>> On 8/3/26 16:23, Boqun Feng wrote:
>>> On Mon, Aug 03, 2026 at 02:57:49PM +0100, Gary Guo wrote:
>>>> 
>>>> We could also unconditionally use `kvfree_rcu_head` here, and
>>>> add
>>>> 
>>>>     #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
>>>>     pub type kvfree_rcu_head = callback_head;
>>>> 
>>>> to bindings.rs?
>>>> 
>>> 
>>> This option is currently not maintainable unless it becomes a
>>> maintainer-aware way to handle things like this.
>>> 
>>>> (Or even better, changing `#define` to `typedef` so bindgen takes care of
>>>> everything).
>>>> 
>>> 
>>> Yes, this is better IMO, but it's up to slab maintainers. :-)
>>
>> Can you elaborate a bit please, how would that look like?
> 
> I was thinking of doing `typedef struct rcu_head kvfree_rcu_head;` but of course
> that didn't work because you can't use typedef to create `kvfree_rcu_head` :)
> 
> However, something like this could work?
> 
>     #ifdef CONFIG_KVFREE_RCU_BATCHED
>     ...
>     #else
>     struct kvfree_rcu_head {
>         struct rcu_head head;
>     };
>     #endif
> 
> and everywhere add a cast everywhere that expects kvfree_rcu_head == rcu_head.
> 
> but this would indeed be more complex :(

So you mean like this? Doesn't seem so complex and seems to compile here
with CONFIG_KVFREE_RCU_BATCHED both disabled and enabled.
I can apply the slab part in slab tree, but AFAICS the poll.rs
change still needs to be done in the merge commit. Unless there's
some way to make things conditional on whether kvfree_rcu_head exists?

diff --git a/include/linux/types.h b/include/linux/types.h
index 79bf419c69e4..53e0adca4b9f 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -262,7 +262,9 @@ struct kvfree_rcu_head {
 	struct kvfree_rcu_head *next;
 };
 #else
-#define kvfree_rcu_head rcu_head
+struct kvfree_rcu_head {
+	struct rcu_head head;
+};
 #endif
 
 typedef void (*rcu_callback_t)(struct rcu_head *head);
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 64845ac81b79..aecbe9b9df4c 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1325,11 +1325,11 @@ EXPORT_SYMBOL_GPL(kfree_call_rcu_nolock);
 
 #ifndef CONFIG_KVFREE_RCU_BATCHED
 
-void kvfree_call_rcu(struct rcu_head *head, void *ptr)
+void kvfree_call_rcu(struct kvfree_rcu_head *head, void *ptr)
 {
 	if (head) {
 		kasan_record_aux_stack(ptr);
-		call_rcu(head, kvfree_rcu_cb);
+		call_rcu(&head->head, kvfree_rcu_cb);
 		return;
 	}
 
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index 684dfa242b1a..f3cdf95db12d 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -124,7 +124,7 @@ pub struct PollCondVarBox {
 struct PollCondVarBoxInner {
     #[pin]
     inner: PollCondVar,
-    rcu: Opaque<bindings::callback_head>,
+    rcu: Opaque<bindings::kvfree_rcu_head>,
 }
 
 // SAFETY: PollCondVar is Send

