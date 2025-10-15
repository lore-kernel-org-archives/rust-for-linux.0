Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342B305E1D
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556311; cv=none; b=JNgi0SKrrdVYBA3asF4yBk80kN7KuBit8jpR/CJSYbEKYpkIYcot3aP5rcCXX1erLMtT8Qjm2QezzKZue1pdmze+fiuMna/BXdjxMI2fTMP5Q87f4l2I4AdNE6p0kzc4sAWVB/av7VM/n/erR63uMRB6H0zS8D9MRdWnWrlxvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556311; c=relaxed/simple;
	bh=2D3oEpmQYcHuLZnWIpYHzvkvUja5YWzKptv7Pd2qprM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ibYATYy4WbJ+ASe8PDqodU4TIvxD3+4N10nFRSdq5kqofBT7Uhv3p4uFQdkkCFs6jgOjwz3VmIn44xdyaONtu4Pi+sIZ/wWSHOskHF+i+j9vvrBYqcCFxfyl9a+yEi8PDb2dOJf20QgV2UV2FWlizPWOsPxAitYD1SkUvqUompY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA0e42Ho; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA0e42Ho"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-88e68c0a7bfso186152485a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556308; x=1761161108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY/3IsdbfI0mC9DM0+1rrUO6mTTZQIEYJMq8pO85TCM=;
        b=cA0e42HoUfvW3gVGL6iILHQaTVyX/2HEor6DEKhjyaVcB7FRSv5qHA29OksEfPZqjS
         t7wxBGLxx8ApRZpqC5v1ILhA8EUiN84/+tYTfRCIyIPr8IfGo/63h5x2P/edOFmMYS8/
         DOOP49a1itunEXOlj78PLdKB2Gph4vdk9gmT2h3J5xmtwC9ga6OrGRNf/VCZeMf4rUtV
         lBO1IpexRrtiZLemfbk+Vods/Cq+LpvJFTJtIGTPVuONUhXgCq5pucfQ9ZBqjHklOUBL
         j9pbyGLmAVVWDd7lMM20z18ms32goqE2sMBByxyyuNXPuTGpygfAx0M2mgM9fH5JDkm2
         xCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556308; x=1761161108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eY/3IsdbfI0mC9DM0+1rrUO6mTTZQIEYJMq8pO85TCM=;
        b=eFpTGmcCbhLlr4HJAZRQCDGiwuhx8QabCUE2UkVi4JSabyHN5QvwEmhYzbQcZVELTl
         DlyOe8OpfaNmUfg5LfrrhpSXz4nYdpR3lhW1XIbeVJ/491ZJy7jhfH85vW4pzYIeV1Pp
         MK+ajxw7nRb9QbufRfBnEuIq+7E39MMXiIpHitIA2OmgKcIQc7bER2+gwh4eYO6P7Yj5
         P1egUMYELR7mHlZSj8OgoK4zIQ9LrxwoqofwdkUE49j0NcnwJu5ca6Pvr2JMKC7WTQx8
         w4F/IbmNCRAgMCWTbR/NQAM/iT8BkAszGwprhpaeRxXyTIyQ96DceOWLkhpEplY/1AjM
         iVnw==
X-Gm-Message-State: AOJu0YyZHr6LaZF0Lkl5LAqnd+1b89baikPNEQS5dF/Dc7GOWaHcC1rc
	4jWoR0qIhp8owNb7KGm88i80VJ6VaZEU339qQ1OoA+IrQ80H5ZWofbVZoTFkZdgx
X-Gm-Gg: ASbGncu1elz3/646dlbTBopFN4N04SsX4DR1q3v9YIb0mLY2cwY0mb906/cChCw1KA5
	tCzB+pFSa0Iw1Q+Czz2PWpV186tilOZqlg89X3BG3Ra3LMt0UV9gyLRmRfhELGAj/2nsyQCVevL
	dCf8APLvYull2sN3HG8dDKYzQgr7duXyZSuxWmvdwq7A1imP/dc9wIgZQmSbMe5b027OeSx+OMb
	vO+Nkb78UJK6NaiQIMj/7+Jhad1F0B0k1ld3e97zIXVbteNQUYQHQXuyIFeRZ8EwQBMND7+ifh3
	IlpI4xeRpLpD9ZDR6C3a7rz3BlND2JRXWyoEbxPpJpLZ+QmzNdrSddJ9ADpOHvG+x8lZyPxKEa+
	KVtfHu0i6VGGwbSOHRXm8YCNcbyCGL/0QrmT/duWY8vjlTq80oqrAIHubA4Q3FdzAKU7ahN9fwl
	9VZ9PI5a+Iom9brKyPzSnnP4qebYGxc/HewMzzM6BcngNTrxjatq51P56kaHsxQBmyAr6ZyrVsJ
	qTdiQKTJQQKUuWbTiKk53Sw9Llx
X-Google-Smtp-Source: AGHT+IF/CUBVvLt2dkQCDA5YZrHOn4tHGJzgB3mXHJTBxXrUXPaXJyBN4wC5HBKmPT8DqAH/ADgWzg==
X-Received: by 2002:ac8:7f8f:0:b0:4db:aeb0:b624 with SMTP id d75a77b69052e-4e6eaceb3e7mr380441741cf.30.1760556307886;
        Wed, 15 Oct 2025 12:25:07 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:34 -0400
Subject: [PATCH v17 04/11] rust_binder: use `core::ffi::CStr` method names
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-4-dc5e7aec870d@gmail.com>
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1790;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2D3oEpmQYcHuLZnWIpYHzvkvUja5YWzKptv7Pd2qprM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLuOpLGTfFQjBZXdio1nayh5dtiHoR1n54dLy3fgkauJkhueXEntNbGxy1JTge4mrx8nVKiNy+z
 1vw2Aya3HWws=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoiding methods that only exist on the latter.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/stats.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
index a83ec111d2cb..10c43679d5c3 100644
--- a/drivers/android/binder/stats.rs
+++ b/drivers/android/binder/stats.rs
@@ -72,7 +72,7 @@ pub(super) fn command_string(i: usize) -> &'static str {
         // SAFETY: Accessing `binder_command_strings` is always safe.
         let c_str_ptr = unsafe { binder_command_strings[i] };
         // SAFETY: The `binder_command_strings` array only contains nul-terminated strings.
-        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.as_bytes();
+        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.to_bytes();
         // SAFETY: The `binder_command_strings` array only contains strings with ascii-chars.
         unsafe { from_utf8_unchecked(bytes) }
     }
@@ -81,7 +81,7 @@ pub(super) fn return_string(i: usize) -> &'static str {
         // SAFETY: Accessing `binder_return_strings` is always safe.
         let c_str_ptr = unsafe { binder_return_strings[i] };
         // SAFETY: The `binder_command_strings` array only contains nul-terminated strings.
-        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.as_bytes();
+        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.to_bytes();
         // SAFETY: The `binder_command_strings` array only contains strings with ascii-chars.
         unsafe { from_utf8_unchecked(bytes) }
     }

-- 
2.51.0

