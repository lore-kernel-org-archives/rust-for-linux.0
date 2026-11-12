Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514989;
	b=Xs9LHGQWBw5Fh7xWJpgpWM+se8EKy1KxZ20eg0hRz2CMDHECrI6PE8qpCS20SU2V4c9o
	 Yy/8e16IhziWCNf+C1jPfma75MR0FlFAqnspeGSrZm/vw1NMb5VSxiFb7oj8BkaoGSki8
	 y1pCkqu0VI1WTOpCnskCF9Q7yxudwt+QHoVptC2FiimHdrnWazOeVb1/i/RdTAaN7xuVW
	 FdAMlaLVbGjblcDwf+rlzXrGKV8I6vY554hqdC5Z8qYa+xWT0D/MEJZcFVb3koqEh/E32
	 unePwc2cCtwEob2xiiVkIGQuUwrX7/5hsl77BQ0Rp+kNxGqxp9Au0LLV6+Ka39v9e7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oDkF+EHNknttvr/pyjYehgB7V21ORBFZrQ57TwACNvA=;
	b=ymPp8JPTWYtn/BfKuXMYvPlmPRpUOf6G6PEoGkFdqRptkwfN3yuA5qF+w5v0S6X7FvPX
	 F9o4jPRt3yrvrF05RSjcqtK/IakA0ssSTzLBtaVLMI3PyWLEyg07QvBbtkKPej0NZlMcV
	 eNvnWHrJr0RvepWLjsY/RwYWilmmtfdFQ4NG2uExj2RVuX2HTRycZXbwgp13lQwe67D/N
	 /a4zQrDhBhcA2x6L917t0ucKGPuyc5zgj2rTL3N/W5Mlm44yvgPARmZ49KxCGjz86+dBO
	 /7W98OPcAoHPC70h0nOhVOgn4M3fY32y/PP37Tm8C0AY1EVFaPZ4vAi/wK8X4I0rAAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VxOYMEa7;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7449C606A323
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 20:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7449C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VxOYMEa7
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so25205ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794514989; x=1795119789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oDkF+EHNknttvr/pyjYehgB7V21ORBFZrQ57TwACNvA=;
        b=VxOYMEa7WN5hU3s2AL0gTAK4CGvO8PTwMETyXLtJjhfb1RoqrwwSsIreAjmEhNNqHp
         mpHOwQsZ3SnU+oqT2m2FizVk/fAFNAsBVCXr3c1X4oL51td54ly5w5hv1/mfk6ZUhtlk
         3UHK97m66K71g61Mw8fYqxMI5ekb3IXKdjZwzbXdTI4FgqEocNXlVk2WAy4Rb478ZXX6
         GPqKBs5apfaDV5AyW+X5GEn9eztVMp1jdyrz8OZyYqiuSFB0b/Ti4RuhZsaKqg1LbR+H
         Gvt1Crpc5zalvK0/B6N8w5Jkr6CMkjWRuqtMxUyy571iVEhEEUkJ8u02iAzP21OyGiYm
         91dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794514989; x=1795119789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDkF+EHNknttvr/pyjYehgB7V21ORBFZrQ57TwACNvA=;
        b=H5s8MSwL+jm3UGjpZr67+QpL2Fpq9lmFJ0byFCPhrDmlpfnZz+XqL+J3sHn8ckP9tC
         W14yIsbZniG42GayH1fo7UyV/V4yrsB5rr+7sCHsLOaMCEx/MI6x1T5gHA21FJD0MCIk
         AjI95c7GdnCQDDGM/wbMi+pmZ2Mi3giTaek9p5lhErw0nl+HocBzD9n/KgCTjBuOH2Io
         DflRI4931jjPl/E8jDjrYtAoBpIw0ow0Xhfn8rk5kFTUq03HYoDc/7HPiImeTweOkLry
         fvw9iFLF9/bOQZsRHccaHn5ZanFFvwYKGeW5RqPFJ57a8ULnkc+q5EFRbdK8aOo5s2Py
         YZEw==
X-Forwarded-Encrypted: i=1; AL+hErFjXy/WiHNDPYaGFxbUCqEDYoL27KTGBaTVwX/pDI5Yjgpy0QuWdug9efkcvejVLvo79WxZASm4IXr74Zotqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/23xxoNRuGsxT/xBqDTQfV8z+PC9yowh4n5LUVwNPAMbamzyU1
	WjBsGTN2ru0wBtBWttpQoMs1RykW1OiTaxLzluyI3ep34bBlnQONCVi1LC7VaVFO/g==
