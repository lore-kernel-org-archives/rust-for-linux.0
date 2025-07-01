Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5026B740
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367484; cv=none; b=IuXCepnW9kKqhLN7qKSlmiax+XWRCdegB7O4vVpt36uHpT79Mq0hNXsZMqxRbprsMY4fJq81nuXmOYQFL+Y27b43n0vnSUd0uIUX4ITSREoycGO5x0y09uOHTp3G4EqnbQFGBB+U9psRiCylv7I71q1JYQDphMGjVGRxnV5GAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367484; c=relaxed/simple;
	bh=69skJtRKFUn7zDpOwVUIh2uP80P8co6NUJyIRIhpXI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rnDSIFrNj6947/NF6Z69HxwavNwpX9q1T0eyDTl+tMDecGdFtWNM6Hzm3nyvF0+6vQNetm2cc/qG1C3OlDQX2+ezkqznnafowTMP9u4jvIpPqRPa/w0clbKIu8HRsuaUTOGBVNdG0tNf95scwuspkOzU+XD0Zb+hhisqJ/lEs04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNC++AjB; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNC++AjB"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so1995829f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751367481; x=1751972281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4pmXumBMClvdmoqj3ckb+e8tnZlkJ8riF+IbGt1/2Y=;
        b=gNC++AjBDRTU8vWbHK1bvP+9xNR1MBDe+6oLJmUXyPTL+olnvdTxDAb1TAxU5OgG1/
         zDKELBL2UasyHzJsgsX9BqRMSIxPHxgxKYAjynYVylw2dG4GPRvHs7itffd2DnhjpjCp
         QFoBpD1iB9pkFPXQQ5dtLxYKfN5Do66Y8cTaWfuP0ZaA2sIsVbeyZqpH95in0NvbYbYz
         oNazhGc33pFYQuxp9CHLPjb/+FCCqJ9K6ErpxHyHAGKeyeGd/mG5im6RlBBknb3iRNfE
         4Vsn7L4FA4eMQ5LjbUEBgeUCG8BZ4gW0sP5NBUAe6EdLyf0Vvps0xXl9bByfym5eCepf
         mSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367481; x=1751972281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4pmXumBMClvdmoqj3ckb+e8tnZlkJ8riF+IbGt1/2Y=;
        b=k99LS6067/RwQlzheD1BVZlT7/6KAF7PnIlNiE5B232/541/rrQ8uDwTS95H2uwcwK
         C2ra00BpZnDvK89ZCYOYRTgkfNAHAHtBncg4+GduVz5thZrs6cdM5xPd/Gs4I8ayaWd8
         /zy705hf7YQSra/S1lHmLuqRbjrp644FtIWeVAg8CCioHdo85ZxG3R33nHWQgRLyM0oC
         prNINEgO+Gg2SmajLhAiy2bc0Siwd/jef8QC36CllppWYwlFnB11DlGXUqrUgAA2hxPe
         l7qyXOjdGl7OSDiSKHYprPDq6W1Cs6NV43sOvku+i4/8k8Jv0eW0Xrl/GFpDQ9vlvcWJ
         TDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWffmHzR+U9z6tUKmM0w7G3+L+SbkkCZpo4/3PUtejfYQlV1bV8YEjVcDUHa5XuXkP0VbPc37BISCrIvCOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjk436LM0SakAKkK2RBu5uDUrVZRa6guqgfx12EOKOlpALFh/s
	Cl+aiRDD+pw3WqLnE093OU3MbQ0eb34ps6ndYpX//2iBcY1IKBMiAOUJtXmNba/iH264vemOsUx
	gXADSODr6uUOnlLeAnA==
X-Google-Smtp-Source: AGHT+IHVJRVexX67i++8eKSxECLv2YKxZWXGbP3lemNbo7XVNq6X7mdBDqKPr9CZGLFA4uVb+aCZ/DJFXDtvSzw=
X-Received: from wmth7.prod.google.com ([2002:a05:600c:8b67:b0:453:910:1a18])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2905:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a8fda34e30mr15196967f8f.25.1751367480898;
 Tue, 01 Jul 2025 03:58:00 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:57:59 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Message-ID: <aGO_N9fjmUGZ5JVx@google.com>
Subject: Re: [PATCH v8 0/6] rust: DebugFS Bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 27, 2025 at 11:18:23PM +0000, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> module using them.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Looks good to me!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
