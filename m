Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DC18B15
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 15:28:55 +0000 (UTC)
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019542716
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 08:28:40 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-987e47d2e81so76392366b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689866918; x=1690471718;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IWv9CLtWtTznOku5eHmfJC2LsM6xPb33sZCLyzCmpPY=;
        b=c1JgmH+tNZLWMbTCSosM+iUVmcQSKnrVa80UTDLEeP9RITnb103bfyCMD8vc/lrM8u
         rY8MgTzI/P9CbtUQ2K0sOFQUHS9dh7r2J+vsYz33TKkgfNGDR4z8kfUnTFTsZTPpX2VQ
         9T8wonC5Rcnr7VEQzRZKGi3yjjpOlzaMV3TicsPfoOOnuSjoQE2h0gBe6vtwHWmELenj
         DWhnODkj6bF24upvhB7OsZU/y+sk1JWZdzY4vs+pYwItk0t+kii4mJ+oxxT/VOK+bLYG
         Q3VKxY2KMgjSRJDs37zhwH8FL0+glfOM/Z3T5VALtt6KUhECeTXa2cY6q/tyv7Jw+g8D
         NWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689866918; x=1690471718;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWv9CLtWtTznOku5eHmfJC2LsM6xPb33sZCLyzCmpPY=;
        b=i29RVUWKtzrG4rbSqUHDzmYZwiu8jTtPjk2aqLCAqu4DtdJwvYZ3Idy3ooI9DG47Fj
         eYXDsZwcnmpe2JGJ92S316wGB/CQJ1CD7oh7qJO6qv++Iwf94Wiv0Zxjq/MqJG3bGJij
         KePLgrW+j622mDjEiGjWja0ai9vHkUcqmlOtFmz4YMo8apfpPb8+VnsGhlmp75K7OUi9
         REFlHlF3FwHCuzfFH0z+tNPRWsiX9fixLTdFLNERlMJwpaPJNB+oauBBzwflKQwjpZAi
         K4pQC/4Hc6haWF+ldCzQXoM/mbJS+sh5+KsALt6wy6OlKv0E0o2yT0Lx/nnMBK3XrgiL
         J9cw==
X-Gm-Message-State: ABy/qLYySAiypMVMe9Kw+3hTkqyT5hqokkwChbIt7DuP6JYFOSRxWI6i
	myZMCFH2ybeFm3iwNC9xfmEOdObZvs6PKECKn01SaW8zS0P0dZJDH36jruhCdgf+aixlMQgKBCX
	cRhgZtX7AL0lRTKfJoStzriorqdttVanrWI91yoKmdashQlKKrw0RXvI3gCh+1vsF7s7V9gARRG
	gxEQ+/
X-Google-Smtp-Source: APBJJlEE/YmhmLOm4Cd/eTebUZ59Cs4ErdANqkMNW39DQ5rwt41f7azTnmHcpd4tPQ6pTIci1P5DT3t0P2tGkHU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:8a62:b0:98e:78ce:2979 with SMTP
 id hy2-20020a1709068a6200b0098e78ce2979mr13545ejc.12.1689866918147; Thu, 20
 Jul 2023 08:28:38 -0700 (PDT)
Date: Thu, 20 Jul 2023 15:28:15 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720152820.3566078-1-aliceryhl@google.com>
Subject: [RFC PATCH v1 0/5] Various Rust bindings for files
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This contains bindings for various file related things that binder needs
to use.

I would especially like feedback on the SAFETY comments. Particularly,
the safety comments in patch 4 and 5 are non-trivial. For example:

 * In patch 4, I claim that passing POLLHUP|POLLFREE to __wake_up is
   enough to ensure that we can now destroy the wait_list without
   risking any use-after-frees, even if we have registered it with
   epoll. Is that correct?

 * In patch 5, I implement a utility for closing fds that might be held
   using `fdget`. This is rather non-trivial, and I would be happy to
   hear suggestions about alternate solutions.

This patch is based on top of
https://lore.kernel.org/all/20230426204923.16195-1-amiculas@cisco.com/
which is currently the top commit on rust-next.

Alice Ryhl (2):
  rust: file: add bindings for `poll_table`
  rust: file: add `DeferredFdCloser`

Wedson Almeida Filho (3):
  rust: file: add bindings for `struct file`
  rust: cred: add Rust bindings for `struct cred`
  rust: file: add `FileDescriptorReservation`

 rust/bindings/bindings_helper.h |   8 +
 rust/bindings/lib.rs            |   1 +
 rust/helpers.c                  |  36 ++++
 rust/kernel/cred.rs             |  66 +++++++
 rust/kernel/file.rs             | 331 ++++++++++++++++++++++++++++++++
 rust/kernel/file/poll_table.rs  |  93 +++++++++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/sync/condvar.rs     |   2 +-
 8 files changed, 538 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/cred.rs
 create mode 100644 rust/kernel/file.rs
 create mode 100644 rust/kernel/file/poll_table.rs


base-commit: 341faf2b45ba266d52c1ca886c4ffca52d666786
-- 
2.41.0.255.g8b1d071c50-goog