X-Gm-Gg: AYBFou29yk7Sd38z4L2hnLYZjgc2We+3/UFAA7XO8LrFXuhgltqB0OKfPx1sgkYyfwR
	/01q8REnFbM36jPKReCEb5DBQwD6ZRgKLS2Xnc0zNNtKmKCEIzyZllM5Bobj66ew2cH9+yFd+nR
	a5pSVNo6BwMir7/nR63hfYa4eDBUyVTWflaeybmw21iZKbCJpEdJgjA6wLa6AYfCYnUz+QH9CT8
	2oanqcGOs6DBmicxGiakwXdFSfVvmVnmXq3jUhR9WJt5oL5qug6IlMGm5eq2MltSo9NyfFtv5+B
	Rv5Ei+rsTwdGr6+IJStgMIXNm6tg6iNTOVwxGIbgyNHyf91ZD8TMFdsl6WQrOi236/Okx+2HbD5
	+Y067XedEUpSoBdsO9wgO/ebzZaUuIzTwrHmM6WfxTY2wA/sY/kmORwf1kna9J+Ql63ZZNgksYS
	0jO++89jCYLOdCjUgabRWaKDF8rXoO0/GXpAcKYQVqxOX9sI3lZiLVxXbCwKdmK56a6GOLn/CM4
	g0I+9hvqV7A5b7SsohwKYWchvwAaWeH9A5s398zlhDrmDS1b3ILU87gXZl1Td0h1pl0ffmNewNi
	baWEa0BWihdzUhM+7NQdRszRWRUm95UYrzE/3BIxUoJz6vHiBRjdinNuvRwHsjV3dYrXCpZjPk9
	PoysjXA3LjTuwANXZO+KutzAHEGRpOiUCQhDPZwWD1RCv/ou27VLllouw5lRB6ubUaKALEFT2NC
	aWHuCJyUUdS+PqJnJtdbuQw5kBY+yeAxpvPq3sw0r1BcbeKWqzSqhQ0SPMzG8WA1nnKzzE
X-Received: by 2002:a17:902:ce02:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2ee0f0e1667mr1068475ad.1.1794514988112;
        Thu, 12 Nov 2026 12:23:08 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb18b73sm874147a91.3.2026.11.12.12.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:23:07 -0800 (PST)
Date: Thu, 12 Nov 2026 20:23:03 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust_binder: account for deferred work size in
 Thread::read()
Message-ID: <avYgJ8wIbY9-gFi-@google.com>
References: <>
 <18e70d7cbc2831c0.3137322e32332e3235332e313736.1920de.0000sendgmr@google.com>
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
In-Reply-To: <18e70d7cbc2831c0.3137322e32332e3235332e313736.1920de.0000sendgmr@google.com>

On Wed, Nov 11, 2026 at 05:23:24PM +0000, Chris Wiseman wrote:
> When a looper thread replies with TF_DEFER_COMPLETE, its 4-byte
> BR_TRANSACTION_COMPLETE work item is queued via push_work_deferred() in
> inner.work_list without setting inner.process_work_list. On the next
> blocking BINDER_WRITE_READ ioctl, inner.should_use_process_work_queue()
> returns true and Thread::read() checks only whether the remaining output
> buffer can fit a single transaction (4-byte command code plus
> size_of::<uapi::binder_transaction_data_secctx>()).
> 
> If userspace provides a read buffer with 76 bytes remaining after the
> initial 4-byte BR_NOOP placeholder (read_size = 80), Thread::read()
> calls Self::get_work(), sleeps in Process.ready_threads, and receives an
> incoming synchronous transaction queued behind the deferred
> BR_TRANSACTION_COMPLETE in inner.work_list. Iteration 1 of the loop
> writes the 4-byte BR_TRANSACTION_COMPLETE, reducing writer.len() to 72
> bytes, and iteration 2 exits the loop without delivering the incoming
> transaction, leaving it stranded in the thread-local work_list.
> 
> Add a size(&self) -> usize method to DeliverToRead returning the maximum
> number of bytes that do_work() may write to the user read buffer, and
> add InnerThread::pop_deferred_work() and Thread::pop_deferred_work() to
> drain deferred items from inner.work_list before entering the main work
> loop in Thread::read() when the remaining buffer is at least 76 bytes
> but cannot fit both the queued deferred items and an incoming
> transaction. If any deferred item writes bytes to the buffer, skip the
> main work loop and return the drained deferred items immediately without
> mutating inner.process_work_list or waiting for new work.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---

Aside from the "patch threading" issue, this LGTM. Thanks!

Acked-by: Carlos Llamas <cmllamas@google.com>
