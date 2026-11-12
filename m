Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514918;
	b=J6LBdj5hPi4v55gfttoxzl+TLa7mVnICT4QLoroqZbgZaRZQvvHJH6oRUty3RDWumxC4
	 cHEGFbr6njTIN8uu7K+DEtDdds6sQo26see7UxDeZYv3LW4cEJbLNqVtlulgr9LuFVRQ2
	 aaTaQVucjImmsP7HqkQbYKilemNOSWoN8l78Bmb4Z3QYJnMOksiIqFrqG/viaxHOJQ1yQ
	 TyTC2tOl8mfPrVltmHIV/tFOsNhizhLFz0KqrN7nxI33dyoyFkHYyxP4fb67Z7RCs5rpv
	 WBfyxrCT0SxRCKy8LVJaULNBQ3bhWGFPVjFxHOUOe8QpagkZ/BSt0MhynecMx0LYo0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HLVKQ5q/RC7N1G6VFkxAy6YbPfLl1hH8SPJjv+91rpU=;
	b=5D5BUyDs16gS81dClRwFCByGZ2k2KaieRY2QOU60PKTxIzyHQn05bmI4bJkruBfXfGSd
	 mmyey+Tu+934xO0qBvyfB2FRTNXRimLoJsgXq4ZbkHorSheh9B7KhXgBTzSESt3nOTNWx
	 cv88CurHv6Fi/x5Zq5O7NzOzGaZ2QWAGvqj5u5G0aMkWScJU8geaL7I+0rHouyZtvPWp7
	 W29GyV5+bVbeGOMfOytEWNd+b7tsG4KDR6td9twBuY2Cq5Ox7ILBp7fmzAl+ADDgMf6ud
	 RJyskIKTldmKLpUlMynsVS2FB76l81RzjC382iVWOzZJpesiNL33dWcH7mX+v2yefUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHu2CNIq;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443D606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 20:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4443D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHu2CNIq
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16afcso22295ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794514917; x=1795119717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HLVKQ5q/RC7N1G6VFkxAy6YbPfLl1hH8SPJjv+91rpU=;
        b=QHu2CNIqST2nEYggP6ih40MK9P1PuDGS206mM+0PL3apX84hoqBNgLDi3Jw6FO3Rgd
         kZqoY35q0bwhxdt+Yw6Su0gbjn6teoE+Fc/8EjRRbF/qouzl/EZDYc/ipqz9ISA5R37k
         RpdfzbrE+4sEGl8p90XD754lUx7ohx3J5QCi7Y2OdU3F1qgyQe254//j2I/TxmYFYHjH
         8cOEDXY7yz2kJHa5+w9LBgkqpNj7Zg1evC3KHU/ntsm646f3SbPYO/tiol92QXWoNUm7
         Bkz1IEd6Zt66EjtSwvvsG+R1R0LjMgTzBSJFUKLtUr5LKR3fI0B1GdZYiuccBCivZZw0
         qltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794514917; x=1795119717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLVKQ5q/RC7N1G6VFkxAy6YbPfLl1hH8SPJjv+91rpU=;
        b=XcOrr2HcNb50s/u3ZgNdeyNstGmO9WQANge2JiQsfeKaQ0mtVRGFrM1CcYXDVLKm3S
         NrnG9yDtwLBPthgx7lPbxmA2rSDTXTjRIyKDZF9gFTF447NWdhfwY7tLAkxjAM6yO0sP
         kDH5lc66uYw/M2mfc+Yjj/x43rMKFdjNQBPRee2QQVqCi0o/+BBb6RTtbzSL4pXlXTPi
         7n6QDWWmx1xOp4aQM3EtJkBPFlad20k1t+BAJoaNIfNl98OZBjNuE9Z+ueivMKqsG8SQ
         QaP3aiS1ufcQLMEMmF238hfbjLmqtXYj76CD3S9KAs1yPhl78Q4hwpCRsImjHjy9vqQd
         ajiQ==
X-Forwarded-Encrypted: i=1; AL+hErEyMzyKDjpaMFbCPLXuHP+u0IMdgp3+yL6d21qfhhYozahFhEN+oB/V5I43uXFDmQxoXw0pO5sTQIVIXom9Rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eBF5ZDYyDAfgvx9JKpBdwctXS5wVEYX405GvVkbqrgZD4ISC2
	Tx5NQAeQh0KYO9SRgoqpkCQ7q6UCK7cCeoDgq3Vo6auyrocmPgJKJfu/hkU4WgU0nw==
