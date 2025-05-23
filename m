Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3599224B06
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 05:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978278; cv=none; b=jBnmmvWm97aQB7wPEe7K8InVhuYdkLSc+rpg+Dpw30V5AEgS2fd9D6KIojlHmUIC6Xe+L7rxf+qmXaj7XnyAcQSereCFMgJFj+s770HhxO5elZ8ajQSjKHTUYVILp6cEqNDf2yF0FElcnPr48Wgtmw7tsBCHK8Y1rZo3Nc2TiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978278; c=relaxed/simple;
	bh=uG4QPZVjl5gDK86VnIwXxVnXWRkca87HCRZHSL9+/F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RM/u5RjXCJv9VgHyVUfL/lAnoBSgYTxudY8svDXUhI7Ll5stok4Xfd0PkR2vkofYqMa4MtoKKTfW9iJoAwlUsFrVWEngN62wFbGkjNbolDZkLmyBsyc12HJKIcRUeQvLRfxfpEjS8CzWGHOXu/FN66e8tQ9k/0kfVP9WX/CWv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0PabruU1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0PabruU1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c46611b6so7379643b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978276; x=1748583076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=0PabruU1pEq63JcyrIU/ZBCMwBcbYt8MmoKoYLZphhFPYTPDBk6j4eHxvi3TNKs+yn
         YnqenTl43cPKcTAodEZLwKVoAUvBQDQE8TrOqmgpcpxttghREZV/5+k7wVyOTTrTR+mr
         Hg3Nw59+Crd3t+PV4dpgz49nsyld+axHAhrtwI7CcD4dOahegJzBaeIz+tyv+J+QbwRO
         9qYGjs9lI7Y4Hn02dUP6BpN8UnA0qdk8t3hC/UFWNMdu7LTBhxqoEhazGhc6fI8tyLec
         fE0AKWvc9pGtS1IinSnI7NfNhtOycwg5Nby35IPae1JpBTaN6JZsbJHneu7cdE/+Thm2
         9H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978276; x=1748583076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=DMGS8ucfqJsSlgvA0vXw+dk3KrffE5XaUN6iW53uejV26sJx4ofweVmMvuS0rpjyD6
         3nFUvrjEMjyFwbfTbTKtVmIQWrjqwoc1JUBHxRJAQ8sOB71R++Qo4YAwsz/COE480+wb
         DmHlcN1ckusveX8dur4gFQwbkaQpLt9kRcS/jpaQj9Xw3BHBh6C6B5Hg6WgdaAwpPUja
         ojb0BNCYqMAmtajd+NDVUt1KqIbzDPHFWcpg/UEqYf5DxNkNCIhKf9nh7QQfjk3HXhDN
         s99efs3T1FWUpcGXlm/ALxiX4//OasgNY9hLRbDCNzdvOkpd7f7mi2qDPrgfrZGNcJ/B
         B2aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXehE6W8pUD/SHZsKLCfyq+B9EYuPcen9xkvP759CVmRgGCFgRT8wFi3OYTKo8PRg2CfuQQFCpx+WvY+AcXAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYJ0RNF/qtI1LjQLf68MfzFC8vzaRlKDxq9A+8ch/CQYWX89b
	T/xdROfK4RJ4Sb/IVhBXOsqhL7mrOVYjPagy7NhUusVEnP0uadQEMb2MWzYw8KPz6E8=
X-Gm-Gg: ASbGncvDSV1oHgiL1U5kxlQc1wL+dF1ld4cs7o3Cxn/aq6C3njfG6y5oxQojTl9KZiN
	SyLL9Z/4/sgagK7G66+5hPaCk8VRRUcelKiXRP3sC+vYFjL2qoQevhRc5vD989o+3LzY57mzWCi
	ufDBLzX/ZWUazccB6dueAqDEaTMVRTx304fXcvGbfJxEsncN/dvwTHWRNgV0b89EQxTMXG8oOW/
	tyXt34GsBLgG+ZVe7buiB7cu5rlPHDO8iRpL7dAILhiuVQle7DC2+7q90xOmysanVFn5SIRZI0V
	0IiOThI7jQhG1dgyK9wAIQhosrxslPHvgvlTlU7hU4yd3Lcg1uT3s/Fd6HJlQg==
X-Google-Smtp-Source: AGHT+IHuvJwexFOpqMWZgmqCHklA7GJFd11ULqc5C7xPX4e1BtVUWPbvc7kB7Fax2t5Kt7WHcMzvcQ==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr36423560b3a.23.1747978276169;
        Thu, 22 May 2025 22:31:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:04 -0700
Subject: [PATCH v16 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-v5_user_cfi_series-v16-1-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b7f13f087954..3487f28fa0bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0

