Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373AF17D346
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212237; cv=none; b=QiMHDhwKGYFJEuvPCYTh0ia9QpDwRRO9QRWaIL20jMkogsrrhsUTE083szQ2vPH6FVleywIJo9CaDl4I3H4+6U/mzhrH29pnSKX3yf7Q3AB4DG2/FsVP/rvzeWXN3vHe6LyvYVe6PHbKSZfVj1Kl5RaeesE6wzpF6kStTCFdBMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212237; c=relaxed/simple;
	bh=wxYjwn6DRYOkolxFxDXG6g7xBccE3ZpSCTn+6Z6p6gk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hyjG3f55iYiXLwkCCBPh46vdum4zQxT53N4cLyGtb74vt8LkwzMk+YXH/e6DF9oQf3nIoOOC5mRBup8daJB2qNuLxBwHgKeUc4yc9gZqxre7IX7ie8p7NHN3i0wWxcUYyZhuTuU6st7oSQZljNbiK5LM9VjPsx5ta9d+4il8AjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vr1zmWCU; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vr1zmWCU"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39134c762ebso1844845f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742212234; x=1742817034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yora9r7GqNMXJz4qruVfVMe2J3vmNbYyhm3BsuHErkk=;
        b=Vr1zmWCUL8dnkYqojaLoHO1Mtmybzdvvt/y4acij5Q+9oxfqypMe7BSHAmHBAhbjAz
         VxLDVAM59QNTP6RdbtY78EhxxqRrTZlxV6LhgBPDp9p+7zvkHlr+UoVCUlnujPvHPpVO
         OT3GGEGLiJ85lhLn/P86O8Jn5A0anEIigiQ2Twn/2Ug58cVpL4HSR+nssxeilyNSUSA/
         fr6+fSrSPVSHamDkExFYa9IcI+sKrt/KmrS67vJUIuJ0a/wz/j4B+9z+1lRH6neflX0Q
         Gr6PSCk6DlaR0ooIk+4vd5iX0qF8MIjDjJabjTkefzBVZE8y3GuWjwotHU6DdFGc7A+L
         3nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212234; x=1742817034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yora9r7GqNMXJz4qruVfVMe2J3vmNbYyhm3BsuHErkk=;
        b=jn9QJTV+Rk6M1l5ozLSTXTp1/YI+G5QzfhMt2sYMbcGCuXab75Yvjr2CqdxBnb1fxP
         oDVNR1S8tOSuggip6zKV0K38voM+f1fJHPDNJCQ4KnznAwC4kBHZvS+da8pYpNIAHNtS
         BkMNxmsOgNyVoNncSIcROdsE0hFpbgXoL24U/pI9OwccR1ndQ99GSP3uyEjqrjX9J2yd
         wFlW2Ydn36phVGsDuIJ952zxrOg4SWf9vc9ngSflmXkb3RHaVNFlj3ibFfHVwoLKFraX
         eS2jdCViOKfvMVhTNQBzUfGSif0oRwXL65NIg49NEF9QqE5ny2OtpQHC2uf0uAXxzkuM
         RM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUb40+qGdGW+Op+2PEobX3aVdZvsfk6cM7xFnvThDRJ8PMgZjxc935trxL3UOcF8KYS/ynWydsmfZtqDM3xGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyElPH23ecyaxagRHUQ4spKxfvo45pkBL6Z+x1TNIOQMVwrZ2OQ
	nl4LYZqQeDU45G68f46uR7YM7kwvlL9uo8Dw+vjQ3BW5eVxfO2QA9IjOMrbu+XCn6cqN3NvKaXA
	C9tt4sA6YU/tWlw==
X-Google-Smtp-Source: AGHT+IFKjTeAmsWBQpKkSwcUD6HfgVj7Ev02PQ4lhn8BiMoj6uFAiIFlZyATucSEtMOLba9qZR5gSUHB/HbnGrQ=
X-Received: from wmbbe9.prod.google.com ([2002:a05:600c:1e89:b0:43d:b71:a576])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5986:0:b0:391:43cb:43e6 with SMTP id ffacd0b85a97d-3971ffb423fmr14275204f8f.51.1742212234618;
 Mon, 17 Mar 2025 04:50:34 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:50:32 +0000
In-Reply-To: <20250317-vec-push-use-spare-v1-1-7e025ef4ae14@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317-vec-push-use-spare-v1-1-7e025ef4ae14@gmail.com>
Message-ID: <Z9gMiNEWGt7R4NA9@google.com>
Subject: Re: [PATCH] rust: alloc: use `spare_capacity_mut` to reduce unsafe
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 17, 2025 at 07:42:28AM -0400, Tamir Duberstein wrote:
> Use `spare_capacity_mut` in the implementation of `push` to reduce the
> use of `unsafe`. Both methods were added in commit 2aac4cd7dae3 ("rust:
> alloc: implement kernel `Vec` type").
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Looks reasonable enough.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