X-Gm-Gg: AYBFou0FpecWZqivVO75X5HnxsAfLvV6fYsKetRGeUMBpqvRpBwbGZHVJu6STzuMDgi
	yz9rEQPu3AmVHxU4+rzgn9LitaomLldo5Yxg76u2f9G8WWSy2YNC8520jVpuGLaDI6pK4VeLiV2
	2cc6WDhATztdRb5uNYx2Xpio1pBylo/2R8tRtuOcXBN6zqPpeN/RL9fRLBuaLLD0mQA94YqcuKh
	dpaVYUh5YKPfh4M6LLcKcUVIQWXizkUU4RDAZ2+ev+LC0vYQA30KMQsrA5a47X8u44N418w2XRz
	dgz68n4H2jfykO3G2caY+I6OMZqcGoTHSV3dYzxIRWbzDsHQ4ecSGmql/AKbc3/EUin4JfOhlvS
	g1YJ+psVGrkrOcvuQfRAYjkXLGFPlRl7EdAeRJ4GKEQF0r3cGs2gXGPo8jq1XpvNPgNN2rNVvWk
	56SJTeOsByG8sOZi4iQa0GoJde+1B/oN41qO/dp/Uh4QCXL/PJUuwISIs0obR6790WIXVzNBuaa
	5aGXAUsyHAyckSGXvI2okye0iVeUph7IZcksWr/N2v9/MId6kYjzvuemKtqaUgiUM+MD7L5w9ft
	0W1NnEFVvX1hC27ZJsR9mQPMr02Xbj+AYjhs8aO+SDSNrohWmXpHdjqjrFvH/EkAQH5vze+bqnb
	dwM4PE2hjzH93ZkCriThKwhbAzgW6IjxmiycQCI5bam0bQ/TC0tahEvJzf0WaSMYeqoJmsGXjTi
	MtVRidd9x1fMWvVSnPgIJ/WnP7fg3ZLYrH6IbrDuJsNeH0ZLq9cc1BZxMLTIN938/jprYh
X-Received: by 2002:a17:903:2f91:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2edf6d2417cmr6462905ad.15.1794514916908;
        Thu, 12 Nov 2026 12:21:56 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1889960sm227016a12.15.2026.11.12.12.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:21:55 -0800 (PST)
Date: Thu, 12 Nov 2026 20:21:51 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust_binder: reject sync transaction with pending
 sync work
Message-ID: <avYf351-Z3Q2Cd9-@google.com>
References: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>

On Wed, Nov 11, 2026 at 05:23:24PM +0000, Chris Wiseman wrote:
> When a thread replies to a transaction with TF_DEFER_COMPLETE, its
> BR_TRANSACTION_COMPLETE work item stays in inner.work_list while the
> next blocking read waits in Process.ready_threads. A new incoming
> synchronous transaction can then be queued behind that deferred
> completion in inner.work_list. If the thread's read buffer only has
> room for the deferred completion, the ioctl returns to userspace with
> inner.current_transaction cleared while the incoming synchronous
> transaction remains queued in inner.work_list.
> 
> If that thread sends an outgoing synchronous BC_TRANSACTION before
> draining its work queue, Thread::transaction_inner sets
> inner.current_transaction to Some(t_out), and the read phase of the
> same BINDER_WRITE_READ ioctl pops the pending incoming transaction and
> overwrites inner.current_transaction with Some(t_in). This orphans
> t_out from the sender's transaction stack so
> Thread::unwind_transaction_stack aborts on exit, leaving a permanent
> Arc<Thread> <-> DArc<Transaction> reference cycle that pins both
> Arc<Process> instances and their mapped ShrinkablePageRange pages
> after the processes exit.
> 
> Resolve the TODO in Thread::transaction_inner by rejecting outgoing
> synchronous transactions with EINVAL in Thread::top_of_transaction_stack
> when inner.work_list contains any item where
> DeliverToRead::should_sync_wakeup() is true. Checking
> should_sync_wakeup() in top_of_transaction_stack() fails fast before
> Transaction::new() allocates the target buffer or translates flat
> binder objects, and ignores non-transaction work items in
> inner.work_list.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
> Cc: stable@vger.kernel.org
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---

Aside from the "patch threading" issue, this LGTM. Thanks!

Acked-by: Carlos Llamas <cmllamas@google.com>
