Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C034D384
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777307922; cv=none; b=V1/2xOrIzE3d4S3hrr6E7Rz4/MfVqzEZTJVdiLOAr9ZV5vmcrdQbhcg3pQPBrC8rjzhpI8twcNL22ua1UWbqbF6dNkNQ5vbbTttz1+F55UMgcz9MqC4oSD31sgLfHPaEv0daRFuvddkHTkKqwYZpwokJFDn3vTW+3zwJUEfHHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777307922; c=relaxed/simple;
	bh=pEuRsdljZmjc+RoYwAvseZ3l4VB48jTAMQ3fA6OmMhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9VYofUTVBDQqF8Dy5dULFMk8rswR2svXOOmPjHiWlV3MmhmSt6xzy5RS1hsa7U3Lu1AtLe/xTGD8A7b0ZyvnoYbDTBD6dFhDllIctjmd0YNDndR9Py5zaVXX8CO1o+5em/IPx3+A87OaUj/o15ENOSo4vQbdUWDo1TlOGlgoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7dG4nPH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7dG4nPH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso1965ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777307921; x=1777912721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mou5LEOoziZ5hu0rzC5dRRjLgyBf9T8pKLIONhy+oAU=;
        b=o7dG4nPH2NTCgJrsN0eLVVIMBEqDRVdopVdPshr7a6EynziulCzAKtSitXboMkt918
         VA7Pv2RvunqcI9yRtQM3Z9Wu0efWj94qJ1kpwN/lNjrtCF29lkKS6bAwPpPk6xlkNh6/
         K/z0H2/yNKaj2MrSx6Spl1+1oELx5fcvvQGRp3806xYX6dT2MnRHi52lACMBw53YeeL3
         Bozm6ZgiOEUFliqchxvffovBCC3zMKpEYmqhNFRuFmh3M8qtdy9TxG5q18+TA3UfRzEH
         WxpozvlLLZlZA3kaNPqUR/Am/8nHrFBrPhVVn4iRPgJPUHfQS47DS/EsAHpna3l6/uw3
         YA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777307921; x=1777912721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mou5LEOoziZ5hu0rzC5dRRjLgyBf9T8pKLIONhy+oAU=;
        b=TyQLsI3Zo6tCd0JNsMhw4XV6LOjhyS7MIwbO5R2EM7LwnjjWuCzuHmrwpLt8a41JlG
         uHkflkyf2AkkzZtSunM70nFiHAz+FCPomsYPaeMpFF5K9y4ZpfqPn4PSr79CtNATGm/n
         RE4jX+hir2NFJvVZQiiyx7ZOiyf4x4M4oDjJyzgXUk5ppyQfhfToe9HY5waf/jHAdFmP
         ze5GnLA4XBtNO/I+fJ/H6CdHuF/QgRn4eI26lw7dJv7gBxXkAuT4JpviHXHoxCyKREhq
         k+k7B/r9uDPnuy5W+a4ieu94xPO6ExDAVlIThMUYejmvWXJV7p29AZf6FBDMB3maYco6
         BHRw==
X-Forwarded-Encrypted: i=1; AFNElJ9lQSlMWLEPW/y2eDDIp/UlUUuf6XPHISXYOO1IF/VmshMTg3lQipoH/WLCgIoKkhrragMAOUqILASA0Y6ovg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxssDln5SjBOQ87IZfGg4GeCOXa4ptSbfGKZGFpMc9lPzarhkB+
	9okp1zxU3z7iPxTXbVFfeCPh7OtIxDNdy33drS5UI2AcBrX8STzijM9OQwvo6y/Lbw==
X-Gm-Gg: AeBDievXUjrS71nMToOab7HID72ciJWowfJknaNmyg5TMBe9kmiN0eX1gNDuHzlA1/E
	iW6VSyCbHT4NCYKOGTStwUyVx9CQ+rdqXZ2lgjpQ4L20vGaxpl5sigbooyYp5K5Sif64npR0UZS
	z8LH3GQ/+Vq0BsRqMgTkemo1O9qN2W1kQxsNTtf81xF1lDp3AFtFE7QxkCbwJduevESgXVfi1TX
	MTBqatKUVABkCX9rDIn/givPqn4Rjc/b/x1PGBy/cFZtNFhrae+77nLhzouB2EXgYw82ARCGEL2
	7Jz+owy69Wi2Fw/wE2GtDxOXYVzZTPwOutpUO+ZHmVJWSWgdz01Z8l1/3koRm580eqRZSnLkvu1
	bljzlRdAEM4npGPGE9fplDQMB77Yvlcv/NhR5RjGwJzw6dRAxRF29LJ4bJNEcW/A01aGykwdICe
	7PaAp+CRNfHydqPZCrIAgkioFCospigSuxx5BUdxqYHum4ZkZZfVdchccwf1iYexfTZ+NKrSJiN
	wT3nMOutNkn12OPfyVo6hJvnaB36Ue21AYjwHvG1hz7Y88+HoElqms9kAHDjLF9HjF1PeSFTLYT
	Cw==
X-Received: by 2002:a17:903:c05:b0:2b4:6529:7bae with SMTP id d9443c01a7336-2b97a4e7ca7mr109235ad.17.1777307920150;
        Mon, 27 Apr 2026 09:38:40 -0700 (PDT)
Received: from google.com (210.53.125.34.bc.googleusercontent.com. [34.125.53.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3f8asm34437785b3a.36.2026.04.27.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:38:38 -0700 (PDT)
Date: Mon, 27 Apr 2026 16:38:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: avoid calling pending_oneway_finished() on
 TF_UPDATE_TXN
Message-ID: <ae-RCudmZw2NFDba@google.com>
References: <20260414-tf-update-txn-fix-v1-1-d2b83303acc9@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-tf-update-txn-fix-v1-1-d2b83303acc9@google.com>

On Tue, Apr 14, 2026 at 12:02:34PM +0000, Alice Ryhl wrote:
> When an outdated transaction is removed from `oneway_todo` due to
> `TF_UPDATE_TXN`, its `Allocation` is dropped. The current implementation
> of `Allocation::drop` calls `pending_oneway_finished()`, assuming the
> transaction was executed. This leads to premature execution of the next
> queued one-way transaction.
> 
> Fix this by taking the `oneway_node` from the `Allocation` of the
> outdated transaction before it is dropped. This prevents
> `Allocation::drop` from signaling completion.
> 
> We do not call `take_oneway_node()` from `Transaction::cancel` because
> it's actually correct to call `pending_oneway_finished()` on cancel if
> the transaction did not come from `oneway_todo`. This ensures that if
> `BINDER_THREAD_EXIT` is invoked and cancels a oneway transaction, then
> the next transaction is taken from `oneway_todo`.
> 
> This bug does not lead to any issues in the kernel, but may lead to
> Binder delivering transactions to userspace earlier than userspace
> expected to receive them.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Assisted-by: Antigravity:gemini
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Acked-by: Carlos Llamas <cmllamas@google.com>
