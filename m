Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FA463B96
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470014; cv=none; b=DsrXJTgYW3bXS7zfK+6fUE9d5B8xlp0t5MnogRIOdS5w4zR8p5sYaKUje6TQxT57ol0FvHgWQFrfXgCCGGIfLSFVD04IEzcObq6FQs6q1lloykAqQqmG+g5DZefXF/DE5dFTySAIv7odgdqgFdhyHRft805g1PHh1Q4kh9BXQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470014; c=relaxed/simple;
	bh=xU4gqfJXx8GMiVqUJEBxoIQzVscXQdVfbkrh2L/9qY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=egepHUcCMyijLP54n47ZD6L+3LWoEQHzFTrY+D5n7Q3hdTftpQigIF13ZDtcbyTkS9d095lloOVcQuM/oG7CXmIvlDeXIhJynV1wn4pIfs92P8ibuYnadvPS5QlZ72SwwlUu8/nQvHbqZi2PZ9HKU4ldXfi++jiWCNhB+NuivbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNadu1IS; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNadu1IS"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4957287363bso342345e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786470010; x=1787074810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lgBCfWcHxEGTaZ2+pGA+Ib2UgPlCK4w8PO3e8rNA0E=;
        b=mNadu1ISdygrph6p7MdyBRrDMdmQvQpKQLM/nJBayYqZak/AfgMXWhACiZdiJa/90R
         JT0zZF0/lcUlAlCsVv0CmZikQYSWXvebfW8CEr59myQ1MwC6FZCgQM6mkxN4LWHRRbN/
         agOR1RndsOnFWR9fJJ7RE8xhUaLOztgEL4KkO5oB7PYGCQEI5U1Y64Z18hrrXMoFGuYQ
         AF5ggwyQNK5cSzZUiHw8QCW50hlHvDPV5KzTZgihoETHHLljHJodUMz42CV8ivTMvRYv
         n+GO4ln008x4yVrBHnknn/qrauGy53uPtVZAXTgN1eofCu/kA2SA3qXEDZHSKUXMu55/
         /xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786470010; x=1787074810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lgBCfWcHxEGTaZ2+pGA+Ib2UgPlCK4w8PO3e8rNA0E=;
        b=dtD02hEqNIrdjB1I9fDVwk4t0OVau5T/34ZK9D8DTNWStI6fIz+JmOPYSlfu+vDnJc
         bAVsWtyLAlVQW3B9ZdgxGvQ9ZGbCFdxngZl2GHArOs0yJoSbupeey/rsrlBJWyDIsMTM
         JkNI7eDjJ1hQSwyHixPVwfvLHo+qXX6I+k8SWaMbFIPmU8m2e6PplVfQ1BqiVkqYSRFY
         yd8JOQONbtD64Vl/BYO+Cf8m05m4kNhY8evYBde+280V0yMEs/gPpDTPKf9PjFFirn/7
         hCo0CmilUzckdVRLmJoqlSZt9MmqGPjiL7eBHh8Qs7b73Nrls0jhy7mLboVi+VHRu1xO
         18mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAeI6LaHa+aWZ1bEKVXIT4+JEsC7bsg3Ud0oZDP1YjYc54TP3BhD+yJF0WYBEH5HsCl+aqpo+hp4KJV4zmRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydkeaylxwApA45XtX6If5cYbR/4t9aPP1o687FyIwjwOI1vk6L
	42Aip+ghqGTjIr1gz72KpoWsjx1FDMMheY69iJFvUWWLLBc85S02XzaYL8DMNmG7A4O6RG2m99/
	aTaryKDnAmEX7D1TaKA==
X-Received: from wmcz23.prod.google.com ([2002:a05:600c:c297:b0:499:500a:27d6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f83:b0:499:781e:25fc with SMTP id 5b1f17b1804b1-4997842c0e7mr74365885e9.3.1786470009475;
 Tue, 11 Aug 2026 10:40:09 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:40:07 +0000
In-Reply-To: <anpinBy0adT0JDVn@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-defer-complete-v2-1-6c67af0e2ac2@google.com> <anpinBy0adT0JDVn@google.com>
Message-ID: <anted6Qc-yHE8cMh@google.com>
Subject: Re: [PATCH v2] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos <tkjos@android.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 10, 2026 at 11:45:32PM +0000, Carlos Llamas wrote:
> On Wed, Jul 22, 2026 at 09:09:22PM +0000, Alice Ryhl wrote:
> > Userspace only actually specifies TF_DEFER_COMPLETE when the Parcel does
> > not contain fds or refcounts on binder objects. This is because
> > otherwise said fd or binder node will not be freed until the binder
> > thread receives another incoming transaction, which could be a long
> > time. In the case of fds, this is especially important because delaying
> > fclose() can result in processes hanging because they read from a pipe
> > that isn't being closed due to fclose() not getting called. Note that
> > even if TF_DEFER_COMPLETE is not specified for this transaction, it can
> > still be useful to defer the BC_REPLY command, as it can still avoid a
> > userspace roundtrip when a new incoming transaction is available right
> > away.
> 
> The processing of a deferred COMPLETE doesn't change right? It doesn't
> matter if the kernel rejects / ignores the new flag, userspace will
> still follow the same path. 100% backward-compatible then.

Yes. In fact, if userspace passes the flag to a kernel without support
for it, the only consequence is worse perf (extra userspace roundtrips).
It will still work correctly.


> > +            // Note that if the thread list is empty, then the call to `pop_work()` has changed
> > +            // `process_work_list` back to `false` even if we set it to `true` above.
> > +            thread_has_deferred_work = inner.process_work_list;
> 
> I might be getting this wrong, but for the new TF_DEFER_COMPLETE case,
> we have !process_work_list and !work_list.is_empty(). Then pop_work()
> does not touch process_work_list because it's already false.
> 
> So we set thread_has_deferred_work to false? Maybe this was meant to be:
> 	thread_has_deferred_work = !inner.work_list.is_empty()

You're right.

> > +            {
> > +                // This performs a deferred push so that `read` can wait for the next incoming
> > +                // transaction without a userspace roundtrip.
> > +                let mut inner = self.inner.lock();
> > +                inner.push_work_deferred(completion);
> > +                // However, if `TF_DEFER_COMPLETE` is not set, then set `process_work_list` to make
> > +                // the push non-deferred. This forces a userspace roundtrip.
> > +                inner.process_work_list |= info.flags & TF_DEFER_COMPLETE == 0;
> 
> If there is already a push_work() and a push_work_deferred() why use
> process_work_list directly? Is it to avoid an if/else?

I guess so ...

Alice
