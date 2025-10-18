Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D22FB61F
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809567; cv=none; b=Hi7AQXoX/EJBIvPGpFS7t7NYf+flv1CmdouAjA94X2Zg7N52mtAT5gpQ2IPeYK9Q5hQG2pcyHBFHyUFNBA0dsUlJN2dZGDH9xMzYl4RchTXZrUxPItID1ROsZbpvFVH+95/bxS7NeS2BGP8xc3Yv6M7K3XLow+pOJ/ztI6dvAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809567; c=relaxed/simple;
	bh=uLnXUd5iHMMEJTAMJKY0bsxZkX3e5rGAkuIO16n9SP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUq0YksZRuDoTNRureVWQM8g47RMQ0/pNrBOkn7Hz9hSgssjXt6qpNkVPma9+JpGACn9PxqJIsL/emUjH3fBdmfF3XmtpWqYNISOWjibFQEzSkYRH+A1vOIOeFWjBotnZ6bA8qWq60C+/QkDcGeI894uORbKlFgExzfFTubLWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kszrL3uT; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kszrL3uT"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-88f2aebce7fso450798685a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809564; x=1761414364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ycwx31K2mxLEujn4A81pZPUGOjv1ArmgOKcrq9XGsoU=;
        b=kszrL3uT2MycGYw/EJTSEoDBJOl51QsY1HRZBnoMS5rNQfrtHy8rFuVx4EYAQ3WWWb
         8/px861NEGq6zOBuMYIL7mCT4C6REeyknaRu/Ti4jVIqDau0raZ1hTYmks3cd5IO3u8X
         W2nIO954gLVt5PRBOPOx2xOkJumsZj1V5WLUMkGjUTfGypfSSVdZjCliHNgwP7qj63lq
         PhWHrNSjPXBLKZ1sHMsTi/jkD1tMJZhdDehO9L2Y5H588zeEkEarA1jYQYfCkzdp1Vqf
         8t59nYddG86FkXkY950HDvA7dQ0eIqrxhxw0B0DFVLxnjOkfsaQXLldBteNcXA5tJZdD
         ieJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809564; x=1761414364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ycwx31K2mxLEujn4A81pZPUGOjv1ArmgOKcrq9XGsoU=;
        b=MWgZLhtQXZ9wcsjm30ShKnIckFi5GuJm8H+1gUszBkvLcZ4Z1ZaGjXwfHnRsTUQU5H
         YXKXBvVCUwzpEEyFg1Idl5XeXZjCGZ8fdTurCA/z4VBIH2pFYiUhVeEjW2r1TZbZnzAU
         zxx//ayAZPePWBeb8PUTEfMKcoLtcrGK9JJ41MYI77XYoY4bPi2heYGAPBZlTIQn2uH3
         yEeKQ7C9Q0haljZuTwQMPFrFFG52MJbd5EyCXFTK+VUcbd6w5KFw/Cn5KapPopk5zBye
         L0RSrDVYuUlv1KiKUYZrMtg8lv6WG6YwSxH/OA2kx2Yq5jRc154dpHM1rZfRzAV5KzzN
         galg==
X-Gm-Message-State: AOJu0Yy7vROOavqqbi31DEFFzFauhG9hzl1qfI3nZ3AvMvv7bZEJoPxv
	WXLBExzfKDJwpGKxnZQyExtXrHwEdxzpl1KiHXx2YOCEojBzt5kohKJ5
X-Gm-Gg: ASbGnctSeC0khUl0gOBFfHJqCavJjj0nK4DjglqDkY1gzLKE0Uf2hGeg2tws8MvLKua
	qYZq8keVKQjmhAaCLJY8dkjxG5SUHEiIS8c5R98Ap8QGqpoHhIWRVhqVuKWPlVWzPgTAHSPYXYM
	EgbCw6OYZXciMBe3GFzceFZTMPQ4wBwhQr+8ooK1w3hwFAf/OSxIVK6zvwdxLmkf0BMJrpc9TFQ
	1QoXmB1PjvXd6wI5Ujz9j3I6FGFQoNmmBTmP7n2GJ5E002iVOVKNMJ4UfFRqHtt5QSeKD9/tAkX
	lTSXkP3lvzWRdyECK5PMIBpgzyjQ04AFY2M7VshYTM3GwqWA5U/i2VHkcjPa7eky9ivQq4WUune
	y877hmpr0po5X+eZR3k5b9RxnyMSxK//19kiM4RMA2oMCKR2WAYKPLJkUOlot8G6LXde6YGa/2U
	oM4kBoajak1uGZiPkammof88XfdG3EHOk+IZc5TR9xHg4rwvg44f5Jtfbm1kpNM3rArubNdtYKK
	qAcq4ndpsJaz4XMwkexVHNS8nBxYa9LgbG+wQ6eXgI97laO3FS9JCrw8NMUtB6b72f7ZkNaEA==
X-Google-Smtp-Source: AGHT+IGG7z7f3MNU21/Rti4PmtrZca4GFxKfblibRIkboUBwmpGvzYHP42u9XCSh6vTqFJ+cvotYfQ==
X-Received: by 2002:ac8:5910:0:b0:4e8:9596:ee77 with SMTP id d75a77b69052e-4e89d1eca83mr102709391cf.10.1760809563421;
        Sat, 18 Oct 2025 10:46:03 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:46:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:20 -0400
Subject: [PATCH v18 09/16] rust: remove spurious `use core::fmt::Debug`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-9-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=668;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=uLnXUd5iHMMEJTAMJKY0bsxZkX3e5rGAkuIO16n9SP8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGXXqQt9RHGxpoBFZLlXeLUPAugoqd/q2N96Ig7iFhgm9rnqX6mshM+HDXmtIVBN7F9GI6CbJIb
 k7xYI3LBrrwQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

We want folks to use `kernel::fmt` but this is only used for `derive` so
can be removed entirely.

This backslid in commit ea60cea07d8c ("rust: add `Alignment` type").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/ptr.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 2e5e2a090480..e3893ed04049 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,6 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::fmt::Debug;
 use core::mem::align_of;
 use core::num::NonZero;
 

-- 
2.51.1

