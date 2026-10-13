Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFC535FB9
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 18:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917347; cv=none; b=uRkmdFoHuWiG+kXie4/ECndY3/LV4jiZMbMSCRb/CrwQo6d1ZvJqQZKG6MVDN/3qcqI2OCgJlpoGvuKjycmiUSqrhM/5RMOr82BLzkjxgJgUqIgcj7dDk/fmg2GibIywOyUQHCBUnH4h+0sRnFNhrxLiknUaNjp+bensAhDXWp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917347; c=relaxed/simple;
	bh=i0plRR5q+VpdvOcoOypsWjbKgNnmtWBW/nvqcvhutBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NE+gGuhay5hlND4YIBg+TZikAKHpju/7Hg8XkOvx/p4xBD7Ik1LCZ5SfCPdFXngZadKC6USmT/JVEXBrWXVqxxyfIDCIr2JxdTesBvRaAdM3ZFI0zNZGet0FB5+8yOe/ryJjbCZQo/TZ5PQLhrqy7fg1dF+DvGXV9Li+aPJ1c78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZb6aqWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZb6aqWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A94B1F000FF;
	Tue, 13 Oct 2026 18:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917310;
	bh=YffxUS9BS3b7Gj7sCeA9m8SKUjsbr5StwviB63TzUoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lZb6aqWUKM621Q0swkDvHJwvv4cjjh/ylOpdRCls9hZiJAWQd4LDUuTFQgp8eLdOG
	 7qlKuf+z5q7tjHqCaIpzDWxqLeoeMniVNiSiV2Ks4iGNuqLFAkn1+TtlDRKnu/3Hhz
	 /9F2/dTAyYJpt1DZ4RtvxkW9dA6kpwP3aUjYogXyFMAaHwbk09+4B9JPc48+3V+HTl
	 D6xcZWZMpaJEzaUJXOP2/lkCZqTv+yqSsJaeOj9Q0jaqI2Z+TDQbrRCumYTbxoXE/P
	 2+eyo9tHqzw5JUZjQDeZuYtCpzBxzYbOPJis/JCIfXI3luu9lWEyYX+0hBMQ71FRrD
	 jj8e7Q60gdu3w==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: [PATCH 2/2] rust: zerocopy: update to v0.8.62
Date: Tue, 13 Oct 2026 20:48:08 +0200
Message-ID: <20261013184809.35143-2-ojeda@kernel.org>
In-Reply-To: <20261013184809.35143-1-ojeda@kernel.org>
References: <20261013184809.35143-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.62.

This update advances 8 releases, with 3 of them carrying most of the
changes. It contains new features as well as fixes [1]. However, almost
nothing has changed that requires updates on our side: we only need to
move our non-ASCII change to the recently added `project.rs` file, and
to add an SPDX license identifier to the also new `invariant.rs` file
(I reported it to upstream [2]).

The following script may be used to check for the remaining differences:

    for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.62/zerocopy/zerocopy-derive/src/$path |
            git diff --no-index - rust/zerocopy-derive/$path &&
            echo $path: OK
    done

    for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.62/zerocopy/$path |
            git diff --no-index - rust/zerocopy/$path &&
            echo $path: OK
    done

Comparing the output above with the one for the latest update (v0.8.54)
shows no new differences on our side apart from the two mentioned above.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Link: https://github.com/google/zerocopy/releases [1]
Link: https://github.com/google/zerocopy/issues/3858 [2]
Assisted-by: LLM
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile                                 |    2 +-
 rust/zerocopy-derive/README.md                |   12 +-
 rust/zerocopy-derive/derive/from_bytes.rs     |   12 +
 rust/zerocopy-derive/derive/into_bytes.rs     |  147 +-
 rust/zerocopy-derive/derive/known_layout.rs   |    4 +-
 rust/zerocopy-derive/derive/mod.rs            |   33 +-
 rust/zerocopy-derive/derive/project.rs        |  569 +++
 rust/zerocopy-derive/derive/try_from_bytes.rs |  869 ++--
 rust/zerocopy-derive/invariant.rs             |  116 +
 rust/zerocopy-derive/lib.rs                   |  118 +-
 rust/zerocopy-derive/repr.rs                  |   46 +-
 rust/zerocopy-derive/util.rs                  |  414 +-
 rust/zerocopy/README.md                       |   12 +-
 .../benches/as_bytes_dynamic_size.x86-64      |    3 +-
 .../benches/as_bytes_dynamic_size.x86-64.mca  |   20 +-
 .../zerocopy/benches/extend_vec_zeroed.x86-64 |    4 +-
 .../benches/extend_vec_zeroed.x86-64.mca      |    8 +-
 .../zerocopy/benches/insert_vec_zeroed.x86-64 |    4 +-
 .../benches/insert_vec_zeroed.x86-64.mca      |    8 +-
 rust/zerocopy/benches/new_vec_zeroed.x86-64   |    3 +-
 .../benches/new_vec_zeroed.x86-64.mca         |   46 +-
 .../ref_from_bytes_dynamic_padding.x86-64     |   31 +-
 .../ref_from_bytes_dynamic_padding.x86-64.mca |   70 +-
 .../ref_from_bytes_dynamic_size.x86-64        |   21 +-
 .../ref_from_bytes_dynamic_size.x86-64.mca    |   58 +-
 .../benches/ref_from_bytes_static_size.x86-64 |    7 +-
 .../ref_from_bytes_static_size.x86-64.mca     |   26 +-
 .../ref_from_prefix_dynamic_padding.x86-64    |   24 +-
 ...ref_from_prefix_dynamic_padding.x86-64.mca |   62 +-
 .../ref_from_prefix_dynamic_size.x86-64       |   21 +-
 .../ref_from_prefix_dynamic_size.x86-64.mca   |   52 +-
 .../ref_from_suffix_dynamic_padding.x86-64    |   29 +-
 ...ref_from_suffix_dynamic_padding.x86-64.mca |   68 +-
 ...m_suffix_with_elems_dynamic_padding.x86-64 |   36 +-
 ...ffix_with_elems_dynamic_padding.x86-64.mca |   84 +-
 ...from_suffix_with_elems_dynamic_size.x86-64 |   31 +-
 ..._suffix_with_elems_dynamic_size.x86-64.mca |   70 +-
 .../benches/ref_type_bytes_dynamic_padding.rs |   19 +
 .../ref_type_bytes_dynamic_padding.x86-64     |    4 +
 .../ref_type_bytes_dynamic_padding.x86-64.mca |   45 +
 .../benches/ref_type_bytes_dynamic_size.rs    |   17 +
 .../ref_type_bytes_dynamic_size.x86-64        |    4 +
 .../ref_type_bytes_dynamic_size.x86-64.mca    |   45 +
 .../ref_type_bytes_mut_dynamic_padding.rs     |   19 +
 .../ref_type_bytes_mut_dynamic_padding.x86-64 |    4 +
 ..._type_bytes_mut_dynamic_padding.x86-64.mca |   45 +
 .../ref_type_bytes_mut_dynamic_size.rs        |   19 +
 .../ref_type_bytes_mut_dynamic_size.x86-64    |    4 +
 ...ref_type_bytes_mut_dynamic_size.x86-64.mca |   45 +
 .../benches/ref_type_bytes_mut_static_size.rs |   19 +
 .../ref_type_bytes_mut_static_size.x86-64     |    4 +
 .../ref_type_bytes_mut_static_size.x86-64.mca |   45 +
 .../benches/ref_type_bytes_static_size.rs     |   17 +
 .../benches/ref_type_bytes_static_size.x86-64 |    4 +
 .../ref_type_bytes_static_size.x86-64.mca     |   45 +
 .../benches/ref_type_deref_dynamic_padding.rs |   19 +
 .../ref_type_deref_dynamic_padding.x86-64     |   29 +
 .../ref_type_deref_dynamic_padding.x86-64.mca |   91 +
 .../benches/ref_type_deref_dynamic_size.rs    |   19 +
 .../ref_type_deref_dynamic_size.x86-64        |   27 +
 .../ref_type_deref_dynamic_size.x86-64.mca    |   87 +
 .../ref_type_deref_mut_dynamic_size.rs        |   19 +
 .../ref_type_deref_mut_dynamic_size.x86-64    |   27 +
 ...ref_type_deref_mut_dynamic_size.x86-64.mca |   87 +
 .../benches/ref_type_deref_mut_static_size.rs |   19 +
 .../ref_type_deref_mut_static_size.x86-64     |    3 +
 .../ref_type_deref_mut_static_size.x86-64.mca |   43 +
 .../benches/ref_type_deref_static_size.rs     |   19 +
 .../benches/ref_type_deref_static_size.x86-64 |    3 +
 .../ref_type_deref_static_size.x86-64.mca     |   43 +
 .../ref_type_from_bytes_dynamic_padding.rs    |   19 +
 ...ref_type_from_bytes_dynamic_padding.x86-64 |   25 +
 ...type_from_bytes_dynamic_padding.x86-64.mca |   85 +
 .../ref_type_from_bytes_dynamic_size.rs       |   17 +
 .../ref_type_from_bytes_dynamic_size.x86-64   |   21 +
 ...ef_type_from_bytes_dynamic_size.x86-64.mca |   77 +
 .../ref_type_from_bytes_static_size.rs        |   17 +
 .../ref_type_from_bytes_static_size.x86-64    |   15 +
 ...ref_type_from_bytes_static_size.x86-64.mca |   65 +
 ...e_from_bytes_with_elems_dynamic_padding.rs |   20 +
 ...om_bytes_with_elems_dynamic_padding.x86-64 |   26 +
 ...ytes_with_elems_dynamic_padding.x86-64.mca |   85 +
 ...type_from_bytes_with_elems_dynamic_size.rs |   20 +
 ..._from_bytes_with_elems_dynamic_size.x86-64 |   28 +
 ...m_bytes_with_elems_dynamic_size.x86-64.mca |   89 +
 .../ref_type_from_prefix_dynamic_padding.rs   |   22 +
 ...ef_type_from_prefix_dynamic_padding.x86-64 |   26 +
 ...ype_from_prefix_dynamic_padding.x86-64.mca |   87 +
 .../ref_type_from_prefix_dynamic_size.rs      |   22 +
 .../ref_type_from_prefix_dynamic_size.x86-64  |   19 +
 ...f_type_from_prefix_dynamic_size.x86-64.mca |   73 +
 .../ref_type_from_prefix_static_size.rs       |   20 +
 .../ref_type_from_prefix_static_size.x86-64   |   15 +
 ...ef_type_from_prefix_static_size.x86-64.mca |   65 +
 ..._from_prefix_with_elems_dynamic_padding.rs |   23 +
 ...m_prefix_with_elems_dynamic_padding.x86-64 |   26 +
 ...efix_with_elems_dynamic_padding.x86-64.mca |   85 +
 ...ype_from_prefix_with_elems_dynamic_size.rs |   23 +
 ...from_prefix_with_elems_dynamic_size.x86-64 |   27 +
 ..._prefix_with_elems_dynamic_size.x86-64.mca |   87 +
 .../ref_type_from_suffix_dynamic_padding.rs   |   22 +
 ...ef_type_from_suffix_dynamic_padding.x86-64 |   31 +
 ...ype_from_suffix_dynamic_padding.x86-64.mca |   97 +
 .../ref_type_from_suffix_dynamic_size.rs      |   22 +
 .../ref_type_from_suffix_dynamic_size.x86-64  |   23 +
 ...f_type_from_suffix_dynamic_size.x86-64.mca |   81 +
 .../ref_type_from_suffix_static_size.rs       |   20 +
 .../ref_type_from_suffix_static_size.x86-64   |   18 +
 ...ef_type_from_suffix_static_size.x86-64.mca |   71 +
 ..._from_suffix_with_elems_dynamic_padding.rs |   23 +
 ...m_suffix_with_elems_dynamic_padding.x86-64 |   27 +
 ...ffix_with_elems_dynamic_padding.x86-64.mca |   87 +
 ...ype_from_suffix_with_elems_dynamic_size.rs |   23 +
 ...from_suffix_with_elems_dynamic_size.x86-64 |   27 +
 ..._suffix_with_elems_dynamic_size.x86-64.mca |   87 +
 .../benches/ref_type_into_mut_dynamic_size.rs |   19 +
 .../ref_type_into_mut_dynamic_size.x86-64     |   27 +
 .../ref_type_into_mut_dynamic_size.x86-64.mca |   87 +
 .../benches/ref_type_into_mut_static_size.rs  |   19 +
 .../ref_type_into_mut_static_size.x86-64      |    3 +
 .../ref_type_into_mut_static_size.x86-64.mca  |   43 +
 .../ref_type_into_ref_dynamic_padding.rs      |   19 +
 .../ref_type_into_ref_dynamic_padding.x86-64  |   29 +
 ...f_type_into_ref_dynamic_padding.x86-64.mca |   91 +
 .../benches/ref_type_into_ref_dynamic_size.rs |   19 +
 .../ref_type_into_ref_dynamic_size.x86-64     |   27 +
 .../ref_type_into_ref_dynamic_size.x86-64.mca |   87 +
 .../benches/ref_type_into_ref_static_size.rs  |   19 +
 .../ref_type_into_ref_static_size.x86-64      |    3 +
 .../ref_type_into_ref_static_size.x86-64.mca  |   43 +
 .../benches/ref_type_read_static_size.rs      |   17 +
 .../benches/ref_type_read_static_size.x86-64  |    7 +
 .../ref_type_read_static_size.x86-64.mca      |   51 +
 .../benches/ref_type_write_static_size.rs     |   20 +
 .../benches/ref_type_write_static_size.x86-64 |    6 +
 .../ref_type_write_static_size.x86-64.mca     |   49 +
 ...t_via_runtime_check_dynamic_padding.x86-64 |    5 +-
 ...a_runtime_check_dynamic_padding.x86-64.mca |   30 +-
 .../benches/try_read_from_bytes.x86-64        |   28 +-
 .../benches/try_read_from_bytes.x86-64.mca    |   66 +-
 .../benches/try_read_from_prefix.x86-64       |   19 +-
 .../benches/try_read_from_prefix.x86-64.mca   |   52 +-
 .../benches/try_read_from_suffix.x86-64       |   21 +-
 .../benches/try_read_from_suffix.x86-64.mca   |   56 +-
 .../try_ref_from_bytes_dynamic_padding.x86-64 |   34 +-
 ..._ref_from_bytes_dynamic_padding.x86-64.mca |   76 +-
 .../try_ref_from_bytes_dynamic_size.x86-64    |   31 +-
 ...try_ref_from_bytes_dynamic_size.x86-64.mca |   70 +-
 ...try_ref_from_prefix_dynamic_padding.x86-64 |   21 +-
 ...ref_from_prefix_dynamic_padding.x86-64.mca |   54 +-
 .../try_ref_from_prefix_dynamic_size.x86-64   |   16 +-
 ...ry_ref_from_prefix_dynamic_size.x86-64.mca |   56 +-
 ...try_ref_from_suffix_dynamic_padding.x86-64 |   29 +-
 ...ref_from_suffix_dynamic_padding.x86-64.mca |   74 +-
 ...m_suffix_with_elems_dynamic_padding.x86-64 |   31 +-
 ...ffix_with_elems_dynamic_padding.x86-64.mca |   80 +-
 ...from_suffix_with_elems_dynamic_size.x86-64 |   28 +-
 ..._suffix_with_elems_dynamic_size.x86-64.mca |   72 +-
 .../benches/write_to_dynamic_size.x86-64      |    3 +-
 .../benches/write_to_dynamic_size.x86-64.mca  |   34 +-
 .../write_to_prefix_dynamic_size.x86-64       |    3 +-
 .../write_to_prefix_dynamic_size.x86-64.mca   |   36 +-
 .../write_to_suffix_dynamic_size.x86-64       |    3 +-
 .../write_to_suffix_dynamic_size.x86-64.mca   |   38 +-
 .../zerocopy/benches/zero_dynamic_size.x86-64 |    3 +-
 .../benches/zero_dynamic_size.x86-64.mca      |   20 +-
 rust/zerocopy/src/byte_slice.rs               |    6 +-
 rust/zerocopy/src/byteorder.rs                |   41 +-
 rust/zerocopy/src/error.rs                    |   14 +-
 rust/zerocopy/src/impls.rs                    |  117 +-
 rust/zerocopy/src/layout.rs                   | 3729 +++++++++++++++--
 rust/zerocopy/src/lib.rs                      | 1081 ++++-
 rust/zerocopy/src/macros.rs                   |   53 +-
 rust/zerocopy/src/pointer/inner.rs            |   35 +-
 rust/zerocopy/src/pointer/invariant.rs        |   61 +-
 rust/zerocopy/src/pointer/mod.rs              |   50 +-
 rust/zerocopy/src/pointer/ptr.rs              |  177 +-
 rust/zerocopy/src/pointer/transmute.rs        |  100 +-
 rust/zerocopy/src/ref.rs                      |  762 +++-
 rust/zerocopy/src/split_at.rs                 |  718 +++-
 rust/zerocopy/src/util/macro_util.rs          |  112 +-
 rust/zerocopy/src/util/macros.rs              |  127 +-
 rust/zerocopy/src/util/mod.rs                 |   40 +-
 rust/zerocopy/src/wrappers.rs                 |  262 +-
 184 files changed, 12220 insertions(+), 3006 deletions(-)
 create mode 100644 rust/zerocopy-derive/derive/project.rs
 create mode 100644 rust/zerocopy-derive/invariant.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_read_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_read_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_read_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_write_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_write_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_write_static_size.x86-64.mca

diff --git a/rust/Makefile b/rust/Makefile
index ddca144cb084..0ac9ab28cc2b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -94,7 +94,7 @@ zerocopy-flags := \
     $(call cfgs-to-flags,$(zerocopy-cfgs))
 
 zerocopy-envs := \
-    CARGO_PKG_VERSION=0.8.54
+    CARGO_PKG_VERSION=0.8.62
 
 proc_macro2-cfgs := \
     feature="proc-macro" \
diff --git a/rust/zerocopy-derive/README.md b/rust/zerocopy-derive/README.md
index 49de31b8e082..fab3779b9ed2 100644
--- a/rust/zerocopy-derive/README.md
+++ b/rust/zerocopy-derive/README.md
@@ -1,14 +1,14 @@
 # `zerocopy-derive`
 
-These source files come from the Rust `zerocopy-derive` crate, version v0.8.54
-(released 2026-07-08), hosted in the <https://github.com/google/zerocopy>
+These source files come from the Rust `zerocopy-derive` crate, version v0.8.62
+(released 2026-10-08), hosted in the <https://github.com/google/zerocopy>
 repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
 modified to tweak the SPDX license identifiers and to remove the generation of
 non-ASCII identifiers.
 
 For copyright details, please see:
 
-    https://github.com/google/zerocopy/blob/v0.8.54/zerocopy/README.md?plain=1
-    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-BSD
-    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-APACHE
-    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-MIT
+    https://github.com/google/zerocopy/blob/v0.8.62/zerocopy/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.62/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.62/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.62/LICENSE-MIT
diff --git a/rust/zerocopy-derive/derive/from_bytes.rs b/rust/zerocopy-derive/derive/from_bytes.rs
index 66d820f6ad4c..7fe505a86457 100644
--- a/rust/zerocopy-derive/derive/from_bytes.rs
+++ b/rust/zerocopy-derive/derive/from_bytes.rs
@@ -89,6 +89,12 @@ pub(crate) fn find_zero_variant(enm: &DataEnum) -> Result<usize, bool> {
     Err(has_unknown_discriminants)
 }
 pub(crate) fn derive_from_zeros(ctx: &Ctx, top_level: Trait) -> Result<TokenStream, Error> {
+    if let Some(span) = ctx.invariant_span {
+        return ctx.error_or_skip(Error::new(
+            span,
+            "cannot derive `FromZeros` for a type with invariants",
+        ));
+    }
     let try_from_bytes = derive_try_from_bytes(ctx, top_level)?;
     let from_zeros = match &ctx.ast.data {
         Data::Struct(strct) => derive_from_zeros_struct(ctx, strct),
@@ -98,6 +104,12 @@ pub(crate) fn derive_from_zeros(ctx: &Ctx, top_level: Trait) -> Result<TokenStre
     Ok(IntoIterator::into_iter([try_from_bytes, from_zeros]).collect())
 }
 pub(crate) fn derive_from_bytes(ctx: &Ctx, top_level: Trait) -> Result<TokenStream, Error> {
+    if let Some(span) = ctx.invariant_span {
+        return ctx.error_or_skip(Error::new(
+            span,
+            "cannot derive `FromBytes` for a type with invariants",
+        ));
+    }
     let from_zeros = derive_from_zeros(ctx, top_level)?;
     let from_bytes = match &ctx.ast.data {
         Data::Struct(strct) => derive_from_bytes_struct(ctx, strct),
diff --git a/rust/zerocopy-derive/derive/into_bytes.rs b/rust/zerocopy-derive/derive/into_bytes.rs
index 0103a78d087f..55c53de6b8c4 100644
--- a/rust/zerocopy-derive/derive/into_bytes.rs
+++ b/rust/zerocopy-derive/derive/into_bytes.rs
@@ -2,7 +2,7 @@
 //
 use proc_macro2::{Span, TokenStream};
 use quote::quote;
-use syn::{Data, DataEnum, DataStruct, DataUnion, Error, Type};
+use syn::{parse_quote, Data, DataEnum, DataStruct, DataUnion, Error, Ident, Type, WherePredicate};
 
 use crate::{
     repr::{EnumRepr, StructUnionRepr},
@@ -18,6 +18,74 @@ pub(crate) fn derive_into_bytes(ctx: &Ctx, _top_level: Trait) -> Result<TokenStr
         Data::Union(unn) => derive_into_bytes_union(ctx, unn),
     }
 }
+
+/// If every field is exactly `T`, `[T; _]`, or a final `[T]` for the same type
+/// parameter `T`, returns the bounds required to prove this to rustc.
+fn homogeneous_field_bounds(ctx: &Ctx, strct: &DataStruct) -> Option<Vec<WherePredicate>> {
+    fn strip_parens_and_groups(mut ty: &Type) -> &Type {
+        loop {
+            ty = match ty {
+                Type::Group(group) => &group.elem,
+                Type::Paren(paren) => &paren.elem,
+                ty => return ty,
+            };
+        }
+    }
+
+    fn type_is_parameter(ty: &Type, parameter: &Ident) -> bool {
+        match strip_parens_and_groups(ty) {
+            Type::Path(path) => path.qself.is_none() && path.path.is_ident(parameter),
+            _ => false,
+        }
+    }
+
+    let fields = strct.fields();
+    ctx.ast.generics.type_params().find_map(|parameter| {
+        let parameter = &parameter.ident;
+        let elements = fields
+            .iter()
+            .enumerate()
+            .map(|(index, (_, _, ty))| match strip_parens_and_groups(ty) {
+                Type::Array(array) => Some(&*array.elem),
+                Type::Slice(slice) if index + 1 == fields.len() => Some(&*slice.elem),
+                Type::Slice(_) => None,
+                ty => Some(ty),
+            })
+            .collect::<Option<Vec<_>>>()?;
+
+        if !elements.iter().all(|element| type_is_parameter(element, parameter)) {
+            return None;
+        }
+
+        let zerocopy_crate = &ctx.zerocopy_crate;
+        let mut bounds = fields
+            .iter()
+            .map(|(_, _, ty)| parse_quote!(#ty: #zerocopy_crate::IntoBytes))
+            .collect::<Vec<WherePredicate>>();
+
+        // `Ident` equality is only a syntactic prefilter above. In
+        // macro-generated input, two identifiers can both print as `T` and
+        // compare equal here while having different hygiene contexts. For
+        // example, a call-site `T` could resolve to a `u8` type alias while a
+        // def-site `T` resolves to this struct's type parameter. Instantiating
+        // that parameter with `u16` would make the fields actually be `u8` and
+        // `u16`; treating them as homogeneous could overlook padding and cause
+        // us to emit an unsound `IntoBytes` impl.
+        //
+        // Quote every element type from its original field AST so that its
+        // hygiene context is retained, then use `Identity` to have rustc verify
+        // that it resolves to `parameter`. Do not deduplicate these predicates:
+        // identically-printed types may have different hygiene contexts and
+        // must each be checked by rustc.
+        bounds.extend(elements.into_iter().map(|element| {
+            parse_quote! {
+                #element: #zerocopy_crate::util::macro_util::Identity<Type = #parameter>
+            }
+        }));
+        Some(bounds)
+    })
+}
+
 fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream, Error> {
     let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
 
@@ -25,8 +93,12 @@ fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream
     let is_c = repr.is_c();
     let is_packed_1 = repr.is_packed_1();
     let num_fields = strct.fields().len();
+    let mut homogeneous_bounds =
+        if is_c && !repr.is_align_gt_1() { homogeneous_field_bounds(ctx, strct) } else { None };
 
-    let (padding_check, require_unaligned_fields) = if is_transparent || is_packed_1 {
+    let (padding_check, require_unaligned_fields, explicit_field_bounds) = if is_transparent
+        || is_packed_1
+    {
         // No padding check needed.
         // - repr(transparent): The layout and ABI of the whole struct is the
         //   same as its only non-ZST field (meaning there's no padding outside
@@ -43,12 +115,12 @@ fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream
         //   An important consequence of these rules is that a type with
         //   `#[repr(packed(1))]`` (or `#[repr(packed)]``) will have no
         //   inter-field padding.
-        (None, false)
+        (None, false, None)
     } else if is_c && !repr.is_align_gt_1() && num_fields <= 1 {
         // No padding check needed. A repr(C) struct with zero or one field has
         // no padding unless #[repr(align)] explicitly adds padding, which we
         // check for in this branch's condition.
-        (None, false)
+        (None, false, None)
     } else if ctx.ast.generics.params.is_empty() {
         // Is the last field a syntactic slice, i.e., `[SomeType]`.
         let is_syntactic_dst =
@@ -66,10 +138,31 @@ fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream
         //   2. The fields do not overlap.
         //   ...
         if is_c && is_syntactic_dst {
-            (Some(PaddingCheck::ReprCStruct), false)
+            (Some(PaddingCheck::ReprCStruct), false, None)
         } else {
-            (Some(PaddingCheck::Struct), false)
+            (Some(PaddingCheck::Struct), false, None)
         }
+    } else if let Some(bounds) = homogeneous_bounds.take() {
+        // Let `a` be the alignment of `T` and `s` be its size. Rust guarantees
+        // that `s` is a multiple of `a`. `T`, `[T; N]`, and `[T]` all have
+        // alignment `a`, and their sizes are `s`, `N * s`, and `len * s`,
+        // respectively.
+        //
+        // Without a `packed` modifier, each field and the struct have
+        // alignment `a`. `align(1)` does not change that because every Rust
+        // type already has alignment at least 1. With `packed(P)`, each field
+        // and the struct instead have alignment `b = min(a, P)`. Rust
+        // alignments and valid values of `P` are powers of two, so `b` divides
+        // `a`; every field size is therefore also a multiple of `b`.
+        //
+        // Thus, after placing any field, the running offset is already aligned
+        // for the next field, and the final offset is already aligned for the
+        // struct. A repr(C) without an `align` modifier greater than 1
+        // therefore introduces neither inter-field nor trailing padding,
+        // including for a slice DST. The bounds returned by
+        // `homogeneous_field_bounds` require rustc to verify that the element
+        // type of every field is the same type `T`.
+        (None, false, Some(bounds))
     } else if is_c && !repr.is_align_gt_1() {
         // We can't use a padding check since there are generic type arguments.
         // Instead, we require all field types to implement `Unaligned`. This
@@ -79,7 +172,7 @@ fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream
         //
         // FIXME(#10): Support type parameters for non-transparent, non-packed
         // structs without requiring `Unaligned`.
-        (None, true)
+        (None, true, None)
     } else {
         return ctx.error_or_skip(Error::new(
             Span::call_site(),
@@ -87,7 +180,9 @@ fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream
         ));
     };
 
-    let field_bounds = if require_unaligned_fields {
+    let field_bounds = if let Some(bounds) = explicit_field_bounds {
+        FieldBounds::Explicit(bounds)
+    } else if require_unaligned_fields {
         FieldBounds::All(&[TraitBound::Slf, TraitBound::Other(Trait::Unaligned)])
     } else {
         FieldBounds::ALL_SELF
@@ -162,3 +257,39 @@ fn derive_into_bytes_union(ctx: &Ctx, unn: &DataUnion) -> Result<TokenStream, Er
         .build();
     Ok(quote!(#cfg_compile_error #impl_block))
 }
+
+#[cfg(test)]
+mod tests {
+    use super::*;
+
+    fn derive(input: syn::DeriveInput) -> TokenStream {
+        let ctx = Ctx::try_from_derive_input(input).unwrap();
+        derive_into_bytes(&ctx, Trait::IntoBytes).unwrap()
+    }
+
+    #[test]
+    fn raw_repr_matches_ordinary_repr() {
+        let ordinary = derive(parse_quote! {
+            #[repr(C)]
+            #[repr(align(8))]
+            struct Response {
+                status: u8,
+            }
+        });
+        let raw = derive(parse_quote! {
+            #[repr(C)]
+            #[r#repr(r#align(8))]
+            struct Response {
+                status: u8,
+            }
+        });
+
+        let ordinary = ordinary.to_string();
+        let raw = raw.to_string();
+
+        // In particular, both expansions contain the padding check which
+        // prevents the resulting type from implementing `IntoBytes`.
+        assert!(ordinary.contains("PaddingFree"));
+        assert_eq!(ordinary, raw);
+    }
+}
diff --git a/rust/zerocopy-derive/derive/known_layout.rs b/rust/zerocopy-derive/derive/known_layout.rs
index d0c4cecfff15..d4f6ecff5730 100644
--- a/rust/zerocopy-derive/derive/known_layout.rs
+++ b/rust/zerocopy-derive/derive/known_layout.rs
@@ -81,7 +81,7 @@ fn raw_from_ptr_len(
 
             #[inline(always)]
             fn pointer_to_metadata(ptr: *mut Self) -> <Self as #zerocopy_crate::KnownLayout>::PointerMetadata {
-                <#trailing_field_ty>::pointer_to_metadata(ptr as *mut _)
+                <#trailing_field_ty as #zerocopy_crate::KnownLayout>::pointer_to_metadata(ptr as *mut _)
             }
         }
     };
@@ -144,6 +144,7 @@ fn pointer_to_metadata(ptr: *mut Self) -> <Self as #zerocopy_crate::KnownLayout>
         // Define the collection of type-level field handles.
         let field_defs = field_indices.iter().zip(fields).map(|(idx, (vis, _, _))| {
             quote! {
+                #[allow(missing_debug_implementations)]
                 #vis struct #idx;
             }
         });
@@ -200,6 +201,7 @@ unsafe impl #impl_generics #zerocopy_crate::util::macro_util::Field<#idx> for #i
             // `#ty`, not `__ZerocopyKnownLayoutMaybeUninit` (see #2116).
             #repr
             #[doc(hidden)]
+            #[allow(missing_debug_implementations)]
             #vis struct __ZerocopyKnownLayoutMaybeUninit<#params> (
                 #(#core::mem::MaybeUninit<
                     <#ident #ty_generics as
diff --git a/rust/zerocopy-derive/derive/mod.rs b/rust/zerocopy-derive/derive/mod.rs
index b3839fcf73c9..4ccb71807ee7 100644
--- a/rust/zerocopy-derive/derive/mod.rs
+++ b/rust/zerocopy-derive/derive/mod.rs
@@ -3,6 +3,7 @@
 pub mod from_bytes;
 pub mod into_bytes;
 pub mod known_layout;
+pub mod project;
 pub mod try_from_bytes;
 pub mod unaligned;
 
@@ -102,13 +103,6 @@ pub(crate) fn derive_split_at(ctx: &Ctx, _top_level: Trait) -> Result<TokenStrea
         }
     };
 
-    if repr.get_packed().is_some() {
-        return ctx.error_or_skip(Error::new(
-            Span::call_site(),
-            "must not have #[repr(packed)] attribute",
-        ));
-    }
-
     if !(repr.is_c() || repr.is_transparent()) {
         return ctx.error_or_skip(Error::new(
             Span::call_site(),
@@ -124,13 +118,28 @@ pub(crate) fn derive_split_at(ctx: &Ctx, _top_level: Trait) -> Result<TokenStrea
     };
 
     let zerocopy_crate = &ctx.zerocopy_crate;
-    // SAFETY: `#ty`, per the above checks, is `repr(C)` or `repr(transparent)`
-    // and is not packed; its trailing field is guaranteed to be well-aligned
-    // for its type. By invariant on `FieldBounds::TRAILING_SELF`, the trailing
-    // slice of the trailing field is also well-aligned for its type.
+    let elem = quote!(<#trailing_field as #zerocopy_crate::SplitAt>::Elem);
+    let elem =
+        if repr.get_packed().is_some() { quote!(#zerocopy_crate::Unalign<#elem>) } else { elem };
+
+    // SAFETY: The checks above require `repr(C)` or `repr(transparent)`, and
+    // `FieldBounds::TRAILING_SELF` requires the trailing field to be `SplitAt`.
+    // Its `Elem` therefore has the size, bit validity, and `UnsafeCell`
+    // coverage of the actual trailing element. For an unpacked struct, the
+    // trailing field is aligned, so its `SplitAt` alignment guarantee applies.
+    // For a packed struct, wrapping its `Elem` in `Unalign` preserves those
+    // representation properties and gives alignment 1. Thus the trailing
+    // slice can be accessed as `[#elem]` even if packing misaligns its field.
+    // Packing does not change the field's internal layout [1], so its element
+    // size and byte offsets are preserved in either case.
+    //
+    // [1] Per https://doc.rust-lang.org/1.93.0/reference/type-layout.html#layout.repr.alignment.intro:
+    //
+    //   `packed` may also alter the padding between fields (although it will
+    //   not alter the padding inside of any field).
     Ok(ImplBlockBuilder::new(ctx, &ctx.ast.data, Trait::SplitAt, FieldBounds::TRAILING_SELF)
         .inner_extras(quote! {
-            type Elem = <#trailing_field as #zerocopy_crate::SplitAt>::Elem;
+            type Elem = #elem;
         })
         .build())
 }
diff --git a/rust/zerocopy-derive/derive/project.rs b/rust/zerocopy-derive/derive/project.rs
new file mode 100644
index 000000000000..1cfde70624a7
--- /dev/null
+++ b/rust/zerocopy-derive/derive/project.rs
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+//
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use proc_macro2::TokenStream;
+use quote::quote;
+use syn::{
+    parse_quote, spanned::Spanned as _, Data, DataEnum, DeriveInput, Error, Expr, Fields, Ident,
+    Index, Type,
+};
+
+use crate::{
+    repr::{EnumRepr, StructUnionRepr},
+    util::{
+        const_block, generate_tag_enum, Client, Ctx, DataExt, FieldBounds, FieldProjection,
+        ImplBlockBuilder, Trait,
+    },
+};
+
+pub(crate) fn tag_ident(variant: &Ident) -> Ident {
+    ident!(("___ZEROCOPY_TAG_{}", variant), variant.span())
+}
+
+pub(crate) fn variant_struct_ident(variant: &Ident) -> Ident {
+    ident!(("___ZerocopyVariantStruct_{}", variant), variant.span())
+}
+
+pub(crate) fn variants_union_field_ident(variant: &Ident) -> Ident {
+    ident!(("__field_{}", variant), variant.span())
+}
+
+/// Generates a constant for the tag associated with each variant of the enum.
+/// When we match on the enum's tag, each arm matches one of these constants. We
+/// have to use constants here because:
+///
+/// - The type that we're matching on is not the type of the tag, it's an
+///   integer of the same size as the tag type and with the same bit patterns.
+/// - We can't read the enum tag as an enum because the bytes may not represent
+///   a valid variant.
+/// - Patterns do not currently support const expressions, so we have to assign
+///   these constants to names rather than use them inline in the `match`
+///   statement.
+pub(crate) fn generate_tag_consts(data: &DataEnum) -> TokenStream {
+    let tags = data.variants.iter().map(|variant| {
+        let variant_ident = &variant.ident;
+        let tag = tag_ident(variant_ident);
+
+        quote! {
+            // This casts the enum variant to its discriminant, and then
+            // converts the discriminant to the target integral type via a
+            // numeric cast [1].
+            //
+            // Because these are the same size, this is defined to be a no-op
+            // and therefore is a lossless conversion [2].
+            //
+            // [1] Per https://doc.rust-lang.org/1.81.0/reference/expressions/operator-expr.html#enum-cast:
+            //
+            //   Casts an enum to its discriminant.
+            //
+            // [2] Per https://doc.rust-lang.org/1.81.0/reference/expressions/operator-expr.html#numeric-cast:
+            //
+            //   Casting between two integers of the same size (e.g. i32 -> u32)
+            //   is a no-op.
+            const #tag: ___ZerocopyTagPrimitive =
+                ___ZerocopyTag::#variant_ident as ___ZerocopyTagPrimitive;
+        }
+    });
+
+    quote! {
+        #(#tags)*
+    }
+}
+
+#[derive(Copy, Clone, Eq, PartialEq)]
+enum Validity {
+    Uninit,
+    Initialized,
+    Safe,
+}
+
+impl Validity {
+    fn as_type(self, ctx: &Ctx) -> Type {
+        let zerocopy_crate = &ctx.zerocopy_crate;
+        match self {
+            Validity::Uninit => parse_quote!(#zerocopy_crate::invariant::Uninit),
+            Validity::Initialized => {
+                parse_quote!(#zerocopy_crate::invariant::Initialized)
+            }
+            Validity::Safe => parse_quote!(#zerocopy_crate::invariant::Safe),
+        }
+    }
+
+    /// Computes the output validity of projecting a struct or union field, or
+    /// returns `None` if that projection must not be generated.
+    ///
+    /// Struct fields preserve all three validity invariants. Union fields
+    /// preserve `Uninit` and `Initialized`. No projection is generated from a
+    /// `Safe` union.
+    fn output_validity_for_struct_or_union(self, data: &Data) -> Option<Self> {
+        match (data, self) {
+            (Data::Struct(_), validity) => Some(validity),
+            (Data::Union(_), validity @ (Validity::Uninit | Validity::Initialized)) => {
+                Some(validity)
+            }
+            (Data::Union(_), Validity::Safe) => None,
+            (Data::Enum(_), _) => unreachable!(),
+        }
+    }
+}
+
+/// Returns the projection variant ID for the struct or union described by
+/// `ctx`.
+///
+/// This intentionally does not handle enums: an enum field's variant ID
+/// identifies its source variant rather than the representation of its
+/// containing type.
+pub(crate) fn struct_union_variant_id(ctx: &Ctx) -> Box<Expr> {
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    match &ctx.ast.data {
+        Data::Struct(_) => parse_quote!({ #zerocopy_crate::STRUCT_VARIANT_ID }),
+        Data::Union(_) => {
+            if StructUnionRepr::from_attrs(&ctx.ast.attrs).map(|repr| repr.is_c()).unwrap() {
+                parse_quote!({ #zerocopy_crate::REPR_C_UNION_VARIANT_ID })
+            } else {
+                parse_quote!({ #zerocopy_crate::UNION_VARIANT_ID })
+            }
+        }
+        Data::Enum(_) => unreachable!("struct_union_variant_id called for enum"),
+    }
+}
+
+/// Generates field projection implementations for a struct or union.
+///
+/// `repr(C)` unions use `REPR_C_UNION_VARIANT_ID`, so their projections
+/// additionally implement `pointer::cast::Cast`. Other unions use
+/// `UNION_VARIANT_ID`.
+pub(crate) fn derive_projection_struct_union(
+    ctx: &Ctx,
+    data: &dyn DataExt,
+    client: Client,
+) -> TokenStream {
+    let fields = ctx.ast.data.fields();
+    if fields.is_empty() {
+        return quote! {};
+    }
+
+    let field_tokens = fields.iter().map(|(vis, ident, _)| {
+        let ident = ident!(("__z{}", ident), ident.span());
+        quote! {
+            #vis enum #ident {}
+        }
+    });
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let variant_id = struct_union_variant_id(ctx);
+
+    let core = ctx.core_path();
+    let has_tag = ImplBlockBuilder::new(ctx, data, Trait::HasTag { client }, FieldBounds::None)
+        .inner_extras(quote! {
+            type Tag = ();
+            type ProjectToTag = #zerocopy_crate::pointer::cast::CastToUnit;
+        })
+        .build();
+
+    let has_fields = fields.iter().map(move |(_, ident, ty)| {
+        let field_token = ident!(("__z{}", ident), ident.span());
+        let projection = FieldProjection {
+            variant_id: variant_id.clone(),
+            field: parse_quote!(#field_token),
+            field_id: parse_quote!({ #zerocopy_crate::ident_id!(#ident) }),
+        };
+        let has_field_trait = Trait::HasField { client, projection: projection.clone() };
+        let has_field_path = has_field_trait.crate_path(ctx);
+        let has_field = ImplBlockBuilder::new(ctx, data, has_field_trait, FieldBounds::None)
+            .inner_extras(quote! {
+                type Type = #ty;
+
+                #[inline(always)]
+                fn project(
+                    slf: #zerocopy_crate::pointer::PtrInner<'_, Self>,
+                ) -> *mut <Self as #has_field_path>::Type {
+                    let slf = slf.as_ptr();
+                    // SAFETY: By invariant on `PtrInner`, `slf` is a non-null
+                    // pointer whose referent is zero-sized or lives in a valid
+                    // allocation. Since `#ident` is a struct or union field of
+                    // `Self`, this projection preserves or shrinks the referent
+                    // size, and so the resulting referent also fits in the same
+                    // allocation.
+                    unsafe { #core::ptr::addr_of_mut!((*slf).#ident) }
+                }
+            })
+            .build();
+
+        let derive_project_field = |input_validity: Validity| {
+            let output_validity =
+                match input_validity.output_validity_for_struct_or_union(&ctx.ast.data) {
+                    Some(output_validity) => output_validity.as_type(ctx),
+                    None => return TokenStream::new(),
+                };
+            let input_validity = input_validity.as_type(ctx);
+            let projection_preserves_alignment = StructUnionRepr::from_attrs(&ctx.ast.attrs)
+                .map(|repr| repr.get_packed().is_none())
+                .unwrap();
+            let output_alignment = if projection_preserves_alignment {
+                quote! { ___ZcAlignment }
+            } else {
+                quote! { #zerocopy_crate::invariant::Unaligned }
+            };
+            ImplBlockBuilder::new(
+                ctx,
+                data,
+                Trait::ProjectField {
+                    client,
+                    projection: projection.clone(),
+                    invariants: parse_quote!((___ZcAliasing, ___ZcAlignment, #input_validity)),
+                },
+                FieldBounds::None,
+            )
+            .param_extras(vec![
+                parse_quote!(___ZcAliasing: #zerocopy_crate::invariant::Aliasing),
+                parse_quote!(___ZcAlignment: #zerocopy_crate::invariant::Alignment),
+            ])
+            .inner_extras(quote! {
+                // SAFETY: Struct and union projections do not depend on the value of
+                // the referent, and are therefore infallible.
+                type Error = #zerocopy_crate::util::macro_util::core_reexport::convert::Infallible;
+
+                // SAFETY: Projection preserves aliasing. It also preserves
+                // alignment unless the containing type is packed. `Validity`
+                // determines whether a projection is emitted and, if so,
+                // computes its output validity: struct fields preserve validity;
+                // union fields preserve `Uninit` and `Initialized`, and no
+                // projection is emitted for `Safe` union input.
+                type Invariants = (___ZcAliasing, #output_alignment, #output_validity);
+            })
+            .build()
+        };
+
+        let project_uninit = derive_project_field(Validity::Uninit);
+        let project_initialized = derive_project_field(Validity::Initialized);
+        let project_safe = derive_project_field(Validity::Safe);
+
+        quote! {
+            #has_field
+            #project_uninit
+            #project_initialized
+            #project_safe
+        }
+    });
+
+    const_block(field_tokens.into_iter().chain(Some(has_tag)).chain(has_fields).map(Some))
+}
+
+pub(crate) fn derive_enum(
+    ctx: &Ctx,
+    data: &DataEnum,
+    client: Client,
+) -> Result<TokenStream, Error> {
+    // With no fields, there are no `HasField` or `ProjectField` impls to emit,
+    // and therefore no representation requirement to enforce.
+    if data.fields().is_empty() {
+        return Ok(TokenStream::new());
+    }
+
+    let repr = EnumRepr::from_attrs(&ctx.ast.attrs)?;
+    let (outer_tag_type, inner_tag_type) = if repr.is_c() {
+        (quote! { ___ZerocopyTag }, quote! { () })
+    } else if repr.is_primitive() {
+        (quote! { () }, quote! { ___ZerocopyTag })
+    } else {
+        return Err(Error::new(
+            ctx.ast.span(),
+            "must have #[repr(C)] or #[repr(Int)] attribute in order to guarantee this type's memory layout",
+        ));
+    };
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let core = &ctx.core_path();
+    let client_path = &client.crate_path(ctx);
+    let has_tag_trait = Trait::HasTag { client };
+    let has_tag_path = &has_tag_trait.crate_path(ctx);
+    let infallible =
+        quote! { #zerocopy_crate::util::macro_util::core_reexport::convert::Infallible };
+    let tag_enum = generate_tag_enum(ctx, &repr, data);
+    let tag_consts = generate_tag_consts(data);
+
+    let generics = &ctx.ast.generics;
+    let (impl_generics, ref ty_generics, where_clause) = generics.split_for_impl();
+
+    // Synthesize a `repr(C)` struct for each fieldful variant. We must do this
+    // because Rust does not provide an `addr_of!` that works on enums.
+    let variant_structs = data.variants.iter().filter_map(move |variant| {
+        if matches!(variant.fields, Fields::Unit) {
+            return None;
+        }
+
+        let ident = variant_struct_ident(&variant.ident);
+        let field_types = variant.fields.iter().map(|field| &field.ty);
+        let enum_name = &ctx.ast.ident;
+        let variant_struct: DeriveInput = parse_quote! {
+            #[repr(C)]
+            struct #ident #impl_generics (
+                #core::mem::MaybeUninit<___ZerocopyInnerTag>,
+                #(#field_types,)*
+                #core::marker::PhantomData<#enum_name #ty_generics>,
+            ) #where_clause;
+        };
+
+        let projections = derive_projection_struct_union(
+            &ctx.with_input(&variant_struct),
+            &variant_struct.data,
+            client,
+        );
+
+        Some(quote! {
+            #variant_struct
+            #projections
+        })
+    });
+
+    // Synthesize a `repr(C)` union encompassing all synthesized variants.
+    let variants_union = {
+        let fields = data.variants.iter().filter_map(|variant| {
+            if matches!(variant.fields, Fields::Unit) {
+                return None;
+            }
+            let field_name = variants_union_field_ident(&variant.ident);
+            let variant_struct = variant_struct_ident(&variant.ident);
+            Some(quote! {
+                #field_name: #core::mem::ManuallyDrop<#variant_struct #ty_generics>,
+            })
+        });
+
+        let variants_union: DeriveInput = parse_quote! {
+            #[repr(C)]
+            union ___ZerocopyVariants #generics {
+                #(#fields)*
+                // A fieldless enum produces no variant structs, but a union must
+                // have at least one field. This unit does not affect `repr(C)`
+                // layout.
+                __nonempty: (),
+            }
+        };
+        let projections = derive_projection_struct_union(
+            &ctx.with_input(&variants_union),
+            &variants_union.data,
+            client,
+        );
+
+        quote! {
+            #variants_union
+            #projections
+        }
+    };
+
+    // Synthesize a `repr(C)` struct that pairs the the tag with the synthesized
+    // variants union. In practice, the actual tag storage may be here, or
+    // inside the synthesized variant structs, depending on the `repr` of the
+    // enum.
+    let raw_enum: DeriveInput = parse_quote! {
+        #[repr(C)]
+        struct ___ZerocopyRawEnum #generics {
+            tag: ___ZerocopyOuterTag,
+            variants: ___ZerocopyVariants #ty_generics,
+        }
+    };
+
+    let raw_projections =
+        derive_projection_struct_union(&ctx.with_input(&raw_enum), &raw_enum.data, client);
+
+    let has_tag = ImplBlockBuilder::new(ctx, data, has_tag_trait, FieldBounds::None)
+        .inner_extras(quote! {
+            type Tag = ___ZerocopyTag;
+            type ProjectToTag = #zerocopy_crate::pointer::cast::CastSized;
+        })
+        .build();
+
+    let aliasing_param: &syn::GenericParam =
+        &parse_quote!(___ZcAliasing: #zerocopy_crate::invariant::Aliasing);
+    let reference_param: &syn::GenericParam =
+        &parse_quote!(___ZcAliasing: #zerocopy_crate::invariant::Reference);
+    let alignment_param: &syn::GenericParam =
+        &parse_quote!(___ZcAlignment: #zerocopy_crate::invariant::Alignment);
+
+    let has_fields = data.variants().into_iter().flat_map(|(variant, fields)| {
+        let variant_ident = &variant.unwrap().ident;
+        let variants_union_field = variants_union_field_ident(variant_ident);
+        let infallible = &infallible;
+
+        fields.into_iter().enumerate().map(move |(idx, (vis, ident, ty))| {
+            // Rust does not presently support explicit visibility modifiers on
+            // enum fields. Keep this assertion so that a future language
+            // change cannot silently invalidate the visibility invariant.
+            assert!(matches!(vis, syn::Visibility::Inherited));
+            let projection = FieldProjection {
+                variant_id: parse_quote!({ #zerocopy_crate::ident_id!(#variant_ident) }),
+                field: parse_quote!(()),
+                field_id: parse_quote!({ #zerocopy_crate::ident_id!(#ident) }),
+            };
+            // The generated variant struct's first field is its inner tag.
+            let variant_struct_field_index = Index::from(idx + 1);
+            let has_field_trait = Trait::HasField {
+                client,
+                projection: projection.clone(),
+            };
+            let has_field_path = has_field_trait.crate_path(ctx);
+            let has_field = ImplBlockBuilder::new(ctx, data, has_field_trait, FieldBounds::None)
+                .inner_extras(quote! {
+                    type Type = #ty;
+
+                    #[inline(always)]
+                    fn project(
+                        slf: #zerocopy_crate::pointer::PtrInner<'_, Self>,
+                    ) -> *mut <Self as #has_field_path>::Type {
+                        use #zerocopy_crate::pointer::cast::{CastSized, Projection};
+
+                        slf.project::<___ZerocopyRawEnum #ty_generics, CastSized>()
+                            .project::<_, Projection<#client_path, _, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(variants) }>>()
+                            .project::<_, Projection<#client_path, _, { #zerocopy_crate::REPR_C_UNION_VARIANT_ID }, { #zerocopy_crate::ident_id!(#variants_union_field) }>>()
+                            .project::<_, Projection<#client_path, _, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(value) }>>()
+                            .project::<_, Projection<#client_path, _, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(#variant_struct_field_index) }>>()
+                            .as_ptr()
+                    }
+                })
+                .build();
+
+            // SAFETY: `projection` is constructed from the current field and
+            // `variant_ident`, and that same `variant_ident` selects the
+            // variants union field through which `has_field` projects. Thus the
+            // `HasField` impl, `ProjectField` impls, and valid projection's tag
+            // check all identify the same enum field. `idx` is the current
+            // field's zero-based position, and the generated variant struct
+            // prepends its inner tag before reproducing the enum fields in
+            // source order, so `idx + 1` selects that same field. The assertion
+            // above enforces that `repr` is `repr(C)` or a primitive
+            // representation; `___ZerocopyRawEnum` and its nested types model
+            // exactly the representations specified by [1] and [2]. Those
+            // representations use `repr(C)` structs for variant fields, so field
+            // projection preserves alignment. Each `ProjectField` impl preserves
+            // the input validity. The `Uninit` and `Initialized` projections are
+            // infallible because those validity invariants do not depend on the
+            // enum's tag. The `Safe` projection first checks that the tag
+            // selects `variant_ident`; its `Reference` aliasing bound prevents
+            // mutation of the tag between that check and field projection. The
+            // corresponding `HasTag` impl projects to the raw representation's
+            // tag using `CastSized`.
+            //
+            // [1] Per https://doc.rust-lang.org/1.56.0/reference/type-layout.html#reprc-enums-with-fields:
+            //
+            //   The representation of a `repr(C)` enum with fields is a
+            //   `repr(C)` struct with two fields [...]: a `repr(C)` version of
+            //   the enum with all fields removed ("the tag") [and] a `repr(C)`
+            //   union of `repr(C)` structs for the fields of each variant [...].
+            //
+            // [2] Per https://doc.rust-lang.org/1.56.0/reference/type-layout.html#primitive-representation-of-enums-with-fields:
+            //
+            //   The representation of a primitive representation enum is a
+            //   `repr(C)` union of `repr(C)` structs for each variant with a
+            //   field. The first field of each struct in the union is [...] the
+            //   tag and the remaining fields are the fields of that variant.
+            let derive_enum_project_field = |validity| {
+                let (error, is_projectable, aliasing_bound) = if validity == Validity::Safe {
+                    assert!(!matches!(validity, Validity::Uninit | Validity::Initialized));
+                    (
+                        quote! { () },
+                        quote! {
+                            #[inline(always)]
+                            fn is_projectable(
+                                tag: #zerocopy_crate::pointer::Ptr<
+                                    '_,
+                                    <Self as #has_tag_path>::Tag,
+                                    (
+                                        #zerocopy_crate::invariant::Shared,
+                                        ___ZcAlignment,
+                                        #zerocopy_crate::invariant::Safe,
+                                    ),
+                                >,
+                            ) -> #core::result::Result<(), ()> {
+                                let tag = tag.read::<#zerocopy_crate::BecauseImmutable>();
+                                if tag == ___ZerocopyTag::#variant_ident {
+                                    #core::result::Result::Ok(())
+                                } else {
+                                    #core::result::Result::Err(())
+                                }
+                            }
+                        },
+                        reference_param.clone(),
+                    )
+                } else {
+                    (infallible.clone(), quote! {}, aliasing_param.clone())
+                };
+
+                let validity = validity.as_type(ctx);
+                let invariants: Box<Type> =
+                    parse_quote!((___ZcAliasing, ___ZcAlignment, #validity));
+                let project_field_trait = Trait::ProjectField {
+                    client,
+                    projection: projection.clone(),
+                    invariants: invariants.clone(),
+                };
+
+                ImplBlockBuilder::new(ctx, data, project_field_trait, FieldBounds::None)
+                    .param_extras(vec![aliasing_bound.clone(), alignment_param.clone()])
+                    .inner_extras(quote! {
+                        type Error = #error;
+                        type Invariants = #invariants;
+                        #is_projectable
+                    })
+                    .build()
+            };
+
+            let project_uninit = derive_enum_project_field(Validity::Uninit);
+            let project_initialized = derive_enum_project_field(Validity::Initialized);
+            let project_valid = derive_enum_project_field(Validity::Safe);
+
+            quote! {
+                #has_field
+                #project_uninit
+                #project_initialized
+                #project_valid
+            }
+        })
+    });
+
+    Ok(quote! {
+        #tag_enum
+
+        type ___ZerocopyTagPrimitive = #zerocopy_crate::util::macro_util::SizeToTag<
+            { #core::mem::size_of::<___ZerocopyTag>() },
+        >;
+
+        #tag_consts
+
+        type ___ZerocopyOuterTag = #outer_tag_type;
+        type ___ZerocopyInnerTag = #inner_tag_type;
+
+        #(#variant_structs)*
+        #variants_union
+
+        #raw_enum
+        #raw_projections
+
+        #has_tag
+        #(#has_fields)*
+    })
+}
+
+pub(crate) fn derive(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    match &ctx.ast.data {
+        Data::Struct(strct) => {
+            Ok(derive_projection_struct_union(ctx, strct, Client::ProjectDerive))
+        }
+        Data::Union(unn) => Ok(derive_projection_struct_union(ctx, unn, Client::ProjectDerive)),
+        Data::Enum(enm) => {
+            let projections = derive_enum(ctx, enm, Client::ProjectDerive)?;
+            if projections.is_empty() {
+                Ok(projections)
+            } else {
+                Ok(const_block([Some(projections)]))
+            }
+        }
+    }
+}
diff --git a/rust/zerocopy-derive/derive/try_from_bytes.rs b/rust/zerocopy-derive/derive/try_from_bytes.rs
index 44f083328786..ae0c796b91b1 100644
--- a/rust/zerocopy-derive/derive/try_from_bytes.rs
+++ b/rust/zerocopy-derive/derive/try_from_bytes.rs
@@ -1,442 +1,224 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
 //
-use proc_macro2::TokenStream;
-use quote::quote;
-use syn::{
-    parse_quote, spanned::Spanned as _, Data, DataEnum, DataStruct, DataUnion, DeriveInput, Error,
-    Expr, Fields, Ident, Index, Type,
-};
+use proc_macro2::{Ident, Span, TokenStream};
+use quote::{quote, ToTokens as _};
+use syn::{spanned::Spanned as _, Data, DataEnum, DataStruct, DataUnion, Error, Field};
 
 use crate::{
-    repr::{EnumRepr, StructUnionRepr},
+    derive::project::{
+        derive_enum, derive_projection_struct_union, generate_tag_consts, struct_union_variant_id,
+        tag_ident,
+    },
+    repr::EnumRepr,
     util::{
-        const_block, enum_size_from_repr, generate_tag_enum, Ctx, DataExt, FieldBounds,
+        enum_size_from_repr, generate_tag_enum, Client, Ctx, DataExt, FieldBounds,
         ImplBlockBuilder, Trait, TraitBound,
     },
 };
-fn tag_ident(variant_ident: &Ident) -> Ident {
-    ident!(("___ZEROCOPY_TAG_{}", variant_ident), variant_ident.span())
-}
-
-/// Generates a constant for the tag associated with each variant of the enum.
-/// When we match on the enum's tag, each arm matches one of these constants. We
-/// have to use constants here because:
-///
-/// - The type that we're matching on is not the type of the tag, it's an
-///   integer of the same size as the tag type and with the same bit patterns.
-/// - We can't read the enum tag as an enum because the bytes may not represent
-///   a valid variant.
-/// - Patterns do not currently support const expressions, so we have to assign
-///   these constants to names rather than use them inline in the `match`
-///   statement.
-fn generate_tag_consts(data: &DataEnum) -> TokenStream {
-    let tags = data.variants.iter().map(|v| {
-        let variant_ident = &v.ident;
-        let tag_ident = tag_ident(variant_ident);
-
-        quote! {
-            // This casts the enum variant to its discriminant, and then
-            // converts the discriminant to the target integral type via a
-            // numeric cast [1].
-            //
-            // Because these are the same size, this is defined to be a no-op
-            // and therefore is a lossless conversion [2].
-            //
-            // [1] Per https://doc.rust-lang.org/1.81.0/reference/expressions/operator-expr.html#enum-cast:
-            //
-            //   Casts an enum to its discriminant.
-            //
-            // [2] Per https://doc.rust-lang.org/1.81.0/reference/expressions/operator-expr.html#numeric-cast:
-            //
-            //   Casting between two integers of the same size (e.g. i32 -> u32)
-            //   is a no-op.
-            const #tag_ident: ___ZerocopyTagPrimitive =
-                ___ZerocopyTag::#variant_ident as ___ZerocopyTagPrimitive;
-        }
-    });
 
-    quote! {
-        #(#tags)*
+fn candidate_ident(ctx: &Ctx) -> Ident {
+    // Choose a source-pointer name distinct from the field names. Mixed-site
+    // hygiene keeps it out of the user's invariant expressions.
+    let fields = ctx.ast.data.fields();
+    let mut name = "candidate".to_owned();
+    while fields.iter().any(|(_, field, _)| field.to_string().trim_start_matches("r#") == name) {
+        name.push('_');
     }
+    Ident::new(&name, Span::mixed_site())
 }
 
-fn variant_struct_ident(variant_ident: &Ident) -> Ident {
-    ident!(("___ZerocopyVariantStruct_{}", variant_ident), variant_ident.span())
-}
-
-/// Generates variant structs for the given enum variant.
-///
-/// These are structs associated with each variant of an enum. They are
-/// `repr(C)` tuple structs with the same fields as the variant after a
-/// `MaybeUninit<___ZerocopyInnerTag>`.
-///
-/// In order to unify the generated types for `repr(C)` and `repr(int)` enums,
-/// we use a "fused" representation with fields for both an inner tag and an
-/// outer tag. Depending on the repr, we will set one of these tags to the tag
-/// type and the other to `()`. This lets us generate the same code but put the
-/// tags in different locations.
-fn generate_variant_structs(ctx: &Ctx, data: &DataEnum) -> TokenStream {
-    let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
-
-    let enum_name = &ctx.ast.ident;
+/// Generates validation of every field of a struct or enum variant, leaving
+/// the validated pointers in scope for subsequent field invariants.
+/// A union is checked by invoking this once per field.
+fn derive_variant_is_safe<'a>(
+    ctx: &Ctx,
+    variant_id: &TokenStream,
+    fields: impl IntoIterator<Item = &'a Field>,
+) -> Result<TokenStream, Error> {
+    let fields = fields.into_iter().collect::<Vec<_>>();
+    if fields.is_empty() {
+        return Ok(quote!(true));
+    }
 
-    // All variant structs have a `PhantomData<MyEnum<...>>` field because we
-    // don't know which generic parameters each variant will use, and unused
-    // generic parameters are a compile error.
+    let zerocopy_crate = &ctx.zerocopy_crate;
     let core = ctx.core_path();
-    let phantom_ty = quote! {
-        #core::marker::PhantomData<#enum_name #ty_generics>
-    };
-
-    let variant_structs = data.variants.iter().filter_map(|variant| {
-        // We don't generate variant structs for unit variants because we only
-        // need to check the tag. This helps cut down our generated code a bit.
-        if matches!(variant.fields, Fields::Unit) {
-            return None;
-        }
-
-        let variant_struct_ident = variant_struct_ident(&variant.ident);
-        let field_types = variant.fields.iter().map(|f| &f.ty);
-
-        let variant_struct = parse_quote! {
-            #[repr(C)]
-            struct #variant_struct_ident #impl_generics (
-                #core::mem::MaybeUninit<___ZerocopyInnerTag>,
-                #(#field_types,)*
-                #phantom_ty,
-            ) #where_clause;
-        };
-
-        // We do this rather than emitting `#[derive(::zerocopy::TryFromBytes)]`
-        // because that is not hygienic, and this is also more performant.
-        let try_from_bytes_impl =
-            derive_try_from_bytes(&ctx.with_input(&variant_struct), Trait::TryFromBytes)
-                .expect("derive_try_from_bytes should not fail on synthesized type");
-
-        Some(quote! {
-            #variant_struct
-            #try_from_bytes_impl
-        })
+    let candidate = candidate_ident(ctx);
+    let field_names = fields.iter().enumerate().map(|(idx, field)| {
+        field
+            .ident
+            .as_ref()
+            .map(|name| name.to_token_stream())
+            .unwrap_or_else(|| syn::Index::from(idx).to_token_stream())
     });
-
-    quote! {
-        #(#variant_structs)*
+    let field_checks = field_names
+        .map(|name| {
+            quote! {
+                #zerocopy_crate::into_inner!(
+                    #candidate.project::<
+                        #zerocopy_crate::project_clients::TryFromBytesDerive,
+                        _,
+                        { #variant_id },
+                        { #zerocopy_crate::ident_id!(#name) },
+                    >()
+                ).try_into_safe::<_, #zerocopy_crate::BecauseImmutable>()
+            }
+        })
+        .collect::<Vec<_>>();
+    // Without invariants, no expression needs the validated pointers. Avoid
+    // introducing bindings that could collide with caller-defined items.
+    if ctx.invariant_span.is_none() {
+        return Ok(quote! { true #(&& #field_checks.is_ok())* });
     }
-}
-
-fn variants_union_field_ident(ident: &Ident) -> Ident {
-    // Field names are prefixed with `__field_` to prevent name collision
-    // with the `__nonempty` field.
-    ident!(("__field_{}", ident), ident.span())
-}
-
-fn generate_variants_union(ctx: &Ctx, data: &DataEnum) -> TokenStream {
-    let generics = &ctx.ast.generics;
-    let (_, ty_generics, _) = generics.split_for_impl();
-
-    let fields = data.variants.iter().filter_map(|variant| {
-        // We don't generate variant structs for unit variants because we only
-        // need to check the tag. This helps cut down our generated code a bit.
-        if matches!(variant.fields, Fields::Unit) {
-            return None;
-        }
 
-        let field_name = variants_union_field_ident(&variant.ident);
-        let variant_struct_ident = variant_struct_ident(&variant.ident);
-
-        let core = ctx.core_path();
-        Some(quote! {
-            #field_name: #core::mem::ManuallyDrop<#variant_struct_ident #ty_generics>,
+    let field_bindings = fields
+        .iter()
+        .enumerate()
+        .map(|(idx, _)| ctx.fresh_ident(&format!("field_{}", idx)))
+        .collect::<Vec<_>>();
+    let bound_fields =
+        fields.iter().copied().zip(field_bindings.iter().cloned()).collect::<Vec<_>>();
+    let field_validations = fields
+        .iter()
+        .enumerate()
+        .map(|(idx, field)| {
+            let invariants = crate::invariant::parse(&field.attrs)?;
+            let invariants = invariants
+                .iter()
+                .map(|expression| crate::invariant::bind_fields(&bound_fields[..=idx], expression));
+            Ok(quote! {
+                #(
+                    // Keep `return` in an invariant from bypassing later fields.
+                    if !{ #[inline(always)] || -> #core::primitive::bool { #invariants } }() {
+                        return false;
+                    }
+                )*
+            })
         })
-    });
-
-    let variants_union = parse_quote! {
-        #[repr(C)]
-        union ___ZerocopyVariants #generics {
-            #(#fields)*
-            // Enums can have variants with no fields, but unions must
-            // have at least one field. So we just add a trailing unit
-            // to ensure that this union always has at least one field.
-            // Because this union is `repr(C)`, this unit type does not
-            // affect the layout.
-            __nonempty: (),
+        .collect::<Result<Vec<_>, Error>>()?;
+    Ok(quote! {
+        {
+            #(
+                // Retain each shared pointer for subsequent field invariants.
+                #[allow(unused_variables)]
+                let #field_bindings = match #field_checks {
+                    #core::result::Result::Ok(#field_bindings) => #field_bindings,
+                    #core::result::Result::Err(_) => return false,
+                };
+                #field_validations
+            )*
+            true
         }
-    };
-
-    let has_field =
-        derive_has_field_struct_union(&ctx.with_input(&variants_union), &variants_union.data);
-
-    quote! {
-        #variants_union
-        #has_field
-    }
+    })
 }
 
-/// Generates an implementation of `is_bit_valid` for an arbitrary enum.
-///
-/// The general process is:
-///
-/// 1. Generate a tag enum. This is an enum with the same repr, variants, and
-///    corresponding discriminants as the original enum, but without any fields
-///    on the variants. This gives us access to an enum where the variants have
-///    the same discriminants as the one we're writing `is_bit_valid` for.
-/// 2. Make constants from the variants of the tag enum. We need these because
-///    we can't put const exprs in match arms.
-/// 3. Generate variant structs. These are structs which have the same fields as
-///    each variant of the enum, and are `#[repr(C)]` with an optional "inner
-///    tag".
-/// 4. Generate a variants union, with one field for each variant struct type.
-/// 5. And finally, our raw enum is a `#[repr(C)]` struct of an "outer tag" and
-///    the variants union.
+/// Generates an implementation of `is_safe` for an arbitrary enum.
 ///
-/// See these reference links for fully-worked example decompositions.
-///
-/// - `repr(C)`: <https://doc.rust-lang.org/reference/type-layout.html#reprc-enums-with-fields>
-/// - `repr(int)`: <https://doc.rust-lang.org/reference/type-layout.html#primitive-representation-of-enums-with-fields>
-/// - `repr(C, int)`: <https://doc.rust-lang.org/reference/type-layout.html#combining-primitive-representations-of-enums-with-fields-and-reprc>
-pub(crate) fn derive_is_bit_valid(
+/// For an enum with fields, [`derive_enum`] generates the representation model
+/// and projection impls. This function reads the tag, matches it against the
+/// enum's discriminants, and validates each field of the selected variant
+/// through those projections. A fieldless enum needs only the generated tag
+/// enum and discriminant constants.
+pub(crate) fn derive_is_safe(
     ctx: &Ctx,
     data: &DataEnum,
     repr: &EnumRepr,
 ) -> Result<TokenStream, Error> {
-    let trait_path = Trait::TryFromBytes.crate_path(ctx);
-    let tag_enum = generate_tag_enum(ctx, repr, data);
-    let tag_consts = generate_tag_consts(data);
-
-    let (outer_tag_type, inner_tag_type) = if repr.is_c() {
-        (quote! { ___ZerocopyTag }, quote! { () })
-    } else if repr.is_primitive() {
-        (quote! { () }, quote! { ___ZerocopyTag })
-    } else {
+    if !(repr.is_c() || repr.is_primitive()) {
         return Err(Error::new(
             ctx.ast.span(),
             "must have #[repr(C)] or #[repr(Int)] attribute in order to guarantee this type's memory layout",
         ));
-    };
-
-    let variant_structs = generate_variant_structs(ctx, data);
-    let variants_union = generate_variants_union(ctx, data);
-
-    let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
+    }
 
     let zerocopy_crate = &ctx.zerocopy_crate;
-    let has_tag = ImplBlockBuilder::new(ctx, data, Trait::HasTag, FieldBounds::None)
-        .inner_extras(quote! {
-            type Tag = ___ZerocopyTag;
-            type ProjectToTag = #zerocopy_crate::pointer::cast::CastSized;
-        })
-        .build();
-    let has_fields = data.variants().into_iter().flat_map(|(variant, fields)| {
-        let variant_ident = &variant.unwrap().ident;
-        let variants_union_field_ident = variants_union_field_ident(variant_ident);
-        let field: Box<syn::Type> = parse_quote!(());
-        fields.into_iter().enumerate().map(move |(idx, (vis, ident, ty))| {
-            // Rust does not presently support explicit visibility modifiers on
-            // enum fields, but we guard against the possibility to ensure this
-            // derive remains sound.
-            assert!(matches!(vis, syn::Visibility::Inherited));
-            let variant_struct_field_index = Index::from(idx + 1);
-            let (_, ty_generics, _) = ctx.ast.generics.split_for_impl();
-            let has_field_trait = Trait::HasField {
-                variant_id: parse_quote!({ #zerocopy_crate::ident_id!(#variant_ident) }),
-                // Since Rust does not presently support explicit visibility
-                // modifiers on enum fields, any public type is suitable here;
-                // we use `()`.
-                field: field.clone(),
-                field_id: parse_quote!({ #zerocopy_crate::ident_id!(#ident) }),
-            };
-            let has_field_path = has_field_trait.crate_path(ctx);
-            let has_field = ImplBlockBuilder::new(
-                ctx,
-                data,
-                has_field_trait,
-                FieldBounds::None,
-            )
-            .inner_extras(quote! {
-                type Type = #ty;
+    let core = ctx.core_path();
+    let candidate = candidate_ident(ctx);
+    let alignment = ctx.fresh_ident("___ZcAlignment");
+    let tag = Ident::new("tag", Span::mixed_site());
+    let projections = if data.fields().is_empty() {
+        let tag_enum = generate_tag_enum(ctx, repr, data);
+        let tag_consts = generate_tag_consts(data);
+        quote! {
+            #tag_enum
 
-                #[inline(always)]
-                fn project(slf: #zerocopy_crate::pointer::PtrInner<'_, Self>) -> *mut <Self as #has_field_path>::Type {
-                    use #zerocopy_crate::pointer::cast::{CastSized, Projection};
+            type ___ZerocopyTagPrimitive = #zerocopy_crate::util::macro_util::SizeToTag<
+                { #core::mem::size_of::<___ZerocopyTag>() },
+            >;
 
-                    slf.project::<___ZerocopyRawEnum #ty_generics, CastSized>()
-                        .project::<_, Projection<_, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(variants) }>>()
-                        .project::<_, Projection<_, { #zerocopy_crate::REPR_C_UNION_VARIANT_ID }, { #zerocopy_crate::ident_id!(#variants_union_field_ident) }>>()
-                        .project::<_, Projection<_, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(value) }>>()
-                        .project::<_, Projection<_, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(#variant_struct_field_index) }>>()
-                        .as_ptr()
-                }
-            })
-            .build();
+            #tag_consts
+        }
+    } else {
+        derive_enum(ctx, data, Client::TryFromBytesDerive)?
+    };
 
-            let project = ImplBlockBuilder::new(
-                ctx,
-                data,
-                Trait::ProjectField {
-                    variant_id: parse_quote!({ #zerocopy_crate::ident_id!(#variant_ident) }),
-                    // Since Rust does not presently support explicit visibility
-                    // modifiers on enum fields, any public type is suitable
-                    // here; we use `()`.
-                    field: field.clone(),
-                    field_id: parse_quote!({ #zerocopy_crate::ident_id!(#ident) }),
-                    invariants: parse_quote!((Aliasing, Alignment, #zerocopy_crate::invariant::Initialized)),
-                },
-                FieldBounds::None,
-            )
-            .param_extras(vec![
-                parse_quote!(Aliasing: #zerocopy_crate::invariant::Aliasing),
-                parse_quote!(Alignment: #zerocopy_crate::invariant::Alignment),
-            ])
-            .inner_extras(quote! {
-                type Error = #zerocopy_crate::util::macro_util::core_reexport::convert::Infallible;
-                type Invariants = (Aliasing, Alignment, #zerocopy_crate::invariant::Initialized);
+    let match_arms = data
+        .variants
+        .iter()
+        .enumerate()
+        .map(|(idx, variant)| {
+            let name = &variant.ident;
+            let variant_id = quote! { #zerocopy_crate::ident_id!(#name) };
+            let fields_is_safe = derive_variant_is_safe(ctx, &variant_id, &variant.fields)?;
+            let pattern = if ctx.invariant_span.is_some() {
+                quote! { #core::option::Option::Some(#idx) }
+            } else {
+                tag_ident(name).to_token_stream()
+            };
+            Ok(quote! {
+                #pattern => { #fields_is_safe }
             })
-            .build();
-
-            quote! {
-                #has_field
-                #project
-            }
         })
-    });
+        .collect::<Result<Vec<_>, Error>>()?;
 
-    let core = ctx.core_path();
-    let match_arms = data.variants.iter().map(|variant| {
-        let tag_ident = tag_ident(&variant.ident);
-        let variant_struct_ident = variant_struct_ident(&variant.ident);
-        let variants_union_field_ident = variants_union_field_ident(&variant.ident);
-
-        if matches!(variant.fields, Fields::Unit) {
-            // Unit variants don't need any further validation beyond checking
-            // the tag.
-            quote! {
-                #tag_ident => true
-            }
-        } else {
-            quote! {
-                #tag_ident => {
-                    // SAFETY: Since we know that the tag is `#tag_ident`, we
-                    // know that no other `&`s exist which refer to this enum
-                    // as any other variant.
-                    let variant_md = variants.cast::<
-                        _,
-                        #zerocopy_crate::pointer::cast::Projection<
-                            // #zerocopy_crate::ReadOnly<_>,
-                            _,
-                            { #zerocopy_crate::REPR_C_UNION_VARIANT_ID },
-                            { #zerocopy_crate::ident_id!(#variants_union_field_ident) }
-                        >,
-                        _
-                    >();
-                    let variant = variant_md.cast::<
-                        #zerocopy_crate::ReadOnly<#variant_struct_ident #ty_generics>,
-                        #zerocopy_crate::pointer::cast::CastSized,
-                        (#zerocopy_crate::pointer::BecauseRead, _)
-                    >();
-                    <
-                        #variant_struct_ident #ty_generics as #trait_path
-                    >::is_bit_valid(variant)
+    let read_tag = quote! {
+        let #tag = #candidate
+            .reborrow()
+            .cast::<
+                ___ZerocopyTagPrimitive,
+                #zerocopy_crate::pointer::cast::CastSized,
+                (#zerocopy_crate::pointer::BecauseRead, _),
+            >()
+            .recall_validity::<_, (_, (_, _))>()
+            .read::<#zerocopy_crate::BecauseImmutable>();
+    };
+    let tag_init = if ctx.invariant_span.is_some() {
+        let allow = crate::util::allow_generated_code();
+        let tag_arms = data.variants.iter().enumerate().map(|(idx, variant)| {
+            let tag = tag_ident(&variant.ident);
+            quote! { #tag => #core::option::Option::Some(#idx) }
+        });
+        quote! {
+            // Keep implementation-only items and their lint allowances out
+            // of the scopes containing caller-authored invariant expressions.
+            #allow
+            let #tag = {
+                #projections
+                #read_tag
+                match #tag {
+                    #(#tag_arms,)*
+                    _ => #core::option::Option::None,
                 }
-            }
-        }
-    });
-
-    let generics = &ctx.ast.generics;
-    let raw_enum: DeriveInput = parse_quote! {
-        #[repr(C)]
-        struct ___ZerocopyRawEnum #generics {
-            tag: ___ZerocopyOuterTag,
-            variants: ___ZerocopyVariants #ty_generics,
+            };
         }
-    };
-
-    let self_ident = &ctx.ast.ident;
-    let invariants_eq_impl = quote! {
-        // SAFETY: `___ZerocopyRawEnum` is designed to have the same layout,
-        // validity, and invariants as `Self`.
-        unsafe impl #impl_generics #zerocopy_crate::pointer::InvariantsEq<___ZerocopyRawEnum #ty_generics> for #self_ident #ty_generics #where_clause {}
-    };
-
-    let raw_enum_projections =
-        derive_has_field_struct_union(&ctx.with_input(&raw_enum), &raw_enum.data);
-
-    let raw_enum = quote! {
-        #raw_enum
-        #invariants_eq_impl
-        #raw_enum_projections
+    } else {
+        quote! { #projections #read_tag }
     };
 
     Ok(quote! {
-        // SAFETY: We use `is_bit_valid` to validate that the bit pattern of the
+        // SAFETY: We use `is_safe` to validate that the bit pattern of the
         // enum's tag corresponds to one of the enum's discriminants. Then, we
         // check the bit validity of each field of the corresponding variant.
-        // Thus, this is a sound implementation of `is_bit_valid`.
+        // Thus, this is a sound implementation of `is_safe`.
         #[inline]
-        fn is_bit_valid<___ZcAlignment>(
-            mut candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+        fn is_safe<#alignment>(
+            mut #candidate: #zerocopy_crate::Maybe<'_, Self, #alignment>,
         ) -> #core::primitive::bool
         where
-            ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+            #alignment: #zerocopy_crate::invariant::Alignment,
         {
-            #tag_enum
-
-            type ___ZerocopyTagPrimitive = #zerocopy_crate::util::macro_util::SizeToTag<
-                { #core::mem::size_of::<___ZerocopyTag>() },
-            >;
-
-            #tag_consts
-
-            type ___ZerocopyOuterTag = #outer_tag_type;
-            type ___ZerocopyInnerTag = #inner_tag_type;
+            #tag_init
 
-            #variant_structs
-
-            #variants_union
-
-            #raw_enum
-
-            #has_tag
-
-            #(#has_fields)*
-
-            let tag = {
-                // SAFETY:
-                // - The provided cast addresses a subset of the bytes addressed
-                //   by `candidate` because it addresses the starting tag of the
-                //   enum.
-                // - Because the pointer is cast from `candidate`, it has the
-                //   same provenance as it.
-                // - There are no `UnsafeCell`s in the tag because it is a
-                //   primitive integer.
-                // - `tag_ptr` is casted from `candidate`, whose referent is
-                //   `Initialized`. Since we have not written uninitialized
-                //   bytes into the referent, `tag_ptr` is also `Initialized`.
-                //
-                // FIXME(#2874): Revise this to a `cast` once `candidate`
-                // references a `ReadOnly<Self>`.
-                let tag_ptr = unsafe {
-                    candidate.reborrow().project_transmute_unchecked::<
-                        _,
-                        #zerocopy_crate::invariant::Initialized,
-                        #zerocopy_crate::pointer::cast::CastSized
-                    >()
-                };
-                tag_ptr.recall_validity::<_, (_, (_, _))>().read::<#zerocopy_crate::BecauseImmutable>()
-            };
-
-            let mut raw_enum = candidate.cast::<
-                #zerocopy_crate::ReadOnly<___ZerocopyRawEnum #ty_generics>,
-                #zerocopy_crate::pointer::cast::CastSized,
-                (#zerocopy_crate::pointer::BecauseRead, _)
-            >();
-
-            let variants = #zerocopy_crate::into_inner!(raw_enum.project::<
-                _,
-                { #zerocopy_crate::STRUCT_VARIANT_ID },
-                { #zerocopy_crate::ident_id!(variants) }
-            >());
-
-            match tag {
+            match #tag {
                 #(#match_arms,)*
                 _ => false,
             }
@@ -447,219 +229,88 @@ pub(crate) fn derive_try_from_bytes(ctx: &Ctx, top_level: Trait) -> Result<Token
     match &ctx.ast.data {
         Data::Struct(strct) => derive_try_from_bytes_struct(ctx, strct, top_level),
         Data::Enum(enm) => derive_try_from_bytes_enum(ctx, enm, top_level),
-        Data::Union(unn) => Ok(derive_try_from_bytes_union(ctx, unn, top_level)),
-    }
-}
-fn derive_has_field_struct_union(ctx: &Ctx, data: &dyn DataExt) -> TokenStream {
-    let fields = ctx.ast.data.fields();
-    if fields.is_empty() {
-        return quote! {};
+        Data::Union(unn) => derive_try_from_bytes_union(ctx, unn, top_level),
     }
-
-    let field_tokens = fields.iter().map(|(vis, ident, _)| {
-        let ident = ident!(("__z{}", ident), ident.span());
-        quote!(
-            #vis enum #ident {}
-        )
-    });
-
-    let zerocopy_crate = &ctx.zerocopy_crate;
-    let variant_id: Box<Expr> = match &ctx.ast.data {
-        Data::Struct(_) => parse_quote!({ #zerocopy_crate::STRUCT_VARIANT_ID }),
-        Data::Union(_) => {
-            let is_repr_c = StructUnionRepr::from_attrs(&ctx.ast.attrs)
-                .map(|repr| repr.is_c())
-                .unwrap_or(false);
-            if is_repr_c {
-                parse_quote!({ #zerocopy_crate::REPR_C_UNION_VARIANT_ID })
-            } else {
-                parse_quote!({ #zerocopy_crate::UNION_VARIANT_ID })
-            }
-        }
-        _ => unreachable!(),
-    };
-
-    let core = ctx.core_path();
-    let has_tag = ImplBlockBuilder::new(ctx, data, Trait::HasTag, FieldBounds::None)
-        .inner_extras(quote! {
-            type Tag = ();
-            type ProjectToTag = #zerocopy_crate::pointer::cast::CastToUnit;
-        })
-        .build();
-    let has_fields = fields.iter().map(move |(_, ident, ty)| {
-        let field_token = ident!(("__z{}", ident), ident.span());
-        let field: Box<Type> = parse_quote!(#field_token);
-        let field_id: Box<Expr> = parse_quote!({ #zerocopy_crate::ident_id!(#ident) });
-        let has_field_trait = Trait::HasField {
-                variant_id: variant_id.clone(),
-                field: field.clone(),
-                field_id: field_id.clone(),
-            };
-            let has_field_path = has_field_trait.crate_path(ctx);
-            ImplBlockBuilder::new(
-                ctx,
-                data,
-                has_field_trait,
-                FieldBounds::None,
-            )
-            .inner_extras(quote! {
-                type Type = #ty;
-
-                #[inline(always)]
-                fn project(slf: #zerocopy_crate::pointer::PtrInner<'_, Self>) -> *mut <Self as #has_field_path>::Type {
-                    let slf = slf.as_ptr();
-                    // SAFETY: By invariant on `PtrInner`, `slf` is a non-null
-                    // pointer whose referent is zero-sized or lives in a valid
-                    // allocation. Since `#ident` is a struct or union field of
-                    // `Self`, this projection preserves or shrinks the referent
-                    // size, and so the resulting referent also fits in the same
-                    // allocation.
-                    unsafe { #core::ptr::addr_of_mut!((*slf).#ident) }
-                }
-            }).outer_extras(if matches!(&ctx.ast.data, Data::Struct(..)) {
-            let fields_preserve_alignment = StructUnionRepr::from_attrs(&ctx.ast.attrs)
-                .map(|repr| repr.get_packed().is_none())
-                .unwrap();
-            let alignment = if fields_preserve_alignment {
-                quote! { Alignment }
-            } else {
-                quote! { #zerocopy_crate::invariant::Unaligned }
-            };
-            // SAFETY: See comments on items.
-            ImplBlockBuilder::new(
-                ctx,
-                data,
-                Trait::ProjectField {
-                    variant_id: variant_id.clone(),
-                    field,
-                    field_id,
-                    invariants: parse_quote!((Aliasing, Alignment, #zerocopy_crate::invariant::Initialized)),
-                },
-                FieldBounds::None,
-            )
-            .param_extras(vec![
-                parse_quote!(Aliasing: #zerocopy_crate::invariant::Aliasing),
-                parse_quote!(Alignment: #zerocopy_crate::invariant::Alignment),
-            ])
-            .inner_extras(quote! {
-                // SAFETY: Projection into structs is always infallible.
-                type Error = #zerocopy_crate::util::macro_util::core_reexport::convert::Infallible;
-                // SAFETY: The alignment of the projected `Ptr` is `Unaligned`
-                // if the structure is packed; otherwise inherited from the
-                // outer `Ptr`. If the validity of the outer pointer is
-                // `Initialized`, so too is the validity of its fields.
-                type Invariants = (Aliasing, #alignment, #zerocopy_crate::invariant::Initialized);
-            })
-            .build()
-        } else {
-            quote! {}
-        })
-        .build()
-    });
-
-    const_block(field_tokens.into_iter().chain(Some(has_tag)).chain(has_fields).map(Some))
 }
 fn derive_try_from_bytes_struct(
     ctx: &Ctx,
     strct: &DataStruct,
     top_level: Trait,
 ) -> Result<TokenStream, Error> {
-    let extras = try_gen_trivial_is_bit_valid(ctx, top_level).unwrap_or_else(|| {
+    let extras = if let Some(extras) = try_gen_trivial_is_safe(ctx, top_level) {
+        extras
+    } else {
         let zerocopy_crate = &ctx.zerocopy_crate;
-        let fields = strct.fields();
-        let field_names = fields.iter().map(|(_vis, name, _ty)| name);
-        let field_tys = fields.iter().map(|(_vis, _name, ty)| ty);
+        let variant_id = quote! { #zerocopy_crate::STRUCT_VARIANT_ID };
+        let fields_is_safe = derive_variant_is_safe(ctx, &variant_id, &strct.fields)?;
         let core = ctx.core_path();
+        let candidate = candidate_ident(ctx);
+        let alignment = ctx.fresh_ident("___ZcAlignment");
         quote!(
-            // SAFETY: We use `is_bit_valid` to validate that each field is
-            // bit-valid, and only return `true` if all of them are. The bit
-            // validity of a struct is just the composition of the bit
-            // validities of its fields, so this is a sound implementation
-            // of `is_bit_valid`.
+            // SAFETY: We use `is_safe` to validate that each field is bit-valid,
+            // and only return `true` if all of them are. The bit validity of a
+            // struct is just the composition of the bit validities of its
+            // fields, so this is a sound implementation of `is_safe`.
             #[inline]
-            fn is_bit_valid<___ZcAlignment>(
-                mut candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+            fn is_safe<#alignment>(
+                mut #candidate: #zerocopy_crate::Maybe<'_, Self, #alignment>,
             ) -> #core::primitive::bool
             where
-                ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+                #alignment: #zerocopy_crate::invariant::Alignment,
             {
-                true #(&& {
-                    let field_candidate =   #zerocopy_crate::into_inner!(candidate.reborrow().project::<
-                        _,
-                        { #zerocopy_crate::STRUCT_VARIANT_ID },
-                        { #zerocopy_crate::ident_id!(#field_names) }
-                    >());
-                    <#field_tys as #zerocopy_crate::TryFromBytes>::is_bit_valid(field_candidate)
-                })*
+                #fields_is_safe
             }
         )
-    });
+    };
     Ok(ImplBlockBuilder::new(ctx, strct, Trait::TryFromBytes, FieldBounds::ALL_SELF)
         .inner_extras(extras)
-        .outer_extras(derive_has_field_struct_union(ctx, strct))
+        .outer_extras(derive_projection_struct_union(ctx, strct, Client::TryFromBytesDerive))
         .build())
 }
-fn derive_try_from_bytes_union(ctx: &Ctx, unn: &DataUnion, top_level: Trait) -> TokenStream {
+fn derive_try_from_bytes_union(
+    ctx: &Ctx,
+    unn: &DataUnion,
+    top_level: Trait,
+) -> Result<TokenStream, Error> {
     let field_type_trait_bounds = FieldBounds::All(&[TraitBound::Slf]);
 
     let zerocopy_crate = &ctx.zerocopy_crate;
-    let variant_id: Box<Expr> = {
-        let is_repr_c =
-            StructUnionRepr::from_attrs(&ctx.ast.attrs).map(|repr| repr.is_c()).unwrap_or(false);
-        if is_repr_c {
-            parse_quote!({ #zerocopy_crate::REPR_C_UNION_VARIANT_ID })
-        } else {
-            parse_quote!({ #zerocopy_crate::UNION_VARIANT_ID })
-        }
-    };
-
-    let extras = try_gen_trivial_is_bit_valid(ctx, top_level).unwrap_or_else(|| {
-        let fields = unn.fields();
-        let field_names = fields.iter().map(|(_vis, name, _ty)| name);
-        let field_tys = fields.iter().map(|(_vis, _name, ty)| ty);
+    let union_variant_id = struct_union_variant_id(ctx).to_token_stream();
+    let extras = if let Some(extras) = try_gen_trivial_is_safe(ctx, top_level) {
+        extras
+    } else {
+        let fields_is_safe = unn
+            .fields
+            .named
+            .iter()
+            .map(|field| derive_variant_is_safe(ctx, &union_variant_id, [field]))
+            .collect::<Result<Vec<_>, _>>()?;
         let core = ctx.core_path();
+        let candidate = candidate_ident(ctx);
+        let alignment = ctx.fresh_ident("___ZcAlignment");
         quote!(
-            // SAFETY: We use `is_bit_valid` to validate that any field is
-            // bit-valid; we only return `true` if at least one of them is.
-            // The bit validity of a union is not yet well defined in Rust,
-            // but it is guaranteed to be no more strict than this
-            // definition. See #696 for a more in-depth discussion.
+            // SAFETY: We use `is_safe` to validate that any field is bit-valid;
+            // we only return `true` if at least one of them is and its
+            // invariants also hold. The bit validity of a union is not yet
+            // well defined in Rust, but it is guaranteed to be no more strict
+            // than this definition. See #696 for a more in-depth discussion.
             #[inline]
-            fn is_bit_valid<___ZcAlignment>(
-                mut candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+            fn is_safe<#alignment>(
+                mut #candidate: #zerocopy_crate::Maybe<'_, Self, #alignment>,
             ) -> #core::primitive::bool
             where
-                ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+                #alignment: #zerocopy_crate::invariant::Alignment,
             {
-                false #(|| {
-                    // SAFETY:
-                    // - Since `ReadOnly<Self>: Immutable` unconditionally,
-                    //   neither `*slf` nor the returned pointer's referent
-                    //   permit interior mutation.
-                    // - Both source and destination validity are
-                    //   `Initialized`, which is always a sound
-                    //   transmutation.
-                    let field_candidate = unsafe {
-                        candidate.reborrow().project_transmute_unchecked::<
-                            _,
-                            _,
-                            #zerocopy_crate::pointer::cast::Projection<
-                                _,
-                                #variant_id,
-                                { #zerocopy_crate::ident_id!(#field_names) }
-                            >
-                        >()
-                    };
-
-                    <#field_tys as #zerocopy_crate::TryFromBytes>::is_bit_valid(field_candidate)
-                })*
+                // Keep each field's bindings and early returns local to that
+                // field, so a failure lets validation try the next field.
+                false #(|| { #[inline(always)] || { #fields_is_safe } }())*
             }
         )
-    });
-    ImplBlockBuilder::new(ctx, unn, Trait::TryFromBytes, field_type_trait_bounds)
+    };
+    Ok(ImplBlockBuilder::new(ctx, unn, Trait::TryFromBytes, field_type_trait_bounds)
         .inner_extras(extras)
-        .outer_extras(derive_has_field_struct_union(ctx, unn))
-        .build()
+        .outer_extras(derive_projection_struct_union(ctx, unn, Client::TryFromBytesDerive))
+        .build())
 }
 fn derive_try_from_bytes_enum(
     ctx: &Ctx,
@@ -677,16 +328,15 @@ fn derive_try_from_bytes_enum(
         .map(|size| enm.fields().is_empty() && enm.variants.len() == 1usize << size)
         .unwrap_or(false);
 
-    let trivial_is_bit_valid = try_gen_trivial_is_bit_valid(ctx, top_level);
-    let extra = match (trivial_is_bit_valid, could_be_from_bytes) {
-        (Some(is_bit_valid), _) => is_bit_valid,
+    let trivial_is_safe = try_gen_trivial_is_safe(ctx, top_level);
+    let extra = match (trivial_is_safe, could_be_from_bytes) {
+        (Some(is_safe), _) => is_safe,
         // SAFETY: It would be sound for the enum to implement `FromBytes`, as
-        // required by `gen_trivial_is_bit_valid_unchecked`.
-        (None, true) => unsafe { gen_trivial_is_bit_valid_unchecked(ctx) },
-        (None, false) => match derive_is_bit_valid(ctx, enm, &repr) {
+        // required by `gen_trivial_is_safe_unchecked`.
+        (None, true) => unsafe { gen_trivial_is_safe_unchecked(ctx) },
+        (None, false) => match derive_is_safe(ctx, enm, &repr) {
             Ok(extra) => extra,
-            Err(_) if ctx.skip_on_error => return Ok(TokenStream::new()),
-            Err(e) => return Err(e),
+            Err(e) => return ctx.error_or_skip(e),
         },
     };
 
@@ -694,15 +344,14 @@ fn derive_try_from_bytes_enum(
         .inner_extras(extra)
         .build())
 }
-fn try_gen_trivial_is_bit_valid(ctx: &Ctx, top_level: Trait) -> Option<proc_macro2::TokenStream> {
+fn try_gen_trivial_is_safe(ctx: &Ctx, top_level: Trait) -> Option<proc_macro2::TokenStream> {
     // If the top-level trait is `FromBytes` and `Self` has no type parameters,
     // then the `FromBytes` derive will fail compilation if `Self` is not
-    // actually soundly `FromBytes`, and so we can rely on that for our
-    // `is_bit_valid` impl. It's plausible that we could make changes - or Rust
-    // could make changes (such as the "trivial bounds" language feature) - that
-    // make this no longer true. To hedge against these, we include an explicit
-    // `Self: FromBytes` check in the generated `is_bit_valid`, which is
-    // bulletproof.
+    // actually soundly `FromBytes`, and so we can rely on that for our `is_safe`
+    // impl. It's plausible that we could make changes - or Rust could make
+    // changes (such as the "trivial bounds" language feature) - that make this
+    // no longer true. To hedge against these, we include an explicit `Self:
+    // FromBytes` check in the generated `is_safe`, which is bulletproof.
     //
     // If `ctx.skip_on_error` is true, we can't rely on the `FromBytes` derive
     // to fail compilation if `Self` is not actually soundly `FromBytes`.
@@ -715,7 +364,7 @@ fn try_gen_trivial_is_bit_valid(ctx: &Ctx, top_level: Trait) -> Option<proc_macr
         Some(quote!(
             // SAFETY: See inline.
             #[inline(always)]
-            fn is_bit_valid<___ZcAlignment>(
+            fn is_safe<___ZcAlignment>(
                 _candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
             ) -> #core::primitive::bool
             where
@@ -746,14 +395,14 @@ fn assert_is_from_bytes<T>()
 /// # Safety
 ///
 /// All initialized bit patterns must be valid for `Self`.
-unsafe fn gen_trivial_is_bit_valid_unchecked(ctx: &Ctx) -> proc_macro2::TokenStream {
+unsafe fn gen_trivial_is_safe_unchecked(ctx: &Ctx) -> proc_macro2::TokenStream {
     let zerocopy_crate = &ctx.zerocopy_crate;
     let core = ctx.core_path();
     quote!(
-        // SAFETY: The caller of `gen_trivial_is_bit_valid_unchecked` has
-        // promised that all initialized bit patterns are valid for `Self`.
+        // SAFETY: The caller of `gen_trivial_is_safe_unchecked` has promised
+        // that all initialized bit patterns are valid for `Self`.
         #[inline(always)]
-        fn is_bit_valid<___ZcAlignment>(
+        fn is_safe<___ZcAlignment>(
             _candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
         ) -> #core::primitive::bool
         where
@@ -763,3 +412,43 @@ fn is_bit_valid<___ZcAlignment>(
         }
     )
 }
+
+#[cfg(test)]
+mod tests {
+    use syn::{parse_quote, DeriveInput};
+
+    use super::*;
+
+    fn derive_error(input: DeriveInput) -> String {
+        let ctx = Ctx::try_from_derive_input(input).unwrap();
+        match derive_try_from_bytes(&ctx, Trait::TryFromBytes) {
+            Ok(_) => panic!("expected derive to reject conflicting representations"),
+            Err(error) => error.to_string(),
+        }
+    }
+
+    #[test]
+    fn raw_repr_conflict_matches_ordinary_repr() {
+        let ordinary = derive_error(parse_quote! {
+            #[repr(C, align(8))]
+            #[repr(u8)]
+            enum Packet {
+                Value(core::num::NonZeroU8),
+                End,
+            }
+        });
+        let raw = derive_error(parse_quote! {
+            #[repr(C, align(8))]
+            #[r#repr(r#u8)]
+            enum Packet {
+                Value(core::num::NonZeroU8),
+                End,
+            }
+        });
+
+        // Rejecting both spellings prevents generating a validator whose
+        // synthetic enum layout disagrees with the compiler's actual layout.
+        assert_eq!(ordinary, "this conflicts with another representation hint");
+        assert_eq!(ordinary, raw);
+    }
+}
diff --git a/rust/zerocopy-derive/invariant.rs b/rust/zerocopy-derive/invariant.rs
new file mode 100644
index 000000000000..f7a1a617e378
--- /dev/null
+++ b/rust/zerocopy-derive/invariant.rs
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+//
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use proc_macro2::{Ident, Span, TokenStream, TokenTree};
+use quote::{quote, ToTokens as _};
+use syn::{
+    punctuated::Punctuated, spanned::Spanned as _, Attribute, Data, DeriveInput, Error, Expr,
+    Field, MacroDelimiter, Meta, Token,
+};
+
+use crate::util::path_is_ident;
+
+/// Parses field invariants in attribute order.
+pub(crate) fn parse(attrs: &[Attribute]) -> Result<Vec<Expr>, Error> {
+    let mut invariants = Vec::new();
+    for attr in attrs.iter().filter(|attr| path_is_ident(attr.path(), "zerocopy")) {
+        let options = attr.parse_args_with(Punctuated::<Meta, Token![,]>::parse_terminated)?;
+        for option in options {
+            if !path_is_ident(option.path(), "invariant") {
+                return Err(Error::new_spanned(option, "expected `invariant(...)`"));
+            }
+            match option {
+                Meta::List(list) if matches!(list.delimiter, MacroDelimiter::Paren(_)) => {
+                    invariants.push(list.parse_args::<Expr>()?)
+                }
+                other => return Err(Error::new_spanned(other, "expected `invariant(...)`")),
+            }
+        }
+    }
+    Ok(invariants)
+}
+
+/// Validates invariant syntax and placement, returning the first invariant's
+/// span so derives which cannot honor invariants can reject them.
+pub(crate) fn validate(ast: &DeriveInput) -> Result<Option<Span>, Error> {
+    let fields: Vec<&Field> = match &ast.data {
+        Data::Struct(data) => data.fields.iter().collect(),
+        Data::Enum(data) => {
+            for variant in &data.variants {
+                if let Some(invariant) = parse(&variant.attrs)?.first() {
+                    return Err(Error::new(
+                        invariant.span(),
+                        "invariants are only supported on named fields",
+                    ));
+                }
+            }
+            data.variants.iter().flat_map(|variant| &variant.fields).collect()
+        }
+        Data::Union(data) => data.fields.named.iter().collect(),
+    };
+    let mut first = None;
+    for field in fields {
+        if let Some(invariant) = parse(&field.attrs)?.first() {
+            if field.ident.is_none() {
+                return Err(Error::new(
+                    invariant.span(),
+                    "invariants are only supported on named fields",
+                ));
+            }
+            first.get_or_insert(invariant.span());
+        }
+    }
+    Ok(first)
+}
+
+/// Visits identifiers, including those inside macro arguments.
+pub(crate) fn idents(tokens: TokenStream) -> Vec<Ident> {
+    tokens
+        .into_iter()
+        .flat_map(|token| match token {
+            TokenTree::Ident(ident) => vec![ident],
+            TokenTree::Group(group) => idents(group.stream()),
+            _ => Vec::new(),
+        })
+        .collect()
+}
+
+/// Binds semantic field names in every syntax context used by the expression.
+/// Preserve the expression's tokens so its other names retain their hygiene.
+pub(crate) fn bind_fields(fields: &[(&Field, Ident)], expression: &Expr) -> TokenStream {
+    let mut body = expression.to_token_stream();
+    let references = idents(body.clone());
+    for (field, binding) in fields {
+        let name = match &field.ident {
+            Some(name) => name,
+            None => continue,
+        };
+        let spelling = name.to_string();
+        let spelling = spelling.trim_start_matches("r#");
+        // Also support references produced by a macro invoked by the expression.
+        let mut call_site = name.clone();
+        call_site.set_span(Span::call_site());
+        for alias in [name.clone(), call_site].into_iter().chain(
+            references
+                .iter()
+                .filter(|ident| ident.to_string().trim_start_matches("r#") == spelling)
+                .cloned(),
+        ) {
+            body = quote! {{
+                // Require a binding; reject names Rust would resolve as constant
+                // patterns. Item aliases could capture helper calls in macros.
+                #[allow(unused_variables, non_snake_case, clippy::redundant_pattern)]
+                let #alias @ _ = #binding;
+                #body
+            }};
+        }
+    }
+    body
+}
diff --git a/rust/zerocopy-derive/lib.rs b/rust/zerocopy-derive/lib.rs
index d387de368367..c650b59eaa82 100644
--- a/rust/zerocopy-derive/lib.rs
+++ b/rust/zerocopy-derive/lib.rs
@@ -28,6 +28,10 @@
 #![allow(clippy::type_complexity)]
 // Inlining format args isn't supported on our MSRV.
 #![allow(clippy::uninlined_format_args)]
+// `cargo-zerocopy` supplies this cfg for pinned-nightly tests. During UI tests,
+// `testutil::UiTestRunner` explicitly supplies it to the host-built proc macro;
+// ordinary `RUSTFLAGS` are not sufficient when Cargo receives `--target`.
+#![cfg_attr(__ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS, feature(proc_macro_def_site))]
 #![deny(
     rustdoc::bare_urls,
     rustdoc::broken_intra_doc_links,
@@ -46,6 +50,7 @@ macro_rules! ident {
 }
 
 mod derive;
+mod invariant;
 #[cfg(test)]
 mod output_tests;
 mod repr;
@@ -79,7 +84,8 @@ macro_rules! ident {
 /// are currently required to live at the crate root, and so the caller must
 /// specify the name in order to avoid name collisions.
 macro_rules! derive {
-    ($trait:ident => $outer:ident => $inner:path) => {
+    ($(#[$attr:meta])* $trait:ident => $outer:ident => $inner:path) => {
+        $(#[$attr])*
         #[proc_macro_derive($trait, attributes(zerocopy))]
         pub fn $outer(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
             let ast = syn::parse_macro_input!(ts as DeriveInput);
@@ -88,10 +94,13 @@ pub fn $outer(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
                 Err(e) => return e.into_compile_error().into(),
             };
             let ts = $inner(&ctx, Trait::$trait).into_ts();
-            // We wrap in `const_block` as a backstop in case any derive fails
-            // to wrap its output in `const_block` (and thus fails to annotate)
-            // with the full set of `#[allow(...)]` attributes).
-            let ts = const_block([Some(ts)]);
+            // Apply generated-code lint allowances as a backstop, except
+            // around caller-authored invariant expressions.
+            let ts = if matches!(Trait::$trait, Trait::TryFromBytes) {
+                ctx.const_block([Some(ts)])
+            } else {
+                const_block([Some(ts)])
+            };
             #[cfg(test)]
             crate::util::testutil::check_hygiene(ts.clone());
             ts.into()
@@ -120,6 +129,7 @@ fn into_ts(self) -> proc_macro2::TokenStream {
 
 derive!(KnownLayout => derive_known_layout => crate::derive::known_layout::derive);
 derive!(Immutable => derive_immutable => crate::derive::derive_immutable);
+derive!(#[doc(hidden)] Project => derive_project => crate::derive::project::derive);
 derive!(TryFromBytes => derive_try_from_bytes => crate::derive::try_from_bytes::derive_try_from_bytes);
 derive!(FromZeros => derive_from_zeros => crate::derive::from_bytes::derive_from_zeros);
 derive!(FromBytes => derive_from_bytes => crate::derive::from_bytes::derive_from_bytes);
@@ -129,6 +139,89 @@ fn into_ts(self) -> proc_macro2::TokenStream {
 derive!(ByteEq => derive_eq => crate::derive::derive_eq);
 derive!(SplitAt => derive_split_at => crate::derive::derive_split_at);
 
+/// Generates a struct whose two identically-printed field types resolve to
+/// different types. This is used to test that derives preserve type identity
+/// across macro hygiene contexts.
+#[cfg(__ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS)]
+#[doc(hidden)]
+#[proc_macro]
+pub fn __test_hygienically_mixed_into_bytes(
+    _input: proc_macro::TokenStream,
+) -> proc_macro::TokenStream {
+    use proc_macro::{Group, Ident, Span, TokenStream, TokenTree};
+
+    fn rewrite(input: TokenStream) -> TokenStream {
+        input
+            .into_iter()
+            .map(|token| match token {
+                TokenTree::Ident(ident) if ident.to_string() == "CallT" => {
+                    TokenTree::Ident(Ident::new("T", Span::call_site()))
+                }
+                TokenTree::Ident(ident) if ident.to_string() == "DefT" => {
+                    TokenTree::Ident(Ident::new("T", Span::def_site()))
+                }
+                TokenTree::Group(group) => {
+                    let mut rewritten = Group::new(group.delimiter(), rewrite(group.stream()));
+                    rewritten.set_span(group.span());
+                    TokenTree::Group(rewritten)
+                }
+                token => token,
+            })
+            .collect()
+    }
+
+    rewrite(
+        "#[derive(zerocopy_renamed::IntoBytes)] \
+         #[zerocopy(crate = \"zerocopy_renamed\")] \
+         #[repr(C)] \
+         struct IntoBytes15<DefT>(CallT, DefT);"
+            .parse()
+            .expect("test input must parse"),
+    )
+}
+
+/// Constructs an invariant whose field declaration and reference have different
+/// syntax contexts, while preserving all other caller tokens.
+#[doc(hidden)]
+#[proc_macro]
+pub fn __test_hygienically_mixed_invariant(
+    input: proc_macro::TokenStream,
+) -> proc_macro::TokenStream {
+    // Cross-compilation does not necessarily pass the nightly test cfg to
+    // host proc macros. Omit the fixture and its test together in that case.
+    #[cfg(not(__ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS))]
+    {
+        let _ = input;
+        proc_macro::TokenStream::new()
+    }
+    #[cfg(__ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS)]
+    {
+        use proc_macro::{Group, Ident, Span, TokenStream, TokenTree};
+
+        fn rewrite(input: TokenStream) -> TokenStream {
+            input
+                .into_iter()
+                .map(|token| match token {
+                    TokenTree::Ident(ident) if ident.to_string() == "DefField" => {
+                        TokenTree::Ident(Ident::new("field", Span::def_site()))
+                    }
+                    TokenTree::Ident(ident) if ident.to_string() == "CallField" => {
+                        TokenTree::Ident(Ident::new("field", Span::call_site()))
+                    }
+                    TokenTree::Group(group) => {
+                        let mut rewritten = Group::new(group.delimiter(), rewrite(group.stream()));
+                        rewritten.set_span(group.span());
+                        TokenTree::Group(rewritten)
+                    }
+                    token => token,
+                })
+                .collect()
+        }
+
+        rewrite(input)
+    }
+}
+
 #[cfg_attr(not(zerocopy_unstable_linux), doc(hidden))]
 #[proc_macro_derive(most_traits, attributes(zerocopy))]
 pub fn most_traits(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
@@ -153,11 +246,18 @@ pub fn most_traits(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
     for (derive, t) in derives {
         tokens.extend(derive(&ctx, t))
     }
+    // Invariants prevent `FromBytes` from generating its usual supertrait
+    // impls, but still permit checked conversions through `TryFromBytes`.
+    if ctx.invariant_span.is_some() {
+        tokens.extend(crate::derive::try_from_bytes::derive_try_from_bytes(
+            &ctx,
+            Trait::TryFromBytes,
+        ));
+    }
 
-    // We wrap in `const_block` as a backstop in case any derive fails
-    // to wrap its output in `const_block` (and thus fails to annotate)
-    // with the full set of `#[allow(...)]` attributes).
-    let ts = const_block([Some(tokens)]);
+    // Apply generated-code lint allowances as a backstop, except around
+    // caller-authored invariant expressions.
+    let ts = ctx.const_block([Some(tokens)]);
     #[cfg(test)]
     crate::util::testutil::check_hygiene(ts.clone());
     ts.into()
diff --git a/rust/zerocopy-derive/repr.rs b/rust/zerocopy-derive/repr.rs
index 1525e94302d1..a1a877c0f47c 100644
--- a/rust/zerocopy-derive/repr.rs
+++ b/rust/zerocopy-derive/repr.rs
@@ -20,6 +20,8 @@
     MetaList,
 };
 
+use crate::util::{path_is_ident, to_ident_str};
+
 /// The computed representation of a type.
 ///
 /// This is the result of processing all `#[repr(...)]` attributes on a type, if
@@ -524,11 +526,11 @@ fn from_attrs(
         let mut reprs = Vec::new();
         for attr in attrs {
             // Ignore documentation attributes.
-            if attr.path().is_ident("doc") {
+            if path_is_ident(attr.path(), "doc") {
                 continue;
             }
             if let Meta::List(ref meta_list) = attr.meta {
-                if meta_list.path.is_ident("repr") {
+                if path_is_ident(&meta_list.path, "repr") {
                     let parsed: Punctuated<Meta, Comma> =
                         match meta_list.parse_args_with(Punctuated::parse_terminated) {
                             Ok(parsed) => parsed,
@@ -564,6 +566,8 @@ fn from_meta(meta: &Meta) -> Result<RawRepr, UnrecognizedReprError> {
         let ident = path.get_ident().ok_or(UnrecognizedReprError)?;
 
         // Only returns `Ok` for non-zero power-of-two values.
+        // `NonZeroU32::is_power_of_two` is unsupported on our MSRV.
+        #[allow(clippy::needless_nonzero_get)]
         let parse_nzu64 = |list: &MetaList| {
             list.parse_args::<LitInt>()
                 .and_then(|int| int.base10_parse::<NonZeroU32>())
@@ -578,7 +582,8 @@ fn from_meta(meta: &Meta) -> Result<RawRepr, UnrecognizedReprError> {
         };
 
         use RawRepr::*;
-        Ok(match (ident.to_string().as_str(), list) {
+        let ident = to_ident_str(ident);
+        Ok(match (ident.as_str(), list) {
             ("u8", None) => U8,
             ("u16", None) => U16,
             ("u32", None) => U32,
@@ -743,7 +748,40 @@ macro_rules! test {
         use PrimitiveRepr::*;
         let nz = |n: u32| NonZeroU32::new(n).unwrap();
 
+        // Rust treats raw identifiers and their ordinary spellings as the
+        // same representation hints. Exercise every spelling recognized by
+        // `RawRepr::from_meta` so that adding a hint cannot accidentally
+        // reintroduce raw-identifier-sensitive parsing.
+        macro_rules! test_raw_repr {
+            ($ordinary:meta, $raw:meta => $expected:expr) => {{
+                let ordinary: Meta = parse_quote!($ordinary);
+                let raw: Meta = parse_quote!($raw);
+                assert_eq!(RawRepr::from_meta(&ordinary).ok().unwrap(), $expected);
+                assert_eq!(RawRepr::from_meta(&raw).ok().unwrap(), $expected);
+            }};
+        }
+
+        test_raw_repr!(transparent, r#transparent => RawRepr::Transparent);
+        test_raw_repr!(C, r#C => RawRepr::C);
+        test_raw_repr!(Rust, r#Rust => RawRepr::Rust);
+        test_raw_repr!(u8, r#u8 => RawRepr::U8);
+        test_raw_repr!(u16, r#u16 => RawRepr::U16);
+        test_raw_repr!(u32, r#u32 => RawRepr::U32);
+        test_raw_repr!(u64, r#u64 => RawRepr::U64);
+        test_raw_repr!(u128, r#u128 => RawRepr::U128);
+        test_raw_repr!(usize, r#usize => RawRepr::Usize);
+        test_raw_repr!(i8, r#i8 => RawRepr::I8);
+        test_raw_repr!(i16, r#i16 => RawRepr::I16);
+        test_raw_repr!(i32, r#i32 => RawRepr::I32);
+        test_raw_repr!(i64, r#i64 => RawRepr::I64);
+        test_raw_repr!(i128, r#i128 => RawRepr::I128);
+        test_raw_repr!(isize, r#isize => RawRepr::Isize);
+        test_raw_repr!(align(2), r#align(2) => RawRepr::Align(nz(2)));
+        test_raw_repr!(packed, r#packed => RawRepr::Packed);
+        test_raw_repr!(packed(2), r#packed(2) => RawRepr::PackedN(nz(2)));
+
         test!(#[repr(transparent)] => StructUnionRepr::Transparent(s()));
+        test!(#[r#repr(r#transparent)] => StructUnionRepr::Transparent(s()));
         test!(#[repr()] => StructUnionRepr::Compound(Rust.into(), None));
         test!(#[repr(packed)] => StructUnionRepr::Compound(Rust.into(), Some(Packed(nz(1)).into())));
         test!(#[repr(packed(2))] => StructUnionRepr::Compound(Rust.into(), Some(Packed(nz(2)).into())));
@@ -754,6 +792,8 @@ macro_rules! test {
         test!(#[repr(C, packed(2))] => StructUnionRepr::Compound(C.into(), Some(Packed(nz(2)).into())));
         test!(#[repr(C, align(1))] => StructUnionRepr::Compound(C.into(), Some(Align(nz(1)).into())));
         test!(#[repr(C, align(2))] => StructUnionRepr::Compound(C.into(), Some(Align(nz(2)).into())));
+        test!(#[r#repr(r#C, r#align(2))] => StructUnionRepr::Compound(C.into(), Some(Align(nz(2)).into())));
+        test!(#[r#repr(r#C, r#packed(2))] => StructUnionRepr::Compound(C.into(), Some(Packed(nz(2)).into())));
 
         test!(#[repr(transparent)] => EnumRepr::Transparent(s()));
         test!(#[repr()] => EnumRepr::Compound(Rust.into(), None));
diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
index 5c5e9d3bdcb8..717e068dd81c 100644
--- a/rust/zerocopy-derive/util.rs
+++ b/rust/zerocopy-derive/util.rs
@@ -13,9 +13,9 @@
 use proc_macro2::{Span, TokenStream};
 use quote::{quote, quote_spanned, ToTokens};
 use syn::{
-    parse_quote, spanned::Spanned as _, Data, DataEnum, DataStruct, DataUnion, DeriveInput, Error,
-    Expr, ExprLit, Field, GenericParam, Ident, Index, Lit, LitStr, Meta, Path, Type, Variant,
-    Visibility, WherePredicate,
+    parse::ParseBuffer, parse_quote, spanned::Spanned as _, token::PathSep, Data, DataEnum,
+    DataStruct, DataUnion, DeriveInput, Error, Expr, ExprLit, Field, GenericParam, Ident, Index,
+    Lit, LitStr, Meta, Path, Type, Variant, Visibility, WherePredicate,
 };
 
 use crate::repr::{CompoundRepr, EnumRepr, PrimitiveRepr, Repr, Spanned};
@@ -30,6 +30,59 @@ pub(crate) struct Ctx {
 
     // The span of the last `#[zerocopy(on_error = ...)]` attribute, if any.
     pub(crate) on_error_span: Option<proc_macro2::Span>,
+
+    /// The first field invariant on the source type, if any.
+    pub(crate) invariant_span: Option<Span>,
+}
+
+#[derive(Eq, PartialEq)]
+enum CratePath {
+    External,
+    CrateRelative,
+    ModuleRelative,
+}
+
+fn validate_crate_path(path: &Path) -> Result<CratePath, ()> {
+    if path.segments.is_empty() {
+        return Err(());
+    }
+
+    enum ModuleRelative {
+        Yes,
+        No,
+    }
+    let first = path.segments[0].ident.to_string();
+    let (mut prev_segment, path_type) = match first.as_str() {
+        "Self" => return Err(()),
+        "crate" => {
+            if path.leading_colon.is_some() {
+                return Err(());
+            }
+            (ModuleRelative::No, CratePath::CrateRelative)
+        }
+        "self" | "super" => {
+            if path.leading_colon.is_some() {
+                return Err(());
+            }
+            (ModuleRelative::Yes, CratePath::ModuleRelative)
+        }
+        _ => (ModuleRelative::No, CratePath::External),
+    };
+
+    for seg in path.segments.iter().skip(1) {
+        let ident = seg.ident.to_string();
+        match ident.as_str() {
+            "Self" | "crate" | "self" => return Err(()),
+            "super" => match prev_segment {
+                ModuleRelative::Yes => {}
+                ModuleRelative::No => return Err(()),
+            },
+            _ => {
+                prev_segment = ModuleRelative::No;
+            }
+        }
+    }
+    Ok(path_type)
 }
 
 impl Ctx {
@@ -42,24 +95,40 @@ pub(crate) fn try_from_derive_input(ast: DeriveInput) -> Result<Self, Error> {
 
         for attr in &ast.attrs {
             if let Meta::List(ref meta_list) = attr.meta {
-                if meta_list.path.is_ident("zerocopy") {
+                if path_is_ident(&meta_list.path, "zerocopy") {
                     attr.parse_nested_meta(|meta| {
-                        if meta.path.is_ident("crate") {
-                            let expr = meta.value().and_then(|value| value.parse());
+                        if path_is_ident(&meta.path, "crate") {
+                            let expr = meta.value().and_then(ParseBuffer::parse);
                             if let Ok(Expr::Lit(ExprLit { lit: Lit::Str(lit), .. })) = expr {
-                                if let Ok(path_lit) = lit.parse::<Ident>() {
-                                    path = parse_quote!(::#path_lit);
-                                    return Ok(());
+                                if let Ok(mut path_lit) = lit.parse_with(Path::parse_mod_style) {
+                                    if let Ok(crate_path) = validate_crate_path(&path_lit) {
+                                        // If not expressly relative, absolutize.
+                                        if path_lit.leading_colon.is_none() && crate_path == CratePath::External {
+                                            path_lit.leading_colon = Some(PathSep::default());
+                                        }
+                                        path = path_lit;
+                                        return Ok(());
+                                    }
+
+                                    return Err(Error::new(
+                                        lit.span(),
+                                        "`crate` attribute requires a valid module path",
+                                    ));
                                 }
+
+                                return Err(Error::new(
+                                    lit.span(),
+                                    "`crate` attribute requires a path as the value",
+                                ));
                             }
 
                             return Err(Error::new(
-                                Span::call_site(),
+                                meta.path.span(),
                                 "`crate` attribute requires a path as the value",
                             ));
                         }
 
-                        if meta.path.is_ident("on_error") {
+                        if path_is_ident(&meta.path, "on_error") {
                             on_error_span = Some(meta.path.span());
                             let value = meta.value()?;
                             let s: LitStr = value.parse()?;
@@ -86,7 +155,8 @@ pub(crate) fn try_from_derive_input(ast: DeriveInput) -> Result<Self, Error> {
             }
         }
 
-        Ok(Self { ast, zerocopy_crate: path, skip_on_error, on_error_span })
+        let invariant_span = crate::invariant::validate(&ast)?;
+        Ok(Self { ast, zerocopy_crate: path, skip_on_error, on_error_span, invariant_span })
     }
 
     pub(crate) fn with_input(&self, input: &DeriveInput) -> Self {
@@ -95,6 +165,7 @@ pub(crate) fn with_input(&self, input: &DeriveInput) -> Self {
             zerocopy_crate: self.zerocopy_crate.clone(),
             skip_on_error: self.skip_on_error,
             on_error_span: self.on_error_span,
+            invariant_span: self.invariant_span,
         }
     }
 
@@ -108,15 +179,41 @@ pub(crate) fn core_path(&self) -> TokenStream {
         quote!(#zerocopy_crate::util::macro_util::core_reexport)
     }
 
+    /// Choose an implementation name absent from the caller's tokens. This is
+    /// best-effort; names introduced by nested macros are not considered.
+    /// Unlike local variables, type parameters are not hidden by mixed-site
+    /// hygiene.
+    pub(crate) fn fresh_ident(&self, name: &str) -> Ident {
+        let idents = crate::invariant::idents(self.ast.to_token_stream());
+        let mut name = name.to_owned();
+        while idents.iter().any(|ident| ident.to_string().trim_start_matches("r#") == name) {
+            name.push('_');
+        }
+        Ident::new(&name, Span::mixed_site())
+    }
+
+    /// Caller-authored invariant expressions must inherit the caller's lint
+    /// policy, rather than the blanket allowances for generated glue.
+    pub(crate) fn const_block(
+        &self,
+        items: impl IntoIterator<Item = Option<TokenStream>>,
+    ) -> TokenStream {
+        if self.invariant_span.is_none() {
+            const_block(items)
+        } else {
+            let items = items.into_iter().flatten();
+            quote! { const _: () = { #(#items)* }; }
+        }
+    }
+
     pub(crate) fn cfg_compile_error(&self) -> TokenStream {
         // By checking both during the compilation of the proc macro *and* in
-        // the generated code, we ensure that `--cfg
-        // zerocopy_unstable_linux` need only be passed *either* when
+        // the generated code, we ensure that each cfg need only be passed when
         // compiling this crate *or* when compiling the user's crate. The former
         // is preferable, but in some situations (such as when cross-compiling
         // using `cargo build --target`), it doesn't get propagated to this
         // crate's build by default.
-        if cfg!(zerocopy_unstable_linux) {
+        let on_error = if cfg!(zerocopy_unstable_linux) {
             quote!()
         } else if let Some(span) = self.on_error_span {
             let core = self.core_path();
@@ -131,7 +228,24 @@ pub(crate) fn cfg_compile_error(&self) -> TokenStream {
             }
         } else {
             quote!()
-        }
+        };
+        let invariant = if cfg!(zerocopy_unstable_ptr) {
+            quote!()
+        } else if let Some(span) = self.invariant_span {
+            let core = self.core_path();
+            let error_message =
+                "`invariant` is experimental; pass '--cfg zerocopy_unstable_ptr' to enable";
+            quote::quote_spanned! {span=>
+                #[allow(unused_attributes, unexpected_cfgs)]
+                const _: () = {
+                    #[cfg(not(zerocopy_unstable_ptr))]
+                    #core::compile_error!(#error_message);
+                };
+            }
+        } else {
+            quote!()
+        };
+        quote!(#on_error #invariant)
     }
 
     pub(crate) fn error_or_skip<E>(&self, error: E) -> Result<TokenStream, E> {
@@ -151,7 +265,7 @@ pub(crate) trait DataExt {
     /// FIXME: Extracting field names for enums doesn't really make sense. Types
     /// makes sense because we don't care about where they live - we just care
     /// about transitive ownership. But for field names, we'd only use them when
-    /// generating is_bit_valid, which cares about where they live.
+    /// generating is_safe, which cares about where they live.
     fn fields(&self) -> Vec<(&Visibility, TokenStream, &Type)>;
 
     fn variants(&self) -> Vec<(Option<&Variant>, Vec<(&Visibility, TokenStream, &Type)>)>;
@@ -255,6 +369,18 @@ pub(crate) fn to_ident_str(t: &impl ToString) -> String {
     }
 }
 
+/// Does `path` consist solely of the identifier `expected`?
+///
+/// Unlike [`Path::is_ident`], this treats a raw identifier and its ordinary
+/// spelling as the same identifier. Rust applies that same normalization when
+/// interpreting attribute names and arguments.
+pub(crate) fn path_is_ident(path: &Path, expected: &str) -> bool {
+    match path.get_ident() {
+        Some(ident) => to_ident_str(ident) == expected,
+        None => false,
+    }
+}
+
 /// This enum describes what kind of padding check needs to be generated for the
 /// associated impl.
 pub(crate) enum PaddingCheck {
@@ -298,22 +424,46 @@ pub(crate) fn validator_macro_context(&self) -> Option<&TokenStream> {
     }
 }
 
+#[derive(Copy, Clone)]
+pub(crate) enum Client {
+    ProjectDerive,
+    TryFromBytesDerive,
+}
+
+impl ToTokens for Client {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let s = match self {
+            Client::ProjectDerive => "ProjectDerive",
+            Client::TryFromBytesDerive => "TryFromBytesDerive",
+        };
+        let ident = Ident::new(s, Span::call_site());
+        tokens.extend(quote!(project_clients::#ident));
+    }
+}
+
+impl Client {
+    pub(crate) fn crate_path(&self, ctx: &Ctx) -> Path {
+        let zerocopy_crate = &ctx.zerocopy_crate;
+        parse_quote!(#zerocopy_crate::#self)
+    }
+}
+
+/// Bundles the trait parameters for `HasField` and `ProjectField`.
+#[derive(Clone)]
+pub(crate) struct FieldProjection {
+    pub(crate) variant_id: Box<Expr>,
+    pub(crate) field: Box<Type>,
+    pub(crate) field_id: Box<Expr>,
+}
+
 #[derive(Clone)]
 pub(crate) enum Trait {
     KnownLayout,
-    HasTag,
-    HasField {
-        variant_id: Box<Expr>,
-        field: Box<Type>,
-        field_id: Box<Expr>,
-    },
-    ProjectField {
-        variant_id: Box<Expr>,
-        field: Box<Type>,
-        field_id: Box<Expr>,
-        invariants: Box<Type>,
-    },
+    HasTag { client: Client },
+    HasField { client: Client, projection: FieldProjection },
+    ProjectField { client: Client, projection: FieldProjection, invariants: Box<Type> },
     Immutable,
+    Project,
     TryFromBytes,
     FromZeros,
     FromBytes,
@@ -340,8 +490,9 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
             Trait::HasField { .. } => "HasField",
             Trait::ProjectField { .. } => "ProjectField",
             Trait::KnownLayout => "KnownLayout",
-            Trait::HasTag => "HasTag",
+            Trait::HasTag { .. } => "HasTag",
             Trait::Immutable => "Immutable",
+            Trait::Project => "Project",
             Trait::TryFromBytes => "TryFromBytes",
             Trait::FromZeros => "FromZeros",
             Trait::FromBytes => "FromBytes",
@@ -354,15 +505,18 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
         };
         let ident = Ident::new(s, Span::call_site());
         let arguments: Option<syn::AngleBracketedGenericArguments> = match self {
-            Trait::HasField { variant_id, field, field_id } => {
-                Some(parse_quote!(<#field, #variant_id, #field_id>))
+            Trait::HasTag { client } => Some(parse_quote!(<#client>)),
+            Trait::HasField { client, projection } => {
+                let FieldProjection { variant_id, field, field_id } = projection;
+                Some(parse_quote!(<#client, #field, #variant_id, #field_id>))
             }
-            Trait::ProjectField { variant_id, field, field_id, invariants } => {
-                Some(parse_quote!(<#field, #invariants, #variant_id, #field_id>))
+            Trait::ProjectField { client, projection, invariants } => {
+                let FieldProjection { variant_id, field, field_id } = projection;
+                Some(parse_quote!(<#client, #field, #invariants, #variant_id, #field_id>))
             }
             Trait::KnownLayout
-            | Trait::HasTag
             | Trait::Immutable
+            | Trait::Project
             | Trait::TryFromBytes
             | Trait::FromZeros
             | Trait::FromBytes
@@ -383,6 +537,28 @@ pub(crate) fn crate_path(&self, ctx: &Ctx) -> Path {
         let core = ctx.core_path();
         match self {
             Self::Sized => parse_quote!(#core::marker::#self),
+            Self::HasTag { client } => {
+                let client = client.crate_path(ctx);
+                parse_quote!(#zerocopy_crate::HasTag<#client>)
+            }
+            Self::HasField { client, projection } => {
+                let FieldProjection { variant_id, field, field_id } = projection;
+                let client = client.crate_path(ctx);
+                parse_quote!(#zerocopy_crate::HasField<#client, #field, #variant_id, #field_id>)
+            }
+            Self::ProjectField { client, projection, invariants } => {
+                let FieldProjection { variant_id, field, field_id } = projection;
+                let client = client.crate_path(ctx);
+                parse_quote!(
+                    #zerocopy_crate::ProjectField<
+                        #client,
+                        #field,
+                        #invariants,
+                        #variant_id,
+                        #field_id
+                    >
+                )
+            }
             _ => parse_quote!(#zerocopy_crate::#self),
         }
     }
@@ -704,7 +880,12 @@ fn only_derive_is_allowed_to_implement_this_trait() {}
 
         let outer_extras = self.outer_extras.filter(|e| !e.is_empty());
         let cfg_compile_error = self.ctx.cfg_compile_error();
-        const_block([Some(cfg_compile_error), Some(impl_tokens), outer_extras])
+        let items = [Some(cfg_compile_error), Some(impl_tokens), outer_extras];
+        if matches!(self.trt, Trait::TryFromBytes) {
+            self.ctx.const_block(items)
+        } else {
+            const_block(items)
+        }
     }
 }
 
@@ -730,8 +911,7 @@ fn then_some<T>(self, t: T) -> Option<T> {
     }
 }
 
-pub(crate) fn const_block(items: impl IntoIterator<Item = Option<TokenStream>>) -> TokenStream {
-    let items = items.into_iter().flatten();
+pub(crate) fn allow_generated_code() -> TokenStream {
     quote! {
         #[allow(
             // FIXME(#553): Add a test that generates a warning when
@@ -748,6 +928,14 @@ pub(crate) fn const_block(items: impl IntoIterator<Item = Option<TokenStream>>)
             non_ascii_idents,
             clippy::missing_inline_in_public_items,
         )]
+    }
+}
+
+pub(crate) fn const_block(items: impl IntoIterator<Item = Option<TokenStream>>) -> TokenStream {
+    let items = items.into_iter().flatten();
+    let allow = allow_generated_code();
+    quote! {
+        #allow
         #[deny(ambiguous_associated_items)]
         // While there are not currently any warnings that this suppresses
         // (that we're aware of), it's good future-proofing hygiene.
@@ -778,7 +966,8 @@ pub(crate) fn generate_tag_enum(ctx: &Ctx, repr: &EnumRepr, data: &DataEnum) ->
 
     quote! {
         #repr
-        #[allow(dead_code)]
+        #[allow(dead_code, clippy::derive_partial_eq_without_eq)]
+        #[derive(Copy, Clone, PartialEq)]
         pub enum ___ZerocopyTag {
             #(#variants,)*
         }
@@ -824,18 +1013,40 @@ pub(crate) mod testutil {
     pub(crate) fn check_hygiene(ts: TokenStream) {
         struct AmbiguousItemVisitor;
 
+        fn panic_ambiguous_path(path: &impl quote::ToTokens) -> ! {
+            panic!(
+                "Found ambiguous path `{}` in generated output. \
+                 All associated item access must be fully qualified (e.g., `<Self as Trait>::Item`) \
+                 to prevent hygiene issues.",
+                quote::quote!(#path)
+            );
+        }
+
         impl<'ast> Visit<'ast> for AmbiguousItemVisitor {
+            fn visit_expr_path(&mut self, i: &'ast syn::ExprPath) {
+                if let Some(qself) = &i.qself {
+                    if qself.position == 0 {
+                        panic_ambiguous_path(i);
+                    }
+                }
+                visit::visit_expr_path(self, i);
+            }
+
             fn visit_path(&mut self, i: &'ast syn::Path) {
                 if i.segments.len() > 1 && i.segments.first().unwrap().ident == "Self" {
-                    panic!(
-                    "Found ambiguous path `{}` in generated output. \
-                     All associated item access must be fully qualified (e.g., `<Self as Trait>::Item`) \
-                     to prevent hygiene issues.",
-                    quote::quote!(#i)
-                );
+                    panic_ambiguous_path(i);
                 }
                 visit::visit_path(self, i);
             }
+
+            fn visit_type_path(&mut self, i: &'ast syn::TypePath) {
+                if let Some(qself) = &i.qself {
+                    if qself.position == 0 {
+                        panic_ambiguous_path(i);
+                    }
+                }
+                visit::visit_type_path(self, i);
+            }
         }
 
         let file = syn::parse2::<syn::File>(ts).expect("failed to parse generated output as File");
@@ -860,4 +1071,117 @@ fn foo() {
             }
         });
     }
+
+    #[test]
+    #[should_panic(expected = "Found ambiguous path `< T > :: Ambiguous`")]
+    fn test_check_hygiene_type_relative_expr_failure() {
+        check_hygiene(quote::quote! {
+            fn foo<T>() {
+                let _ = <T>::Ambiguous;
+            }
+        });
+    }
+
+    #[test]
+    #[should_panic(expected = "Found ambiguous path `< T > :: Ambiguous`")]
+    fn test_check_hygiene_type_relative_type_failure() {
+        check_hygiene(quote::quote! {
+            fn foo<T>() {
+                let _: <T>::Ambiguous;
+            }
+        });
+    }
+
+    #[test]
+    fn test_validate_crate_path() {
+        use syn::parse_str;
+
+        let valid = [
+            "zerocopy",
+            "crate",
+            "crate::foo::bar",
+            "self",
+            "self::foo",
+            "self::super::foo",
+            "super",
+            "super::foo",
+            "super::super::foo",
+            "super::super::super",
+            "foo::bar::baz",
+            "::foo::bar",
+        ];
+
+        for path_str in valid {
+            let path = parse_str::<syn::Path>(path_str).unwrap();
+            assert!(
+                super::validate_crate_path(&path).is_ok(),
+                "expected valid path for `{}`",
+                path_str
+            );
+        }
+
+        let invalid = [
+            "::crate::foo",
+            "::self::foo",
+            "::super::foo",
+            "Self",
+            "Self::foo",
+            "foo::Self::bar",
+            "foo::crate::bar",
+            "foo::super::bar",
+            "foo::self",
+            "super::foo::super",
+            "super::crate::foo",
+            "crate::super::foo",
+            "self::self::foo",
+        ];
+
+        for path_str in invalid {
+            let path = parse_str::<syn::Path>(path_str).unwrap();
+            assert!(
+                super::validate_crate_path(&path).is_err(),
+                "expected invalid path for `{}`",
+                path_str
+            );
+        }
+    }
+
+    #[test]
+    fn test_path_is_ident() {
+        use syn::parse_str;
+
+        for (expected, ordinary, raw) in [
+            ("doc", "doc", "r#doc"),
+            ("repr", "repr", "r#repr"),
+            ("zerocopy", "zerocopy", "r#zerocopy"),
+            ("on_error", "on_error", "r#on_error"),
+        ] {
+            let ordinary = parse_str::<syn::Path>(ordinary).unwrap();
+            let raw = parse_str::<syn::Path>(raw).unwrap();
+            assert!(super::path_is_ident(&ordinary, expected));
+            assert!(super::path_is_ident(&raw, expected));
+        }
+
+        // `r#crate` is forbidden by Rust's raw identifier grammar.
+        let crate_path = parse_str::<syn::Path>("crate").unwrap();
+        assert!(super::path_is_ident(&crate_path, "crate"));
+
+        for path in ["::zerocopy", "module::zerocopy"] {
+            let path = parse_str::<syn::Path>(path).unwrap();
+            assert!(!super::path_is_ident(&path, "zerocopy"));
+        }
+    }
+
+    #[test]
+    fn test_raw_zerocopy_attributes() {
+        let ast: syn::DeriveInput = syn::parse_quote! {
+            #[r#zerocopy(crate = "renamed", r#on_error = "skip")]
+            struct Foo;
+        };
+
+        let ctx = super::Ctx::try_from_derive_input(ast).unwrap();
+        let path = &ctx.zerocopy_crate;
+        assert_eq!(quote::quote!(#path).to_string(), ":: renamed");
+        assert!(ctx.skip_on_error);
+    }
 }
diff --git a/rust/zerocopy/README.md b/rust/zerocopy/README.md
index 8443f6166008..5cdea261e45f 100644
--- a/rust/zerocopy/README.md
+++ b/rust/zerocopy/README.md
@@ -1,13 +1,13 @@
 # `zerocopy`
 
-These source files come from the Rust `zerocopy` crate, version v0.8.54
-(released 2026-07-08), hosted in the <https://github.com/google/zerocopy>
+These source files come from the Rust `zerocopy` crate, version v0.8.62
+(released 2026-10-08), hosted in the <https://github.com/google/zerocopy>
 repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
 modified to tweak the SPDX license identifiers.
 
 For copyright details, please see:
 
-    https://github.com/google/zerocopy/blob/v0.8.54/zerocopy/README.md?plain=1
-    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-BSD
-    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-APACHE
-    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-MIT
+    https://github.com/google/zerocopy/blob/v0.8.62/zerocopy/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.62/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.62/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.62/LICENSE-MIT
diff --git a/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64 b/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64
index f68bad612695..12ab2e3c4b37 100644
--- a/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64
@@ -1,5 +1,4 @@
 bench_as_bytes_dynamic_size:
 	mov rax, rdi
-	lea rdx, [2*rsi + 5]
-	and rdx, -2
+	lea rdx, [2*rsi + 4]
 	ret
diff --git a/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64.mca b/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64.mca
index c3b92a9a95fe..d661f093fea6 100644
--- a/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/as_bytes_dynamic_size.x86-64.mca
@@ -1,11 +1,11 @@
 Iterations:        100
-Instructions:      400
-Total Cycles:      137
-Total uOps:        400
+Instructions:      300
+Total Cycles:      104
+Total uOps:        300
 
 Dispatch Width:    4
-uOps Per Cycle:    2.92
-IPC:               2.92
+uOps Per Cycle:    2.88
+IPC:               2.88
 Block RThroughput: 1.0
 
 
@@ -19,8 +19,7 @@ Instruction Info:
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        mov	rax, rdi
- 1      1     0.50                        lea	rdx, [2*rsi + 5]
- 1      1     0.33                        and	rdx, -2
+ 1      1     0.50                        lea	rdx, [2*rsi + 4]
  1      1     1.00                  U     ret
 
 
@@ -37,11 +36,10 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     1.33   1.33    -     1.34    -      -     
+ -      -     0.99   1.00    -     1.01    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -      -     0.66    -     0.34    -      -     mov	rax, rdi
- -      -     0.33   0.67    -      -      -      -     lea	rdx, [2*rsi + 5]
- -      -     1.00    -      -      -      -      -     and	rdx, -2
+ -      -     0.99    -      -     0.01    -      -     mov	rax, rdi
+ -      -      -     1.00    -      -      -      -     lea	rdx, [2*rsi + 4]
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/extend_vec_zeroed.x86-64 b/rust/zerocopy/benches/extend_vec_zeroed.x86-64
index 831b2a075fec..0790ce20273d 100644
--- a/rust/zerocopy/benches/extend_vec_zeroed.x86-64
+++ b/rust/zerocopy/benches/extend_vec_zeroed.x86-64
@@ -41,8 +41,8 @@ bench_extend_vec_zeroed:
 .LBB6_6:
 	mov r13, rsi
 	lea rcx, [rax + rax]
-	cmp r15, rcx
-	cmova rcx, r15
+	cmp rcx, r15
+	cmovbe rcx, r15
 	cmp rcx, 5
 	mov r14d, 4
 	cmovae r14, rcx
diff --git a/rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca b/rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca
index cfab1eea8f56..cf3c5a5ad5e3 100644
--- a/rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca
+++ b/rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca
@@ -55,8 +55,8 @@ Instruction Info:
  1      1     1.00                  U     ret
  1      1     0.33                        mov	r13, rsi
  1      1     0.50                        lea	rcx, [rax + rax]
- 1      1     0.33                        cmp	r15, rcx
- 3      3     1.00                        cmova	rcx, r15
+ 1      1     0.33                        cmp	rcx, r15
+ 3      3     1.00                        cmovbe	rcx, r15
  1      1     0.33                        cmp	rcx, 5
  1      1     0.33                        mov	r14d, 4
  2      2     0.67                        cmovae	r14, rcx
@@ -128,8 +128,8 @@ Resource pressure by instruction:
  -      -      -      -      -     1.00    -      -     ret
  -      -     1.00    -      -      -      -      -     mov	r13, rsi
  -      -     0.01   0.99    -      -      -      -     lea	rcx, [rax + rax]
- -      -     0.99   0.01    -      -      -      -     cmp	r15, rcx
- -      -     2.00   0.01    -     0.99    -      -     cmova	rcx, r15
+ -      -     0.99   0.01    -      -      -      -     cmp	rcx, r15
+ -      -     2.00   0.01    -     0.99    -      -     cmovbe	rcx, r15
  -      -     0.01   0.99    -      -      -      -     cmp	rcx, 5
  -      -     0.01   0.99    -      -      -      -     mov	r14d, 4
  -      -     1.00   0.01    -     0.99    -      -     cmovae	r14, rcx
diff --git a/rust/zerocopy/benches/insert_vec_zeroed.x86-64 b/rust/zerocopy/benches/insert_vec_zeroed.x86-64
index 9db87403cb55..b5426c3f4a3e 100644
--- a/rust/zerocopy/benches/insert_vec_zeroed.x86-64
+++ b/rust/zerocopy/benches/insert_vec_zeroed.x86-64
@@ -54,8 +54,8 @@ bench_insert_vec_zeroed:
 	mov r15, rsi
 	mov rbp, rdx
 	lea rcx, [rax + rax]
-	cmp r12, rcx
-	cmova rcx, r12
+	cmp rcx, r12
+	cmovbe rcx, r12
 	cmp rcx, 5
 	mov r14d, 4
 	cmovae r14, rcx
diff --git a/rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca b/rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca
index 665240667844..a6c17e236823 100644
--- a/rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca
+++ b/rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca
@@ -68,8 +68,8 @@ Instruction Info:
  1      1     0.33                        mov	r15, rsi
  1      1     0.33                        mov	rbp, rdx
  1      1     0.50                        lea	rcx, [rax + rax]
- 1      1     0.33                        cmp	r12, rcx
- 3      3     1.00                        cmova	rcx, r12
+ 1      1     0.33                        cmp	rcx, r12
+ 3      3     1.00                        cmovbe	rcx, r12
  1      1     0.33                        cmp	rcx, 5
  1      1     0.33                        mov	r14d, 4
  2      2     0.67                        cmovae	r14, rcx
@@ -159,8 +159,8 @@ Resource pressure by instruction:
  -      -     0.49   0.51    -      -      -      -     mov	r15, rsi
  -      -     0.51   0.49    -      -      -      -     mov	rbp, rdx
  -      -     0.49   0.51    -      -      -      -     lea	rcx, [rax + rax]
- -      -     0.49   0.50    -     0.01    -      -     cmp	r12, rcx
- -      -     1.04   0.50    -     1.46    -      -     cmova	rcx, r12
+ -      -     0.49   0.50    -     0.01    -      -     cmp	rcx, r12
+ -      -     1.04   0.50    -     1.46    -      -     cmovbe	rcx, r12
  -      -     0.49   0.49    -     0.02    -      -     cmp	rcx, 5
  -      -     0.50    -      -     0.50    -      -     mov	r14d, 4
  -      -     0.50   0.51    -     0.99    -      -     cmovae	r14, rcx
diff --git a/rust/zerocopy/benches/new_vec_zeroed.x86-64 b/rust/zerocopy/benches/new_vec_zeroed.x86-64
index b5c083aa0d36..edf421e3192c 100644
--- a/rust/zerocopy/benches/new_vec_zeroed.x86-64
+++ b/rust/zerocopy/benches/new_vec_zeroed.x86-64
@@ -29,8 +29,7 @@ bench_new_vec_zeroed:
 	mov qword ptr [rax + 16], rsi
 	ret
 .LBB5_5:
-	movabs rcx, -9223372036854775808
-	mov qword ptr [rax], rcx
+	mov qword ptr [rax], -1
 	ret
 .LBB5_2:
 	mov ecx, 2
diff --git a/rust/zerocopy/benches/new_vec_zeroed.x86-64.mca b/rust/zerocopy/benches/new_vec_zeroed.x86-64.mca
index b4fb4544ec39..f0e47d004ccc 100644
--- a/rust/zerocopy/benches/new_vec_zeroed.x86-64.mca
+++ b/rust/zerocopy/benches/new_vec_zeroed.x86-64.mca
@@ -1,11 +1,11 @@
 Iterations:        100
-Instructions:      3700
+Instructions:      3600
 Total Cycles:      3486
-Total uOps:        4600
+Total uOps:        4500
 
 Dispatch Width:    4
-uOps Per Cycle:    1.32
-IPC:               1.06
+uOps Per Cycle:    1.29
+IPC:               1.03
 Block RThroughput: 12.0
 
 
@@ -47,8 +47,7 @@ Instruction Info:
  1      1     1.00           *            mov	qword ptr [rax + 8], rcx
  1      1     1.00           *            mov	qword ptr [rax + 16], rsi
  1      1     1.00                  U     ret
- 1      1     0.33                        movabs	rcx, -9223372036854775808
- 1      1     1.00           *            mov	qword ptr [rax], rcx
+ 1      1     1.00           *            mov	qword ptr [rax], -1
  1      1     1.00                  U     ret
  1      1     0.33                        mov	ecx, 2
  1      1     1.00           *            mov	qword ptr [rax], rsi
@@ -70,31 +69,31 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.99   6.99   12.00  10.02  8.00   9.00   
+ -      -     5.99   6.01   12.00  11.00  8.00   9.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.01   0.98    -     0.01    -      -     mov	rax, rdi
- -      -     0.98   0.02    -      -      -      -     movabs	rcx, 1537228672809129301
- -      -     0.02   0.98    -      -      -      -     cmp	rsi, rcx
+ -      -     0.97   0.02    -     0.01    -      -     mov	rax, rdi
+ -      -     0.02   0.98    -      -      -      -     movabs	rcx, 1537228672809129301
+ -      -     0.97   0.03    -      -      -      -     cmp	rsi, rcx
  -      -      -      -      -     1.00    -      -     ja	.LBB5_5
- -      -     0.98    -      -     0.02    -      -     test	rsi, rsi
+ -      -     0.03   0.96    -     0.01    -      -     test	rsi, rsi
  -      -      -      -      -     1.00    -      -     je	.LBB5_2
  -      -      -      -     1.00    -      -     1.00   push	r15
  -      -      -      -     1.00    -     1.00    -     push	r14
  -      -      -      -     1.00    -      -     1.00   push	rbx
- -      -      -     1.00    -      -      -      -     lea	rcx, [rsi + rsi]
- -      -      -     1.00    -      -      -      -     lea	rbx, [rcx + 2*rcx]
- -      -     1.00    -      -      -      -      -     mov	r14, rax
- -      -     1.00    -      -      -      -      -     mov	r15, rsi
+ -      -     0.99   0.01    -      -      -      -     lea	rcx, [rsi + rsi]
+ -      -     0.99   0.01    -      -      -      -     lea	rbx, [rcx + 2*rcx]
+ -      -     0.01   0.99    -      -      -      -     mov	r14, rax
+ -      -     0.01   0.01    -     0.98    -      -     mov	r15, rsi
  -      -      -      -     1.00   1.00   2.00    -     call	qword ptr [rip + __rustc::__rust_no_alloc_shim_is_unstable_v2@GOTPCREL]
- -      -      -     0.01    -     0.99    -      -     mov	esi, 2
- -      -     0.01   0.99    -      -      -      -     mov	rdi, rbx
+ -      -      -     0.98    -     0.02    -      -     mov	esi, 2
+ -      -     0.96   0.02    -     0.02    -      -     mov	rdi, rbx
  -      -      -      -     1.00   1.00    -     2.00   call	qword ptr [rip + __rustc::__rust_alloc_zeroed@GOTPCREL]
- -      -     0.01    -      -     0.99    -      -     mov	rsi, r15
- -      -     0.99   0.01    -      -      -      -     mov	rcx, rax
- -      -      -     0.99    -     0.01    -      -     mov	rax, r14
- -      -     0.99   0.01    -      -      -      -     test	rcx, rcx
+ -      -     0.02   0.96    -     0.02    -      -     mov	rsi, r15
+ -      -     0.02   0.02    -     0.96    -      -     mov	rcx, rax
+ -      -     0.96   0.02    -     0.02    -      -     mov	rax, r14
+ -      -     0.02   0.02    -     0.96    -      -     test	rcx, rcx
  -      -      -      -      -      -      -     1.00   pop	rbx
  -      -      -      -      -      -     1.00    -     pop	r14
  -      -      -      -      -      -      -     1.00   pop	r15
@@ -103,10 +102,9 @@ Resource pressure by instruction:
  -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rcx
  -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rsi
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.01   0.99    -      -      -      -     movabs	rcx, -9223372036854775808
- -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rcx
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], -1
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.99   0.01    -      -      -      -     mov	ecx, 2
+ -      -     0.02   0.98    -      -      -      -     mov	ecx, 2
  -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
  -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rcx
  -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rsi
diff --git a/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64
index e844a4608fac..7f695f942e67 100644
--- a/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64
@@ -1,22 +1,21 @@
 bench_ref_from_bytes_dynamic_padding:
-	test dil, 3
-	jne .LBB5_3
-	movabs rax, 9223372036854775804
-	and rax, rsi
-	cmp rax, 9
-	jb .LBB5_3
-	add rax, -9
+	cmp rsi, 12
+	setae al
+	mov ecx, esi
+	or ecx, edi
+	test cl, 3
+	sete cl
+	and cl, al
+	cmp cl, 1
+	je .LBB5_2
+	xor edi, edi
+	mov rax, rdi
+	ret
+.LBB5_2:
+	add rsi, -9
 	movabs rcx, -6148914691236517205
+	mov rax, rsi
 	mul rcx
 	shr rdx
-	lea rax, [rdx + 2*rdx]
-	or rax, 3
-	add rax, 9
-	cmp rsi, rax
-	je .LBB5_4
-.LBB5_3:
-	xor edi, edi
-	mov rdx, rsi
-.LBB5_4:
 	mov rax, rdi
 	ret
diff --git a/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64.mca
index 423ed38ba28d..5eb4fd1a113d 100644
--- a/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64.mca
@@ -1,11 +1,11 @@
 Iterations:        100
 Instructions:      1900
-Total Cycles:      645
+Total Cycles:      641
 Total uOps:        2000
 
 Dispatch Width:    4
-uOps Per Cycle:    3.10
-IPC:               2.95
+uOps Per Cycle:    3.12
+IPC:               2.96
 Block RThroughput: 5.0
 
 
@@ -18,23 +18,23 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        test	dil, 3
- 1      1     1.00                        jne	.LBB5_3
- 1      1     0.33                        movabs	rax, 9223372036854775804
- 1      1     0.33                        and	rax, rsi
- 1      1     0.33                        cmp	rax, 9
- 1      1     1.00                        jb	.LBB5_3
- 1      1     0.33                        add	rax, -9
+ 1      1     0.33                        cmp	rsi, 12
+ 1      1     0.50                        setae	al
+ 1      1     0.33                        mov	ecx, esi
+ 1      1     0.33                        or	ecx, edi
+ 1      1     0.33                        test	cl, 3
+ 1      1     0.50                        sete	cl
+ 1      1     0.33                        and	cl, al
+ 1      1     0.33                        cmp	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	edi, edi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+ 1      1     0.33                        add	rsi, -9
  1      1     0.33                        movabs	rcx, -6148914691236517205
+ 1      1     0.33                        mov	rax, rsi
  2      4     1.00                        mul	rcx
  1      1     0.50                        shr	rdx
- 1      1     0.50                        lea	rax, [rdx + 2*rdx]
- 1      1     0.33                        or	rax, 3
- 1      1     0.33                        add	rax, 9
- 1      1     0.33                        cmp	rsi, rax
- 1      1     1.00                        je	.LBB5_4
- 1      0     0.25                        xor	edi, edi
- 1      1     0.33                        mov	rdx, rsi
  1      1     0.33                        mov	rax, rdi
  1      1     1.00                  U     ret
 
@@ -52,26 +52,26 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.32   6.33    -     6.35    -      -     
+ -      -     6.33   6.33    -     6.34    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.64   0.35    -     0.01    -      -     test	dil, 3
- -      -      -      -      -     1.00    -      -     jne	.LBB5_3
- -      -     0.34   0.65    -     0.01    -      -     movabs	rax, 9223372036854775804
- -      -     0.35   0.65    -      -      -      -     and	rax, rsi
- -      -     0.33   0.34    -     0.33    -      -     cmp	rax, 9
- -      -      -      -      -     1.00    -      -     jb	.LBB5_3
- -      -     0.35    -      -     0.65    -      -     add	rax, -9
- -      -     0.97   0.01    -     0.02    -      -     movabs	rcx, -6148914691236517205
- -      -     1.00   1.00    -      -      -      -     mul	rcx
- -      -     0.99    -      -     0.01    -      -     shr	rdx
- -      -     0.33   0.67    -      -      -      -     lea	rax, [rdx + 2*rdx]
- -      -     0.34   0.66    -      -      -      -     or	rax, 3
- -      -     0.33   0.66    -     0.01    -      -     add	rax, 9
- -      -     0.01   0.99    -      -      -      -     cmp	rsi, rax
- -      -      -      -      -     1.00    -      -     je	.LBB5_4
+ -      -     0.99    -      -     0.01    -      -     cmp	rsi, 12
+ -      -     1.00    -      -      -      -      -     setae	al
+ -      -      -     0.34    -     0.66    -      -     mov	ecx, esi
+ -      -      -     0.99    -     0.01    -      -     or	ecx, edi
+ -      -      -     1.00    -      -      -      -     test	cl, 3
+ -      -     0.67    -      -     0.33    -      -     sete	cl
+ -      -      -     1.00    -      -      -      -     and	cl, al
+ -      -      -     1.00    -      -      -      -     cmp	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
  -      -      -      -      -      -      -      -     xor	edi, edi
- -      -     0.32   0.01    -     0.67    -      -     mov	rdx, rsi
- -      -     0.02   0.34    -     0.64    -      -     mov	rax, rdi
+ -      -     0.66    -      -     0.34    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.35   0.01    -     0.64    -      -     add	rsi, -9
+ -      -     0.65   0.33    -     0.02    -      -     movabs	rcx, -6148914691236517205
+ -      -     0.01   0.33    -     0.66    -      -     mov	rax, rsi
+ -      -     1.00   1.00    -      -      -      -     mul	rcx
+ -      -     1.00    -      -      -      -      -     shr	rdx
+ -      -      -     0.33    -     0.67    -      -     mov	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64
index cc905b76c06f..43cadf352783 100644
--- a/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64
@@ -1,20 +1,11 @@
 bench_ref_from_bytes_dynamic_size:
 	mov rdx, rsi
-	cmp rsi, 4
-	setb al
-	or al, dil
-	test al, 1
-	je .LBB5_2
+	mov ecx, edx
+	or ecx, edi
 	xor eax, eax
-	ret
-.LBB5_2:
-	lea rcx, [rdx - 4]
-	mov rsi, rcx
-	and rsi, -2
-	add rsi, 4
-	shr rcx
-	xor eax, eax
-	cmp rdx, rsi
-	cmove rdx, rcx
+	sub rdx, 4
+	cmovb rdi, rax
+	shr rdx
+	test cl, 1
 	cmove rax, rdi
 	ret
diff --git a/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64.mca
index 68aea583e401..444f4fad4ff3 100644
--- a/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1800
-Total Cycles:      704
-Total uOps:        2000
+Instructions:      1000
+Total Cycles:      373
+Total uOps:        1200
 
 Dispatch Width:    4
-uOps Per Cycle:    2.84
-IPC:               2.56
-Block RThroughput: 5.0
+uOps Per Cycle:    3.22
+IPC:               2.68
+Block RThroughput: 3.0
 
 
 Instruction Info:
@@ -19,21 +19,13 @@ Instruction Info:
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        mov	rdx, rsi
- 1      1     0.33                        cmp	rsi, 4
- 1      1     0.50                        setb	al
- 1      1     0.33                        or	al, dil
- 1      1     0.33                        test	al, 1
- 1      1     1.00                        je	.LBB5_2
+ 1      1     0.33                        mov	ecx, edx
+ 1      1     0.33                        or	ecx, edi
  1      0     0.25                        xor	eax, eax
- 1      1     1.00                  U     ret
- 1      1     0.50                        lea	rcx, [rdx - 4]
- 1      1     0.33                        mov	rsi, rcx
- 1      1     0.33                        and	rsi, -2
- 1      1     0.33                        add	rsi, 4
- 1      1     0.50                        shr	rcx
- 1      0     0.25                        xor	eax, eax
- 1      1     0.33                        cmp	rdx, rsi
- 2      2     0.67                        cmove	rdx, rcx
+ 1      1     0.33                        sub	rdx, 4
+ 2      2     0.67                        cmovb	rdi, rax
+ 1      1     0.50                        shr	rdx
+ 1      1     0.33                        test	cl, 1
  2      2     0.67                        cmove	rax, rdi
  1      1     1.00                  U     ret
 
@@ -51,25 +43,17 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     5.97   5.98    -     6.05    -      -     
+ -      -     3.66   3.67    -     3.67    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.97   0.01    -     0.02    -      -     mov	rdx, rsi
- -      -     0.01   0.02    -     0.97    -      -     cmp	rsi, 4
- -      -     0.03    -      -     0.97    -      -     setb	al
- -      -     0.01   0.02    -     0.97    -      -     or	al, dil
- -      -      -     0.98    -     0.02    -      -     test	al, 1
- -      -      -      -      -     1.00    -      -     je	.LBB5_2
- -      -      -      -      -      -      -      -     xor	eax, eax
- -      -      -      -      -     1.00    -      -     ret
- -      -     0.98   0.02    -      -      -      -     lea	rcx, [rdx - 4]
- -      -     0.01   0.99    -      -      -      -     mov	rsi, rcx
- -      -      -     0.98    -     0.02    -      -     and	rsi, -2
- -      -     0.98   0.01    -     0.01    -      -     add	rsi, 4
- -      -     0.99    -      -     0.01    -      -     shr	rcx
+ -      -     0.32   0.01    -     0.67    -      -     mov	rdx, rsi
+ -      -     0.33   0.35    -     0.32    -      -     mov	ecx, edx
+ -      -     0.01   0.34    -     0.65    -      -     or	ecx, edi
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.02   0.97    -     0.01    -      -     cmp	rdx, rsi
- -      -     0.99   0.99    -     0.02    -      -     cmove	rdx, rcx
- -      -     0.98   0.99    -     0.03    -      -     cmove	rax, rdi
+ -      -     0.67   0.33    -      -      -      -     sub	rdx, 4
+ -      -     0.99   0.98    -     0.03    -      -     cmovb	rdi, rax
+ -      -     0.03    -      -     0.97    -      -     shr	rdx
+ -      -     0.32   0.67    -     0.01    -      -     test	cl, 1
+ -      -     0.99   0.99    -     0.02    -      -     cmove	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64 b/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64
index 2c8da68c8b5b..0e16b103344f 100644
--- a/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64
+++ b/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64
@@ -1,8 +1,7 @@
 bench_ref_from_bytes_static_size:
-	mov ecx, edi
-	and ecx, 1
-	xor rsi, 6
 	xor eax, eax
-	or rsi, rcx
+	test dil, 1
+	cmovne rdi, rax
+	cmp rsi, 6
 	cmove rax, rdi
 	ret
diff --git a/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64.mca b/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64.mca
index 832697801ee2..f1e118abf09a 100644
--- a/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_bytes_static_size.x86-64.mca
@@ -1,11 +1,11 @@
 Iterations:        100
-Instructions:      700
-Total Cycles:      240
+Instructions:      600
+Total Cycles:      305
 Total uOps:        800
 
 Dispatch Width:    4
-uOps Per Cycle:    3.33
-IPC:               2.92
+uOps Per Cycle:    2.62
+IPC:               1.97
 Block RThroughput: 2.0
 
 
@@ -18,11 +18,10 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        mov	ecx, edi
- 1      1     0.33                        and	ecx, 1
- 1      1     0.33                        xor	rsi, 6
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        or	rsi, rcx
+ 1      1     0.33                        test	dil, 1
+ 2      2     0.67                        cmovne	rdi, rax
+ 1      1     0.33                        cmp	rsi, 6
  2      2     0.67                        cmove	rax, rdi
  1      1     1.00                  U     ret
 
@@ -40,14 +39,13 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     2.33   2.33    -     2.34    -      -     
+ -      -     1.95   2.28    -     2.77    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.01   0.98    -     0.01    -      -     mov	ecx, edi
- -      -     0.02   0.66    -     0.32    -      -     and	ecx, 1
- -      -     0.33   0.66    -     0.01    -      -     xor	rsi, 6
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.98   0.02    -      -      -      -     or	rsi, rcx
- -      -     0.99   0.01    -     1.00    -      -     cmove	rax, rdi
+ -      -     0.05   0.06    -     0.89    -      -     test	dil, 1
+ -      -     0.95   0.94    -     0.11    -      -     cmovne	rdi, rax
+ -      -      -     0.34    -     0.66    -      -     cmp	rsi, 6
+ -      -     0.95   0.94    -     0.11    -      -     cmove	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64
index a58592a24503..e7f7820a69d1 100644
--- a/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64
@@ -1,19 +1,19 @@
 bench_ref_from_prefix_dynamic_padding:
+	test dil, 3
+	sete al
+	cmp rsi, 12
+	setae cl
+	test al, cl
+	jne .LBB5_2
 	xor edx, edx
-	mov eax, 0
 	test dil, 3
-	je .LBB5_1
-	ret
-.LBB5_1:
-	movabs rax, 9223372036854775804
-	and rsi, rax
-	cmp rsi, 9
-	jae .LBB5_3
-	mov edx, 1
-	xor eax, eax
+	sete dl
+	xor edi, edi
+	mov rax, rdi
 	ret
-.LBB5_3:
-	add rsi, -9
+.LBB5_2:
+	or rsi, 3
+	add rsi, -12
 	movabs rcx, -6148914691236517205
 	mov rax, rsi
 	mul rcx
diff --git a/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64.mca
index 62ea4babaf28..a3d68f37a8be 100644
--- a/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1900
-Total Cycles:      608
-Total uOps:        2000
+Instructions:      2000
+Total Cycles:      640
+Total uOps:        2100
 
 Dispatch Width:    4
-uOps Per Cycle:    3.29
+uOps Per Cycle:    3.28
 IPC:               3.13
-Block RThroughput: 5.0
+Block RThroughput: 5.3
 
 
 Instruction Info:
@@ -18,19 +18,20 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        test	dil, 3
+ 1      1     0.50                        sete	al
+ 1      1     0.33                        cmp	rsi, 12
+ 1      1     0.50                        setae	cl
+ 1      1     0.33                        test	al, cl
+ 1      1     1.00                        jne	.LBB5_2
  1      0     0.25                        xor	edx, edx
- 1      1     0.33                        mov	eax, 0
  1      1     0.33                        test	dil, 3
- 1      1     1.00                        je	.LBB5_1
- 1      1     1.00                  U     ret
- 1      1     0.33                        movabs	rax, 9223372036854775804
- 1      1     0.33                        and	rsi, rax
- 1      1     0.33                        cmp	rsi, 9
- 1      1     1.00                        jae	.LBB5_3
- 1      1     0.33                        mov	edx, 1
- 1      0     0.25                        xor	eax, eax
+ 1      1     0.50                        sete	dl
+ 1      0     0.25                        xor	edi, edi
+ 1      1     0.33                        mov	rax, rdi
  1      1     1.00                  U     ret
- 1      1     0.33                        add	rsi, -9
+ 1      1     0.33                        or	rsi, 3
+ 1      1     0.33                        add	rsi, -12
  1      1     0.33                        movabs	rcx, -6148914691236517205
  1      1     0.33                        mov	rax, rsi
  2      4     1.00                        mul	rcx
@@ -52,26 +53,27 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.00   6.00    -     6.00    -      -     
+ -      -     6.33   6.33    -     6.34    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.65   0.34    -     0.01    -      -     test	dil, 3
+ -      -     0.99    -      -     0.01    -      -     sete	al
+ -      -     0.01   0.33    -     0.66    -      -     cmp	rsi, 12
+ -      -     0.34    -      -     0.66    -      -     setae	cl
+ -      -     1.00    -      -      -      -      -     test	al, cl
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_2
  -      -      -      -      -      -      -      -     xor	edx, edx
- -      -     0.01   0.98    -     0.01    -      -     mov	eax, 0
- -      -     0.98   0.01    -     0.01    -      -     test	dil, 3
- -      -      -      -      -     1.00    -      -     je	.LBB5_1
- -      -      -      -      -     1.00    -      -     ret
- -      -     0.01   0.99    -      -      -      -     movabs	rax, 9223372036854775804
- -      -      -     1.00    -      -      -      -     and	rsi, rax
- -      -      -     1.00    -      -      -      -     cmp	rsi, 9
- -      -      -      -      -     1.00    -      -     jae	.LBB5_3
- -      -     1.00    -      -      -      -      -     mov	edx, 1
- -      -      -      -      -      -      -      -     xor	eax, eax
+ -      -      -     0.99    -     0.01    -      -     test	dil, 3
+ -      -      -      -      -     1.00    -      -     sete	dl
+ -      -      -      -      -      -      -      -     xor	edi, edi
+ -      -      -     1.00    -      -      -      -     mov	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.02   0.02    -     0.96    -      -     add	rsi, -9
- -      -     0.99   0.01    -      -      -      -     movabs	rcx, -6148914691236517205
- -      -     0.01   0.99    -      -      -      -     mov	rax, rsi
+ -      -     0.01   0.99    -      -      -      -     or	rsi, 3
+ -      -     0.33   0.67    -      -      -      -     add	rsi, -12
+ -      -     0.66   0.34    -      -      -      -     movabs	rcx, -6148914691236517205
+ -      -     0.34   0.33    -     0.33    -      -     mov	rax, rsi
  -      -     1.00   1.00    -      -      -      -     mul	rcx
  -      -     1.00    -      -      -      -      -     shr	rdx
- -      -     0.98    -      -     0.02    -      -     mov	rax, rdi
+ -      -      -     0.34    -     0.66    -      -     mov	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64
index fe6332c9100c..3f2e87467897 100644
--- a/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64
@@ -1,17 +1,10 @@
 bench_ref_from_prefix_dynamic_size:
-	xor edx, edx
-	mov eax, 0
-	test dil, 1
-	jne .LBB5_4
-	cmp rsi, 4
-	jae .LBB5_3
-	mov edx, 1
-	xor eax, eax
-	ret
-.LBB5_3:
-	add rsi, -4
-	shr rsi
 	mov rdx, rsi
-	mov rax, rdi
-.LBB5_4:
+	xor eax, eax
+	sub rdx, 4
+	mov rcx, rdi
+	cmovb rcx, rax
+	shr rdx
+	test dil, 1
+	cmove rax, rcx
 	ret
diff --git a/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64.mca
index 3900a5946138..7ee51e0b8a40 100644
--- a/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1400
-Total Cycles:      405
-Total uOps:        1400
+Instructions:      900
+Total Cycles:      339
+Total uOps:        1100
 
 Dispatch Width:    4
-uOps Per Cycle:    3.46
-IPC:               3.46
-Block RThroughput: 4.0
+uOps Per Cycle:    3.24
+IPC:               2.65
+Block RThroughput: 2.8
 
 
 Instruction Info:
@@ -18,19 +18,14 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      0     0.25                        xor	edx, edx
- 1      1     0.33                        mov	eax, 0
- 1      1     0.33                        test	dil, 1
- 1      1     1.00                        jne	.LBB5_4
- 1      1     0.33                        cmp	rsi, 4
- 1      1     1.00                        jae	.LBB5_3
- 1      1     0.33                        mov	edx, 1
- 1      0     0.25                        xor	eax, eax
- 1      1     1.00                  U     ret
- 1      1     0.33                        add	rsi, -4
- 1      1     0.50                        shr	rsi
  1      1     0.33                        mov	rdx, rsi
- 1      1     0.33                        mov	rax, rdi
+ 1      0     0.25                        xor	eax, eax
+ 1      1     0.33                        sub	rdx, 4
+ 1      1     0.33                        mov	rcx, rdi
+ 2      2     0.67                        cmovb	rcx, rax
+ 1      1     0.50                        shr	rdx
+ 1      1     0.33                        test	dil, 1
+ 2      2     0.67                        cmove	rax, rcx
  1      1     1.00                  U     ret
 
 
@@ -47,21 +42,16 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     3.99   3.99    -     4.02    -      -     
+ -      -     3.33   3.33    -     3.34    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -      -      -      -      -      -      -     xor	edx, edx
- -      -     0.01   0.98    -     0.01    -      -     mov	eax, 0
- -      -     0.98   0.02    -      -      -      -     test	dil, 1
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -     0.02   0.98    -      -      -      -     cmp	rsi, 4
- -      -      -      -      -     1.00    -      -     jae	.LBB5_3
- -      -     0.98   0.01    -     0.01    -      -     mov	edx, 1
+ -      -     0.33   0.66    -     0.01    -      -     mov	rdx, rsi
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -      -      -      -     1.00    -      -     ret
- -      -     0.01   0.99    -      -      -      -     add	rsi, -4
- -      -     1.00    -      -      -      -      -     shr	rsi
- -      -      -     1.00    -      -      -      -     mov	rdx, rsi
- -      -     0.99   0.01    -      -      -      -     mov	rax, rdi
+ -      -     0.01    -      -     0.99    -      -     sub	rdx, 4
+ -      -     0.66   0.34    -      -      -      -     mov	rcx, rdi
+ -      -     1.00   1.00    -      -      -      -     cmovb	rcx, rax
+ -      -     0.33    -      -     0.67    -      -     shr	rdx
+ -      -      -     0.33    -     0.67    -      -     test	dil, 1
+ -      -     1.00   1.00    -      -      -      -     cmove	rax, rcx
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64
index 3e05f6023f38..68f21fe8018a 100644
--- a/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64
@@ -1,23 +1,22 @@
 bench_ref_from_suffix_dynamic_padding:
 	lea eax, [rsi + rdi]
 	test al, 3
-	jne .LBB5_1
-	movabs rax, 9223372036854775804
-	and rax, rsi
-	cmp rax, 9
-	jae .LBB5_3
-.LBB5_1:
-	xor eax, eax
+	setne al
+	cmp rsi, 12
+	setb cl
+	or cl, al
+	je .LBB5_2
+	xor edi, edi
+	mov rax, rdi
 	ret
-.LBB5_3:
-	add rax, -9
+.LBB5_2:
+	mov rax, rsi
+	or rax, 3
+	add rax, -12
 	movabs rcx, -6148914691236517205
 	mul rcx
 	shr rdx
-	lea rax, [rdx + 2*rdx]
-	sub rsi, rax
-	or rax, -4
-	add rsi, rdi
-	add rax, rsi
-	add rax, -8
+	and esi, 3
+	add rdi, rsi
+	mov rax, rdi
 	ret
diff --git a/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64.mca
index 73599d5b6aab..c31e098aed4f 100644
--- a/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64.mca
@@ -1,11 +1,11 @@
 Iterations:        100
 Instructions:      2000
-Total Cycles:      682
+Total Cycles:      673
 Total uOps:        2100
 
 Dispatch Width:    4
-uOps Per Cycle:    3.08
-IPC:               2.93
+uOps Per Cycle:    3.12
+IPC:               2.97
 Block RThroughput: 5.3
 
 
@@ -20,23 +20,23 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.50                        lea	eax, [rsi + rdi]
  1      1     0.33                        test	al, 3
- 1      1     1.00                        jne	.LBB5_1
- 1      1     0.33                        movabs	rax, 9223372036854775804
- 1      1     0.33                        and	rax, rsi
- 1      1     0.33                        cmp	rax, 9
- 1      1     1.00                        jae	.LBB5_3
- 1      0     0.25                        xor	eax, eax
+ 1      1     0.50                        setne	al
+ 1      1     0.33                        cmp	rsi, 12
+ 1      1     0.50                        setb	cl
+ 1      1     0.33                        or	cl, al
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	edi, edi
+ 1      1     0.33                        mov	rax, rdi
  1      1     1.00                  U     ret
- 1      1     0.33                        add	rax, -9
+ 1      1     0.33                        mov	rax, rsi
+ 1      1     0.33                        or	rax, 3
+ 1      1     0.33                        add	rax, -12
  1      1     0.33                        movabs	rcx, -6148914691236517205
  2      4     1.00                        mul	rcx
  1      1     0.50                        shr	rdx
- 1      1     0.50                        lea	rax, [rdx + 2*rdx]
- 1      1     0.33                        sub	rsi, rax
- 1      1     0.33                        or	rax, -4
- 1      1     0.33                        add	rsi, rdi
- 1      1     0.33                        add	rax, rsi
- 1      1     0.33                        add	rax, -8
+ 1      1     0.33                        and	esi, 3
+ 1      1     0.33                        add	rdi, rsi
+ 1      1     0.33                        mov	rax, rdi
  1      1     1.00                  U     ret
 
 
@@ -53,27 +53,27 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.65   6.67    -     6.68    -      -     
+ -      -     6.67   6.66    -     6.67    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.90   0.10    -      -      -      -     lea	eax, [rsi + rdi]
- -      -     0.93    -      -     0.07    -      -     test	al, 3
- -      -      -      -      -     1.00    -      -     jne	.LBB5_1
- -      -     0.51   0.47    -     0.02    -      -     movabs	rax, 9223372036854775804
- -      -      -      -      -     1.00    -      -     and	rax, rsi
- -      -      -     0.09    -     0.91    -      -     cmp	rax, 9
- -      -      -      -      -     1.00    -      -     jae	.LBB5_3
- -      -      -      -      -      -      -      -     xor	eax, eax
+ -      -     0.35   0.65    -      -      -      -     lea	eax, [rsi + rdi]
+ -      -     0.01   0.99    -      -      -      -     test	al, 3
+ -      -     1.00    -      -      -      -      -     setne	al
+ -      -     0.97    -      -     0.03    -      -     cmp	rsi, 12
+ -      -     0.66    -      -     0.34    -      -     setb	cl
+ -      -      -     1.00    -      -      -      -     or	cl, al
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	edi, edi
+ -      -     0.01   0.01    -     0.98    -      -     mov	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.43   0.47    -     0.10    -      -     add	rax, -9
- -      -     0.42   0.39    -     0.19    -      -     movabs	rcx, -6148914691236517205
+ -      -     0.01   0.99    -      -      -      -     mov	rax, rsi
+ -      -      -     0.34    -     0.66    -      -     or	rax, 3
+ -      -      -     1.00    -      -      -      -     add	rax, -12
+ -      -     0.66   0.31    -     0.03    -      -     movabs	rcx, -6148914691236517205
  -      -     1.00   1.00    -      -      -      -     mul	rcx
- -      -     0.69    -      -     0.31    -      -     shr	rdx
- -      -     0.54   0.46    -      -      -      -     lea	rax, [rdx + 2*rdx]
- -      -     0.07   0.91    -     0.02    -      -     sub	rsi, rax
- -      -     0.91   0.05    -     0.04    -      -     or	rax, -4
- -      -     0.08   0.90    -     0.02    -      -     add	rsi, rdi
- -      -     0.09   0.91    -      -      -      -     add	rax, rsi
- -      -     0.08   0.92    -      -      -      -     add	rax, -8
+ -      -     1.00    -      -      -      -      -     shr	rdx
+ -      -     0.67   0.01    -     0.32    -      -     and	esi, 3
+ -      -     0.32   0.01    -     0.67    -      -     add	rdi, rsi
+ -      -     0.01   0.35    -     0.64    -      -     mov	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64
index c3d10b5fc685..7d11849dd5c5 100644
--- a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64
@@ -1,27 +1,21 @@
 bench_ref_from_suffix_with_elems_dynamic_padding:
-	movabs rax, 3074457345618258598
-	cmp rdx, rax
-	ja .LBB5_1
-	lea r8d, [rsi + rdi]
-	xor ecx, ecx
-	mov eax, 0
-	test r8b, 3
-	je .LBB5_3
-	mov rdx, rcx
-	ret
+	movabs rcx, 3074457345618258598
+	cmp rdx, rcx
+	ja .LBB5_3
+	mov rax, rdi
+	lea rcx, [rdx + 2*rdx]
+	or rcx, 3
+	add rcx, 9
+	add edi, esi
+	test dil, 3
+	setne dil
+	sub rsi, rcx
+	setb cl
+	or cl, dil
+	je .LBB5_4
 .LBB5_3:
-	lea rax, [rdx + 2*rdx]
-	or rax, 3
-	add rax, 9
-	sub rsi, rax
-	jae .LBB5_4
-.LBB5_1:
 	xor eax, eax
-	mov edx, 1
 	ret
 .LBB5_4:
-	add rdi, rsi
-	mov rcx, rdx
-	mov rax, rdi
-	mov rdx, rcx
+	add rax, rsi
 	ret
diff --git a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
index 92e6280bb4cc..d7850d93bc10 100644
--- a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      2300
-Total Cycles:      706
-Total uOps:        2300
+Instructions:      1800
+Total Cycles:      572
+Total uOps:        1800
 
 Dispatch Width:    4
-uOps Per Cycle:    3.26
-IPC:               3.26
-Block RThroughput: 6.0
+uOps Per Cycle:    3.15
+IPC:               3.15
+Block RThroughput: 4.5
 
 
 Instruction Info:
@@ -18,28 +18,23 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        movabs	rax, 3074457345618258598
- 1      1     0.33                        cmp	rdx, rax
- 1      1     1.00                        ja	.LBB5_1
- 1      1     0.50                        lea	r8d, [rsi + rdi]
- 1      0     0.25                        xor	ecx, ecx
- 1      1     0.33                        mov	eax, 0
- 1      1     0.33                        test	r8b, 3
- 1      1     1.00                        je	.LBB5_3
- 1      1     0.33                        mov	rdx, rcx
- 1      1     1.00                  U     ret
- 1      1     0.50                        lea	rax, [rdx + 2*rdx]
- 1      1     0.33                        or	rax, 3
- 1      1     0.33                        add	rax, 9
- 1      1     0.33                        sub	rsi, rax
- 1      1     1.00                        jae	.LBB5_4
+ 1      1     0.33                        movabs	rcx, 3074457345618258598
+ 1      1     0.33                        cmp	rdx, rcx
+ 1      1     1.00                        ja	.LBB5_3
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	rcx, [rdx + 2*rdx]
+ 1      1     0.33                        or	rcx, 3
+ 1      1     0.33                        add	rcx, 9
+ 1      1     0.33                        add	edi, esi
+ 1      1     0.33                        test	dil, 3
+ 1      1     0.50                        setne	dil
+ 1      1     0.33                        sub	rsi, rcx
+ 1      1     0.50                        setb	cl
+ 1      1     0.33                        or	cl, dil
+ 1      1     1.00                        je	.LBB5_4
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        mov	edx, 1
  1      1     1.00                  U     ret
- 1      1     0.33                        add	rdi, rsi
- 1      1     0.33                        mov	rcx, rdx
- 1      1     0.33                        mov	rax, rdi
- 1      1     0.33                        mov	rdx, rcx
+ 1      1     0.33                        add	rax, rsi
  1      1     1.00                  U     ret
 
 
@@ -56,30 +51,25 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.99   7.00    -     7.01    -      -     
+ -      -     5.66   5.66    -     5.68    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -      -     0.99    -     0.01    -      -     movabs	rax, 3074457345618258598
- -      -     0.01   0.50    -     0.49    -      -     cmp	rdx, rax
- -      -      -      -      -     1.00    -      -     ja	.LBB5_1
- -      -      -     1.00    -      -      -      -     lea	r8d, [rsi + rdi]
- -      -      -      -      -      -      -      -     xor	ecx, ecx
- -      -     0.50   0.49    -     0.01    -      -     mov	eax, 0
- -      -     0.49   0.51    -      -      -      -     test	r8b, 3
- -      -      -      -      -     1.00    -      -     je	.LBB5_3
- -      -     0.51   0.49    -      -      -      -     mov	rdx, rcx
- -      -      -      -      -     1.00    -      -     ret
- -      -     0.50   0.50    -      -      -      -     lea	rax, [rdx + 2*rdx]
- -      -     1.00    -      -      -      -      -     or	rax, 3
- -      -     1.00    -      -      -      -      -     add	rax, 9
- -      -     0.99   0.01    -      -      -      -     sub	rsi, rax
- -      -      -      -      -     1.00    -      -     jae	.LBB5_4
+ -      -     0.67    -      -     0.33    -      -     movabs	rcx, 3074457345618258598
+ -      -     0.34    -      -     0.66    -      -     cmp	rdx, rcx
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -     0.33   0.01    -     0.66    -      -     mov	rax, rdi
+ -      -     0.33   0.67    -      -      -      -     lea	rcx, [rdx + 2*rdx]
+ -      -     0.01   0.99    -      -      -      -     or	rcx, 3
+ -      -     0.01   0.99    -      -      -      -     add	rcx, 9
+ -      -     0.99    -      -     0.01    -      -     add	edi, esi
+ -      -     0.99   0.01    -      -      -      -     test	dil, 3
+ -      -     0.99    -      -     0.01    -      -     setne	dil
+ -      -      -     1.00    -      -      -      -     sub	rsi, rcx
+ -      -     1.00    -      -      -      -      -     setb	cl
+ -      -      -     0.99    -     0.01    -      -     or	cl, dil
+ -      -      -      -      -     1.00    -      -     je	.LBB5_4
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -      -     1.00    -      -      -      -     mov	edx, 1
  -      -      -      -      -     1.00    -      -     ret
- -      -     1.00    -      -      -      -      -     add	rdi, rsi
- -      -      -     1.00    -      -      -      -     mov	rcx, rdx
- -      -     0.99   0.01    -      -      -      -     mov	rax, rdi
- -      -      -     0.50    -     0.50    -      -     mov	rdx, rcx
+ -      -      -     1.00    -      -      -      -     add	rax, rsi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64
index bdca57192455..7ee0278dbf68 100644
--- a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64
@@ -1,23 +1,18 @@
 bench_ref_from_suffix_with_elems_dynamic_size:
-	movabs rax, 4611686018427387901
-	cmp rdx, rax
-	ja .LBB5_1
-	lea r8d, [rsi + rdi]
-	xor ecx, ecx
-	mov eax, 0
-	test r8b, 1
-	jne .LBB5_5
-	lea rax, [2*rdx + 4]
-	sub rsi, rax
-	jae .LBB5_4
-.LBB5_1:
+	movabs rcx, 4611686018427387901
+	cmp rdx, rcx
+	ja .LBB5_3
+	mov rax, rdi
+	lea rcx, [2*rdx + 4]
+	add edi, esi
+	sub rsi, rcx
+	setb cl
+	or cl, dil
+	test cl, 1
+	je .LBB5_4
+.LBB5_3:
 	xor eax, eax
-	mov edx, 1
 	ret
 .LBB5_4:
-	add rdi, rsi
-	mov rcx, rdx
-	mov rax, rdi
-.LBB5_5:
-	mov rdx, rcx
+	add rax, rsi
 	ret
diff --git a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64.mca
index 6d9de0b3eb5c..882316de3d27 100644
--- a/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1900
-Total Cycles:      571
-Total uOps:        1900
+Instructions:      1500
+Total Cycles:      472
+Total uOps:        1500
 
 Dispatch Width:    4
-uOps Per Cycle:    3.33
-IPC:               3.33
-Block RThroughput: 5.0
+uOps Per Cycle:    3.18
+IPC:               3.18
+Block RThroughput: 4.0
 
 
 Instruction Info:
@@ -18,24 +18,20 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        movabs	rax, 4611686018427387901
- 1      1     0.33                        cmp	rdx, rax
- 1      1     1.00                        ja	.LBB5_1
- 1      1     0.50                        lea	r8d, [rsi + rdi]
- 1      0     0.25                        xor	ecx, ecx
- 1      1     0.33                        mov	eax, 0
- 1      1     0.33                        test	r8b, 1
- 1      1     1.00                        jne	.LBB5_5
- 1      1     0.50                        lea	rax, [2*rdx + 4]
- 1      1     0.33                        sub	rsi, rax
- 1      1     1.00                        jae	.LBB5_4
+ 1      1     0.33                        movabs	rcx, 4611686018427387901
+ 1      1     0.33                        cmp	rdx, rcx
+ 1      1     1.00                        ja	.LBB5_3
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	rcx, [2*rdx + 4]
+ 1      1     0.33                        add	edi, esi
+ 1      1     0.33                        sub	rsi, rcx
+ 1      1     0.50                        setb	cl
+ 1      1     0.33                        or	cl, dil
+ 1      1     0.33                        test	cl, 1
+ 1      1     1.00                        je	.LBB5_4
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        mov	edx, 1
  1      1     1.00                  U     ret
- 1      1     0.33                        add	rdi, rsi
- 1      1     0.33                        mov	rcx, rdx
- 1      1     0.33                        mov	rax, rdi
- 1      1     0.33                        mov	rdx, rcx
+ 1      1     0.33                        add	rax, rsi
  1      1     1.00                  U     ret
 
 
@@ -52,26 +48,22 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     5.66   5.66    -     5.68    -      -     
+ -      -     4.66   4.66    -     4.68    -      -     
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.66   0.33    -     0.01    -      -     movabs	rax, 4611686018427387901
- -      -     0.01   0.99    -      -      -      -     cmp	rdx, rax
- -      -      -      -      -     1.00    -      -     ja	.LBB5_1
- -      -     0.99   0.01    -      -      -      -     lea	r8d, [rsi + rdi]
- -      -      -      -      -      -      -      -     xor	ecx, ecx
- -      -     0.33   0.33    -     0.34    -      -     mov	eax, 0
- -      -     0.33   0.34    -     0.33    -      -     test	r8b, 1
- -      -      -      -      -     1.00    -      -     jne	.LBB5_5
- -      -     0.34   0.66    -      -      -      -     lea	rax, [2*rdx + 4]
- -      -      -     1.00    -      -      -      -     sub	rsi, rax
- -      -      -      -      -     1.00    -      -     jae	.LBB5_4
+ -      -     0.99    -      -     0.01    -      -     movabs	rcx, 4611686018427387901
+ -      -     1.00    -      -      -      -      -     cmp	rdx, rcx
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -     0.63   0.02    -     0.35    -      -     mov	rax, rdi
+ -      -     0.35   0.65    -      -      -      -     lea	rcx, [2*rdx + 4]
+ -      -     0.65   0.03    -     0.32    -      -     add	edi, esi
+ -      -     0.03   0.97    -      -      -      -     sub	rsi, rcx
+ -      -     1.00    -      -      -      -      -     setb	cl
+ -      -      -     1.00    -      -      -      -     or	cl, dil
+ -      -     0.01   0.99    -      -      -      -     test	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_4
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     1.00    -      -      -      -      -     mov	edx, 1
  -      -      -      -      -     1.00    -      -     ret
- -      -      -     1.00    -      -      -      -     add	rdi, rsi
- -      -     1.00    -      -      -      -      -     mov	rcx, rdx
- -      -     0.32   0.68    -      -      -      -     mov	rax, rdi
- -      -     0.68   0.32    -      -      -      -     mov	rdx, rcx
+ -      -      -     1.00    -      -      -      -     add	rax, rsi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.rs
new file mode 100644
index 000000000000..8d4e26394596
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_bytes_dynamic_padding<'a>(
+    source: &'a Ref<&[u8], format::LocoPacket>,
+) -> &'a [u8] {
+    Ref::bytes(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64
new file mode 100644
index 000000000000..a44c1510fe02
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64
@@ -0,0 +1,4 @@
+bench_ref_type_bytes_dynamic_padding:
+	mov rax, qword ptr [rdi]
+	mov rdx, qword ptr [rdi + 8]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..a7f8947c0413
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64.mca
@@ -0,0 +1,45 @@
+Iterations:        100
+Instructions:      300
+Total Cycles:      107
+Total uOps:        300
+
+Dispatch Width:    4
+uOps Per Cycle:    2.80
+IPC:               2.80
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 8]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   1.00   1.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -      -     1.00   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     1.00    -     mov	rdx, qword ptr [rdi + 8]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_dynamic_size.rs b/rust/zerocopy/benches/ref_type_bytes_dynamic_size.rs
new file mode 100644
index 000000000000..ef7dcf83989d
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_dynamic_size.rs
@@ -0,0 +1,17 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_bytes_dynamic_size<'a>(source: &'a Ref<&[u8], format::LocoPacket>) -> &'a [u8] {
+    Ref::bytes(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64
new file mode 100644
index 000000000000..6ac3ad2f1fef
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64
@@ -0,0 +1,4 @@
+bench_ref_type_bytes_dynamic_size:
+	mov rax, qword ptr [rdi]
+	mov rdx, qword ptr [rdi + 8]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..a7f8947c0413
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64.mca
@@ -0,0 +1,45 @@
+Iterations:        100
+Instructions:      300
+Total Cycles:      107
+Total uOps:        300
+
+Dispatch Width:    4
+uOps Per Cycle:    2.80
+IPC:               2.80
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 8]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   1.00   1.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -      -     1.00   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     1.00    -     mov	rdx, qword ptr [rdi + 8]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.rs
new file mode 100644
index 000000000000..e99b6704bd9b
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_bytes_mut_dynamic_padding<'a>(
+    source: &'a mut Ref<&mut [u8], format::LocoPacket>,
+) -> &'a mut [u8] {
+    Ref::bytes_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64
new file mode 100644
index 000000000000..ebc6ee04941e
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64
@@ -0,0 +1,4 @@
+bench_ref_type_bytes_mut_dynamic_padding:
+	mov rax, qword ptr [rdi]
+	mov rdx, qword ptr [rdi + 8]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..a7f8947c0413
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64.mca
@@ -0,0 +1,45 @@
+Iterations:        100
+Instructions:      300
+Total Cycles:      107
+Total uOps:        300
+
+Dispatch Width:    4
+uOps Per Cycle:    2.80
+IPC:               2.80
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 8]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   1.00   1.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -      -     1.00   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     1.00    -     mov	rdx, qword ptr [rdi + 8]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.rs b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.rs
new file mode 100644
index 000000000000..badf9de19f06
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_bytes_mut_dynamic_size<'a>(
+    source: &'a mut Ref<&mut [u8], format::LocoPacket>,
+) -> &'a mut [u8] {
+    Ref::bytes_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64
new file mode 100644
index 000000000000..5d97d01e51e2
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64
@@ -0,0 +1,4 @@
+bench_ref_type_bytes_mut_dynamic_size:
+	mov rax, qword ptr [rdi]
+	mov rdx, qword ptr [rdi + 8]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..a7f8947c0413
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64.mca
@@ -0,0 +1,45 @@
+Iterations:        100
+Instructions:      300
+Total Cycles:      107
+Total uOps:        300
+
+Dispatch Width:    4
+uOps Per Cycle:    2.80
+IPC:               2.80
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 8]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   1.00   1.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -      -     1.00   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     1.00    -     mov	rdx, qword ptr [rdi + 8]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_static_size.rs b/rust/zerocopy/benches/ref_type_bytes_mut_static_size.rs
new file mode 100644
index 000000000000..1a49c2492a41
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_static_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_bytes_mut_static_size<'a>(
+    source: &'a mut Ref<&mut [u8], format::LocoPacket>,
+) -> &'a mut [u8] {
+    Ref::bytes_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64 b/rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64
new file mode 100644
index 000000000000..3411bd45e96a
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64
@@ -0,0 +1,4 @@
+bench_ref_type_bytes_mut_static_size:
+	mov rax, qword ptr [rdi]
+	mov rdx, qword ptr [rdi + 8]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64.mca
new file mode 100644
index 000000000000..a7f8947c0413
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64.mca
@@ -0,0 +1,45 @@
+Iterations:        100
+Instructions:      300
+Total Cycles:      107
+Total uOps:        300
+
+Dispatch Width:    4
+uOps Per Cycle:    2.80
+IPC:               2.80
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 8]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   1.00   1.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -      -     1.00   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     1.00    -     mov	rdx, qword ptr [rdi + 8]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_static_size.rs b/rust/zerocopy/benches/ref_type_bytes_static_size.rs
new file mode 100644
index 000000000000..b9c3fe5b7bb5
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_static_size.rs
@@ -0,0 +1,17 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_bytes_static_size<'a>(source: &'a Ref<&[u8], format::LocoPacket>) -> &'a [u8] {
+    Ref::bytes(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_bytes_static_size.x86-64 b/rust/zerocopy/benches/ref_type_bytes_static_size.x86-64
new file mode 100644
index 000000000000..10a024acaafd
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_static_size.x86-64
@@ -0,0 +1,4 @@
+bench_ref_type_bytes_static_size:
+	mov rax, qword ptr [rdi]
+	mov rdx, qword ptr [rdi + 8]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_bytes_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_bytes_static_size.x86-64.mca
new file mode 100644
index 000000000000..a7f8947c0413
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_bytes_static_size.x86-64.mca
@@ -0,0 +1,45 @@
+Iterations:        100
+Instructions:      300
+Total Cycles:      107
+Total uOps:        300
+
+Dispatch Width:    4
+uOps Per Cycle:    2.80
+IPC:               2.80
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 8]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   1.00   1.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -      -     1.00   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     1.00    -     mov	rdx, qword ptr [rdi + 8]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_deref_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_deref_dynamic_padding.rs
new file mode 100644
index 000000000000..c0ebe56ccc75
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_dynamic_padding.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_deref_dynamic_padding<'a>(
+    source: &'a Ref<&[u8], format::LocoPacket>,
+) -> &'a format::LocoPacket {
+    core::ops::Deref::deref(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64
new file mode 100644
index 000000000000..765c5305d86d
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64
@@ -0,0 +1,29 @@
+bench_ref_type_deref_dynamic_padding:
+	mov rdx, qword ptr [rdi + 16]
+	mov rax, qword ptr [rdi]
+	mov rcx, qword ptr [rdi + 8]
+	mov esi, 1
+	movabs rdi, 3074457345618258599
+	cmp rdx, rdi
+	jae .LBB8_3
+	test al, 3
+	jne .LBB8_2
+	lea rdi, [rdx + 2*rdx]
+	or rdi, 3
+	add rdi, 9
+	cmp rcx, rdi
+	jne .LBB8_3
+	ret
+.LBB8_2:
+	xor esi, esi
+.LBB8_3:
+	sub rsp, 24
+	mov qword ptr [rsp], rsi
+	mov qword ptr [rsp + 8], rax
+	mov qword ptr [rsp + 16], rcx
+	lea rdi, [rip + .Lanon.HASH.7]
+	lea rcx, [rip + .Lanon.HASH.1]
+	lea r8, [rip + .Lanon.HASH.9]
+	mov rdx, rsp
+	mov esi, 58
+	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..bea2c8a20ea7
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64.mca
@@ -0,0 +1,91 @@
+Iterations:        100
+Instructions:      2600
+Total Cycles:      1812
+Total uOps:        2900
+
+Dispatch Width:    4
+uOps Per Cycle:    1.60
+IPC:               1.43
+Block RThroughput: 7.3
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 16]
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rcx, qword ptr [rdi + 8]
+ 1      1     0.33                        mov	esi, 1
+ 1      1     0.33                        movabs	rdi, 3074457345618258599
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     1.00                        jae	.LBB8_3
+ 1      1     0.33                        test	al, 3
+ 1      1     1.00                        jne	.LBB8_2
+ 1      1     0.50                        lea	rdi, [rdx + 2*rdx]
+ 1      1     0.33                        or	rdi, 3
+ 1      1     0.33                        add	rdi, 9
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        jne	.LBB8_3
+ 1      1     1.00                  U     ret
+ 1      0     0.25                        xor	esi, esi
+ 1      1     0.33                        sub	rsp, 24
+ 1      1     1.00           *            mov	qword ptr [rsp], rsi
+ 1      1     1.00           *            mov	qword ptr [rsp + 8], rax
+ 1      1     1.00           *            mov	qword ptr [rsp + 16], rcx
+ 1      1     0.50                        lea	rdi, [rip + .Lanon.HASH.7]
+ 1      1     0.50                        lea	rcx, [rip + .Lanon.HASH.1]
+ 1      1     0.50                        lea	r8, [rip + .Lanon.HASH.9]
+ 1      1     0.33                        mov	rdx, rsp
+ 1      1     0.33                        mov	esi, 58
+ 4      7     1.00    *                   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.41   6.42   4.00   6.17   3.99   4.01   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.54   0.46   mov	rdx, qword ptr [rdi + 16]
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.49   0.51   mov	rcx, qword ptr [rdi + 8]
+ -      -     0.52   0.47    -     0.01    -      -     mov	esi, 1
+ -      -     0.47   0.53    -      -      -      -     movabs	rdi, 3074457345618258599
+ -      -     0.47   0.53    -      -      -      -     cmp	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jae	.LBB8_3
+ -      -     0.54   0.44    -     0.02    -      -     test	al, 3
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_2
+ -      -     0.44   0.56    -      -      -      -     lea	rdi, [rdx + 2*rdx]
+ -      -     0.48   0.52    -      -      -      -     or	rdi, 3
+ -      -     0.48   0.48    -     0.04    -      -     add	rdi, 9
+ -      -     0.51   0.39    -     0.10    -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_3
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -     0.53   0.47    -      -      -      -     sub	rsp, 24
+ -      -      -      -     1.00    -     0.52   0.48   mov	qword ptr [rsp], rsi
+ -      -      -      -     1.00    -     0.48   0.52   mov	qword ptr [rsp + 8], rax
+ -      -      -      -     1.00    -     0.52   0.48   mov	qword ptr [rsp + 16], rcx
+ -      -     0.49   0.51    -      -      -      -     lea	rdi, [rip + .Lanon.HASH.7]
+ -      -     0.46   0.54    -      -      -      -     lea	rcx, [rip + .Lanon.HASH.1]
+ -      -     0.54   0.46    -      -      -      -     lea	r8, [rip + .Lanon.HASH.9]
+ -      -     0.04   0.06    -     0.90    -      -     mov	rdx, rsp
+ -      -     0.44   0.46    -     0.10    -      -     mov	esi, 58
+ -      -      -      -     1.00   1.00   0.94   1.06   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_deref_dynamic_size.rs b/rust/zerocopy/benches/ref_type_deref_dynamic_size.rs
new file mode 100644
index 000000000000..adcf89c22508
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_dynamic_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_deref_dynamic_size<'a>(
+    source: &'a Ref<&[u8], format::LocoPacket>,
+) -> &'a format::LocoPacket {
+    core::ops::Deref::deref(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64
new file mode 100644
index 000000000000..60ca3b508a7e
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_deref_dynamic_size:
+	mov rdx, qword ptr [rdi + 16]
+	mov rax, qword ptr [rdi]
+	mov rcx, qword ptr [rdi + 8]
+	mov esi, 1
+	movabs rdi, 4611686018427387902
+	cmp rdx, rdi
+	jae .LBB8_3
+	test al, 1
+	jne .LBB8_2
+	lea rdi, [2*rdx + 4]
+	cmp rcx, rdi
+	jne .LBB8_3
+	ret
+.LBB8_2:
+	xor esi, esi
+.LBB8_3:
+	sub rsp, 24
+	mov qword ptr [rsp], rsi
+	mov qword ptr [rsp + 8], rax
+	mov qword ptr [rsp + 16], rcx
+	lea rdi, [rip + .Lanon.HASH.7]
+	lea rcx, [rip + .Lanon.HASH.1]
+	lea r8, [rip + .Lanon.HASH.9]
+	mov rdx, rsp
+	mov esi, 58
+	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..66a8f8575acd
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      1647
+Total uOps:        2700
+
+Dispatch Width:    4
+uOps Per Cycle:    1.64
+IPC:               1.46
+Block RThroughput: 6.8
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 16]
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rcx, qword ptr [rdi + 8]
+ 1      1     0.33                        mov	esi, 1
+ 1      1     0.33                        movabs	rdi, 4611686018427387902
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     1.00                        jae	.LBB8_3
+ 1      1     0.33                        test	al, 1
+ 1      1     1.00                        jne	.LBB8_2
+ 1      1     0.50                        lea	rdi, [2*rdx + 4]
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        jne	.LBB8_3
+ 1      1     1.00                  U     ret
+ 1      0     0.25                        xor	esi, esi
+ 1      1     0.33                        sub	rsp, 24
+ 1      1     1.00           *            mov	qword ptr [rsp], rsi
+ 1      1     1.00           *            mov	qword ptr [rsp + 8], rax
+ 1      1     1.00           *            mov	qword ptr [rsp + 16], rcx
+ 1      1     0.50                        lea	rdi, [rip + .Lanon.HASH.7]
+ 1      1     0.50                        lea	rcx, [rip + .Lanon.HASH.1]
+ 1      1     0.50                        lea	r8, [rip + .Lanon.HASH.9]
+ 1      1     0.33                        mov	rdx, rsp
+ 1      1     0.33                        mov	esi, 58
+ 4      7     1.00    *                   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     5.15   5.74   4.00   6.11   3.98   4.02   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.71   0.29   mov	rdx, qword ptr [rdi + 16]
+ -      -      -      -      -      -     0.72   0.28   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.29   0.71   mov	rcx, qword ptr [rdi + 8]
+ -      -     0.83   0.16    -     0.01    -      -     mov	esi, 1
+ -      -     0.16   0.84    -      -      -      -     movabs	rdi, 4611686018427387902
+ -      -     0.80   0.04    -     0.16    -      -     cmp	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jae	.LBB8_3
+ -      -     0.13   0.74    -     0.13    -      -     test	al, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_2
+ -      -     0.10   0.90    -      -      -      -     lea	rdi, [2*rdx + 4]
+ -      -     0.09   0.91    -      -      -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_3
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -     0.29   0.13    -     0.58    -      -     sub	rsp, 24
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp], rsi
+ -      -      -      -     1.00    -     0.28   0.72   mov	qword ptr [rsp + 8], rax
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp + 16], rcx
+ -      -     0.76   0.24    -      -      -      -     lea	rdi, [rip + .Lanon.HASH.7]
+ -      -     0.82   0.18    -      -      -      -     lea	rcx, [rip + .Lanon.HASH.1]
+ -      -     0.92   0.08    -      -      -      -     lea	r8, [rip + .Lanon.HASH.9]
+ -      -     0.09   0.68    -     0.23    -      -     mov	rdx, rsp
+ -      -     0.16   0.84    -      -      -      -     mov	esi, 58
+ -      -      -      -     1.00   1.00   0.54   1.46   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.rs b/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.rs
new file mode 100644
index 000000000000..263f2c575379
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_deref_mut_dynamic_size<'a>(
+    source: &'a mut Ref<&mut [u8], format::LocoPacket>,
+) -> &'a mut format::LocoPacket {
+    core::ops::DerefMut::deref_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64
new file mode 100644
index 000000000000..5ae0ae69efad
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_deref_mut_dynamic_size:
+	mov rdx, qword ptr [rdi + 16]
+	mov rax, qword ptr [rdi]
+	mov rcx, qword ptr [rdi + 8]
+	mov esi, 1
+	movabs rdi, 4611686018427387902
+	cmp rdx, rdi
+	jae .LBB8_3
+	test al, 1
+	jne .LBB8_2
+	lea rdi, [2*rdx + 4]
+	cmp rcx, rdi
+	jne .LBB8_3
+	ret
+.LBB8_2:
+	xor esi, esi
+.LBB8_3:
+	sub rsp, 24
+	mov qword ptr [rsp], rsi
+	mov qword ptr [rsp + 8], rax
+	mov qword ptr [rsp + 16], rcx
+	lea rdi, [rip + .Lanon.HASH.7]
+	lea rcx, [rip + .Lanon.HASH.1]
+	lea r8, [rip + .Lanon.HASH.9]
+	mov rdx, rsp
+	mov esi, 65
+	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..ed3a2bc24701
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      1647
+Total uOps:        2700
+
+Dispatch Width:    4
+uOps Per Cycle:    1.64
+IPC:               1.46
+Block RThroughput: 6.8
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 16]
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rcx, qword ptr [rdi + 8]
+ 1      1     0.33                        mov	esi, 1
+ 1      1     0.33                        movabs	rdi, 4611686018427387902
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     1.00                        jae	.LBB8_3
+ 1      1     0.33                        test	al, 1
+ 1      1     1.00                        jne	.LBB8_2
+ 1      1     0.50                        lea	rdi, [2*rdx + 4]
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        jne	.LBB8_3
+ 1      1     1.00                  U     ret
+ 1      0     0.25                        xor	esi, esi
+ 1      1     0.33                        sub	rsp, 24
+ 1      1     1.00           *            mov	qword ptr [rsp], rsi
+ 1      1     1.00           *            mov	qword ptr [rsp + 8], rax
+ 1      1     1.00           *            mov	qword ptr [rsp + 16], rcx
+ 1      1     0.50                        lea	rdi, [rip + .Lanon.HASH.7]
+ 1      1     0.50                        lea	rcx, [rip + .Lanon.HASH.1]
+ 1      1     0.50                        lea	r8, [rip + .Lanon.HASH.9]
+ 1      1     0.33                        mov	rdx, rsp
+ 1      1     0.33                        mov	esi, 65
+ 4      7     1.00    *                   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     5.15   5.74   4.00   6.11   3.98   4.02   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.71   0.29   mov	rdx, qword ptr [rdi + 16]
+ -      -      -      -      -      -     0.72   0.28   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.29   0.71   mov	rcx, qword ptr [rdi + 8]
+ -      -     0.83   0.16    -     0.01    -      -     mov	esi, 1
+ -      -     0.16   0.84    -      -      -      -     movabs	rdi, 4611686018427387902
+ -      -     0.80   0.04    -     0.16    -      -     cmp	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jae	.LBB8_3
+ -      -     0.13   0.74    -     0.13    -      -     test	al, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_2
+ -      -     0.10   0.90    -      -      -      -     lea	rdi, [2*rdx + 4]
+ -      -     0.09   0.91    -      -      -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_3
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -     0.29   0.13    -     0.58    -      -     sub	rsp, 24
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp], rsi
+ -      -      -      -     1.00    -     0.28   0.72   mov	qword ptr [rsp + 8], rax
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp + 16], rcx
+ -      -     0.76   0.24    -      -      -      -     lea	rdi, [rip + .Lanon.HASH.7]
+ -      -     0.82   0.18    -      -      -      -     lea	rcx, [rip + .Lanon.HASH.1]
+ -      -     0.92   0.08    -      -      -      -     lea	r8, [rip + .Lanon.HASH.9]
+ -      -     0.09   0.68    -     0.23    -      -     mov	rdx, rsp
+ -      -     0.16   0.84    -      -      -      -     mov	esi, 65
+ -      -      -      -     1.00   1.00   0.54   1.46   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_deref_mut_static_size.rs b/rust/zerocopy/benches/ref_type_deref_mut_static_size.rs
new file mode 100644
index 000000000000..4f85a031c845
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_mut_static_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_deref_mut_static_size<'a>(
+    source: &'a mut Ref<&mut [u8], format::LocoPacket>,
+) -> &'a mut format::LocoPacket {
+    core::ops::DerefMut::deref_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64 b/rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64
new file mode 100644
index 000000000000..259c39646bb3
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64
@@ -0,0 +1,3 @@
+bench_ref_type_deref_mut_static_size:
+	mov rax, qword ptr [rdi]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64.mca
new file mode 100644
index 000000000000..2de0e6f9791c
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64.mca
@@ -0,0 +1,43 @@
+Iterations:        100
+Instructions:      200
+Total Cycles:      103
+Total uOps:        200
+
+Dispatch Width:    4
+uOps Per Cycle:    1.94
+IPC:               1.94
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   0.50   0.50   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_deref_static_size.rs b/rust/zerocopy/benches/ref_type_deref_static_size.rs
new file mode 100644
index 000000000000..60397dc28580
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_static_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_deref_static_size<'a>(
+    source: &'a Ref<&[u8], format::LocoPacket>,
+) -> &'a format::LocoPacket {
+    core::ops::Deref::deref(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_deref_static_size.x86-64 b/rust/zerocopy/benches/ref_type_deref_static_size.x86-64
new file mode 100644
index 000000000000..2d4368dd61df
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_static_size.x86-64
@@ -0,0 +1,3 @@
+bench_ref_type_deref_static_size:
+	mov rax, qword ptr [rdi]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_deref_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_deref_static_size.x86-64.mca
new file mode 100644
index 000000000000..2de0e6f9791c
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_deref_static_size.x86-64.mca
@@ -0,0 +1,43 @@
+Iterations:        100
+Instructions:      200
+Total Cycles:      103
+Total uOps:        200
+
+Dispatch Width:    4
+uOps Per Cycle:    1.94
+IPC:               1.94
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   0.50   0.50   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.rs
new file mode 100644
index 000000000000..d11cae87a1df
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_bytes_dynamic_padding(
+    source: &[u8],
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    Ref::from_bytes(source).ok()
+}
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64
new file mode 100644
index 000000000000..9f2beef51011
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64
@@ -0,0 +1,25 @@
+bench_ref_type_from_bytes_dynamic_padding:
+	cmp rdx, 12
+	setae al
+	mov ecx, edx
+	or ecx, esi
+	test cl, 3
+	sete cl
+	and cl, al
+	cmp cl, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rdi], rsi
+	mov rax, rdi
+	ret
+.LBB5_2:
+	lea rax, [rdx - 9]
+	movabs rcx, -6148914691236517205
+	mov r8, rdx
+	mul rcx
+	shr rdx
+	mov qword ptr [rdi + 8], r8
+	mov qword ptr [rdi + 16], rdx
+	mov qword ptr [rdi], rsi
+	mov rax, rdi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..e239f2fbe9e7
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64.mca
@@ -0,0 +1,85 @@
+Iterations:        100
+Instructions:      2300
+Total Cycles:      909
+Total uOps:        2400
+
+Dispatch Width:    4
+uOps Per Cycle:    2.64
+IPC:               2.53
+Block RThroughput: 6.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        cmp	rdx, 12
+ 1      1     0.50                        setae	al
+ 1      1     0.33                        mov	ecx, edx
+ 1      1     0.33                        or	ecx, esi
+ 1      1     0.33                        test	cl, 3
+ 1      1     0.50                        sete	cl
+ 1      1     0.33                        and	cl, al
+ 1      1     0.33                        cmp	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rdi], rsi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+ 1      1     0.50                        lea	rax, [rdx - 9]
+ 1      1     0.33                        movabs	rcx, -6148914691236517205
+ 1      1     0.33                        mov	r8, rdx
+ 2      4     1.00                        mul	rcx
+ 1      1     0.50                        shr	rdx
+ 1      1     1.00           *            mov	qword ptr [rdi + 8], r8
+ 1      1     1.00           *            mov	qword ptr [rdi + 16], rdx
+ 1      1     1.00           *            mov	qword ptr [rdi], rsi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.49   5.99   4.00   6.52   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -     0.99    -     0.01    -      -     cmp	rdx, 12
+ -      -     0.53    -      -     0.47    -      -     setae	al
+ -      -     0.52   0.01    -     0.47    -      -     mov	ecx, edx
+ -      -      -     0.99    -     0.01    -      -     or	ecx, esi
+ -      -      -     0.51    -     0.49    -      -     test	cl, 3
+ -      -     0.52    -      -     0.48    -      -     sete	cl
+ -      -     0.47   0.48    -     0.05    -      -     and	cl, al
+ -      -     0.48   0.48    -     0.04    -      -     cmp	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rdi], rsi
+ -      -     0.03   0.48    -     0.49    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.97   0.03    -      -      -      -     lea	rax, [rdx - 9]
+ -      -     0.49   0.51    -      -      -      -     movabs	rcx, -6148914691236517205
+ -      -     0.47   0.01    -     0.52    -      -     mov	r8, rdx
+ -      -     1.00   1.00    -      -      -      -     mul	rcx
+ -      -     1.00    -      -      -      -      -     shr	rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rdi + 8], r8
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rdi + 16], rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rdi], rsi
+ -      -     0.01   0.50    -     0.49    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.rs b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.rs
new file mode 100644
index 000000000000..cf0b278eaf09
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.rs
@@ -0,0 +1,17 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_bytes_dynamic_size(source: &[u8]) -> Option<Ref<&[u8], format::LocoPacket>> {
+    Ref::from_bytes(source).ok()
+}
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64
new file mode 100644
index 000000000000..c50dfc333bd6
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64
@@ -0,0 +1,21 @@
+bench_ref_type_from_bytes_dynamic_size:
+	mov rax, rdi
+	cmp rdx, 4
+	setae cl
+	mov edi, edx
+	or edi, esi
+	test dil, 1
+	sete dil
+	and dil, cl
+	cmp dil, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rax], rsi
+	ret
+.LBB5_2:
+	lea rcx, [rdx - 4]
+	shr rcx
+	mov qword ptr [rax + 8], rdx
+	mov qword ptr [rax + 16], rcx
+	mov qword ptr [rax], rsi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..92d98788cc09
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64.mca
@@ -0,0 +1,77 @@
+Iterations:        100
+Instructions:      1900
+Total Cycles:      482
+Total uOps:        1900
+
+Dispatch Width:    4
+uOps Per Cycle:    3.94
+IPC:               3.94
+Block RThroughput: 4.8
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        cmp	rdx, 4
+ 1      1     0.50                        setae	cl
+ 1      1     0.33                        mov	edi, edx
+ 1      1     0.33                        or	edi, esi
+ 1      1     0.33                        test	dil, 1
+ 1      1     0.50                        sete	dil
+ 1      1     0.33                        and	dil, cl
+ 1      1     0.33                        cmp	dil, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+ 1      1     0.50                        lea	rcx, [rdx - 4]
+ 1      1     0.50                        shr	rcx
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdx
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     4.66   4.66   4.00   4.68   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.40   0.43    -     0.17    -      -     mov	rax, rdi
+ -      -     0.13   0.83    -     0.04    -      -     cmp	rdx, 4
+ -      -     0.67    -      -     0.33    -      -     setae	cl
+ -      -     0.05   0.79    -     0.16    -      -     mov	edi, edx
+ -      -     0.36   0.52    -     0.12    -      -     or	edi, esi
+ -      -     0.39   0.52    -     0.09    -      -     test	dil, 1
+ -      -     0.98    -      -     0.02    -      -     sete	dil
+ -      -     0.42   0.49    -     0.09    -      -     and	dil, cl
+ -      -     0.43   0.41    -     0.16    -      -     cmp	dil, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.33   0.67    -      -      -      -     lea	rcx, [rdx - 4]
+ -      -     0.50    -      -     0.50    -      -     shr	rcx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], rdx
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], rcx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_static_size.rs b/rust/zerocopy/benches/ref_type_from_bytes_static_size.rs
new file mode 100644
index 000000000000..6a2ced8aad89
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_static_size.rs
@@ -0,0 +1,17 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_bytes_static_size(source: &[u8]) -> Option<Ref<&[u8], format::LocoPacket>> {
+    Ref::from_bytes(source).ok()
+}
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64 b/rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64
new file mode 100644
index 000000000000..59c3862eb569
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64
@@ -0,0 +1,15 @@
+bench_ref_type_from_bytes_static_size:
+	mov rax, rdi
+	cmp rdx, 6
+	setne cl
+	or cl, sil
+	test cl, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rax], rsi
+	ret
+.LBB5_2:
+	mov qword ptr [rax + 8], 6
+	mov qword ptr [rax + 16], 0
+	mov qword ptr [rax], rsi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64.mca
new file mode 100644
index 000000000000..286354a1a014
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64.mca
@@ -0,0 +1,65 @@
+Iterations:        100
+Instructions:      1300
+Total Cycles:      404
+Total uOps:        1300
+
+Dispatch Width:    4
+uOps Per Cycle:    3.22
+IPC:               3.22
+Block RThroughput: 4.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        cmp	rdx, 6
+ 1      1     0.50                        setne	cl
+ 1      1     0.33                        or	cl, sil
+ 1      1     0.33                        test	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax + 8], 6
+ 1      1     1.00           *            mov	qword ptr [rax + 16], 0
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     2.55   2.34   4.00   3.11   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.81   0.18    -     0.01    -      -     mov	rax, rdi
+ -      -     0.56   0.43    -     0.01    -      -     cmp	rdx, 6
+ -      -     1.00    -      -      -      -      -     setne	cl
+ -      -      -     0.99    -     0.01    -      -     or	cl, sil
+ -      -     0.18   0.74    -     0.08    -      -     test	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], 6
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], 0
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.rs
new file mode 100644
index 000000000000..5d3ee937c2b3
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.rs
@@ -0,0 +1,20 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_bytes_with_elems_dynamic_padding(
+    source: &[u8],
+    count: usize,
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    Ref::from_bytes_with_elems(source, count).ok()
+}
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64
new file mode 100644
index 000000000000..0eb8287a145e
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64
@@ -0,0 +1,26 @@
+bench_ref_type_from_bytes_with_elems_dynamic_padding:
+	mov rax, rdi
+	movabs rdi, 6148914691236517201
+	cmp rcx, rdi
+	ja .LBB5_3
+	lea rdi, [rcx + 2*rcx]
+	or rdi, 3
+	add rdi, 9
+	cmp rdx, rdi
+	sete dil
+	movabs r8, 3074457345618258599
+	cmp rcx, r8
+	setb r8b
+	and r8b, dil
+	cmp r8b, 1
+	jne .LBB5_3
+	test sil, 3
+	je .LBB5_4
+.LBB5_3:
+	mov qword ptr [rax], 0
+	ret
+.LBB5_4:
+	mov qword ptr [rax], rsi
+	mov qword ptr [rax + 8], rdx
+	mov qword ptr [rax + 16], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..19928fdca6b8
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64.mca
@@ -0,0 +1,85 @@
+Iterations:        100
+Instructions:      2300
+Total Cycles:      640
+Total uOps:        2300
+
+Dispatch Width:    4
+uOps Per Cycle:    3.59
+IPC:               3.59
+Block RThroughput: 5.8
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        movabs	rdi, 6148914691236517201
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        ja	.LBB5_3
+ 1      1     0.50                        lea	rdi, [rcx + 2*rcx]
+ 1      1     0.33                        or	rdi, 3
+ 1      1     0.33                        add	rdi, 9
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     0.50                        sete	dil
+ 1      1     0.33                        movabs	r8, 3074457345618258599
+ 1      1     0.33                        cmp	rcx, r8
+ 1      1     0.50                        setb	r8b
+ 1      1     0.33                        and	r8b, dil
+ 1      1     0.33                        cmp	r8b, 1
+ 1      1     1.00                        jne	.LBB5_3
+ 1      1     0.33                        test	sil, 3
+ 1      1     1.00                        je	.LBB5_4
+ 1      1     1.00           *            mov	qword ptr [rax], 0
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdx
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.32   6.33   4.00   6.35   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.99    -      -     0.01    -      -     mov	rax, rdi
+ -      -     0.66   0.34    -      -      -      -     movabs	rdi, 6148914691236517201
+ -      -     0.34   0.66    -      -      -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -     0.66   0.34    -      -      -      -     lea	rdi, [rcx + 2*rcx]
+ -      -     0.01   0.99    -      -      -      -     or	rdi, 3
+ -      -     0.01   0.99    -      -      -      -     add	rdi, 9
+ -      -     0.01   0.99    -      -      -      -     cmp	rdx, rdi
+ -      -     0.99    -      -     0.01    -      -     sete	dil
+ -      -     0.35   0.01    -     0.64    -      -     movabs	r8, 3074457345618258599
+ -      -     0.99    -      -     0.01    -      -     cmp	rcx, r8
+ -      -     0.99    -      -     0.01    -      -     setb	r8b
+ -      -      -     1.00    -      -      -      -     and	r8b, dil
+ -      -      -     1.00    -      -      -      -     cmp	r8b, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -     0.32   0.01    -     0.67    -      -     test	sil, 3
+ -      -      -      -      -     1.00    -      -     je	.LBB5_4
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], 0
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.rs b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.rs
new file mode 100644
index 000000000000..0ea631ab0c48
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.rs
@@ -0,0 +1,20 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_bytes_with_elems_dynamic_size(
+    source: &[u8],
+    count: usize,
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    Ref::from_bytes_with_elems(source, count).ok()
+}
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64
new file mode 100644
index 000000000000..67cc5b58dd14
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64
@@ -0,0 +1,28 @@
+bench_ref_type_from_bytes_with_elems_dynamic_size:
+	mov rax, rdi
+	lea rdi, [rcx + rcx]
+	test rcx, rcx
+	setns r8b
+	cmp rdi, -5
+	setb dil
+	and dil, r8b
+	lea r8, [2*rcx + 4]
+	cmp rdx, r8
+	sete r8b
+	movabs r9, 4611686018427387902
+	cmp rcx, r9
+	setb r9b
+	and r9b, r8b
+	and r9b, dil
+	cmp r9b, 1
+	je .LBB5_1
+.LBB5_2:
+	mov qword ptr [rax], 0
+	ret
+.LBB5_1:
+	test sil, 1
+	jne .LBB5_2
+	mov qword ptr [rax], rsi
+	mov qword ptr [rax + 8], rdx
+	mov qword ptr [rax + 16], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..cc99f6a4c6f3
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64.mca
@@ -0,0 +1,89 @@
+Iterations:        100
+Instructions:      2500
+Total Cycles:      706
+Total uOps:        2500
+
+Dispatch Width:    4
+uOps Per Cycle:    3.54
+IPC:               3.54
+Block RThroughput: 6.3
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	rdi, [rcx + rcx]
+ 1      1     0.33                        test	rcx, rcx
+ 1      1     0.50                        setns	r8b
+ 1      1     0.33                        cmp	rdi, -5
+ 1      1     0.50                        setb	dil
+ 1      1     0.33                        and	dil, r8b
+ 1      1     0.50                        lea	r8, [2*rcx + 4]
+ 1      1     0.33                        cmp	rdx, r8
+ 1      1     0.50                        sete	r8b
+ 1      1     0.33                        movabs	r9, 4611686018427387902
+ 1      1     0.33                        cmp	rcx, r9
+ 1      1     0.50                        setb	r9b
+ 1      1     0.33                        and	r9b, r8b
+ 1      1     0.33                        and	r9b, dil
+ 1      1     0.33                        cmp	r9b, 1
+ 1      1     1.00                        je	.LBB5_1
+ 1      1     1.00           *            mov	qword ptr [rax], 0
+ 1      1     1.00                  U     ret
+ 1      1     0.33                        test	sil, 1
+ 1      1     1.00                        jne	.LBB5_2
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdx
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.99   7.00   4.00   7.01   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.08    -      -     0.92    -      -     mov	rax, rdi
+ -      -     0.99   0.01    -      -      -      -     lea	rdi, [rcx + rcx]
+ -      -     0.92   0.01    -     0.07    -      -     test	rcx, rcx
+ -      -     0.99    -      -     0.01    -      -     setns	r8b
+ -      -     0.01   0.01    -     0.98    -      -     cmp	rdi, -5
+ -      -     0.98    -      -     0.02    -      -     setb	dil
+ -      -      -     0.99    -     0.01    -      -     and	dil, r8b
+ -      -     0.01   0.99    -      -      -      -     lea	r8, [2*rcx + 4]
+ -      -     0.99   0.01    -      -      -      -     cmp	rdx, r8
+ -      -     1.00    -      -      -      -      -     sete	r8b
+ -      -     0.01    -      -     0.99    -      -     movabs	r9, 4611686018427387902
+ -      -      -     1.00    -      -      -      -     cmp	rcx, r9
+ -      -     0.99    -      -     0.01    -      -     setb	r9b
+ -      -     0.01   0.99    -      -      -      -     and	r9b, r8b
+ -      -     0.01   0.99    -      -      -      -     and	r9b, dil
+ -      -      -     1.00    -      -      -      -     cmp	r9b, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_1
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], 0
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -     1.00    -      -      -      -     test	sil, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_2
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.rs
new file mode 100644
index 000000000000..7826991fc546
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.rs
@@ -0,0 +1,22 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_prefix_dynamic_padding(
+    source: &[u8],
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_prefix(source) {
+        Ok((packet, _rest)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64
new file mode 100644
index 000000000000..a549e3337985
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64
@@ -0,0 +1,26 @@
+bench_ref_type_from_prefix_dynamic_padding:
+	test sil, 3
+	sete al
+	cmp rdx, 12
+	setae cl
+	and cl, al
+	cmp cl, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rdi], rsi
+	mov rax, rdi
+	ret
+.LBB5_2:
+	movabs rcx, 9223372036854775804
+	and rcx, rdx
+	or rdx, 3
+	add rdx, -12
+	movabs r8, -6148914691236517205
+	mov rax, rdx
+	mul r8
+	shr rdx
+	mov qword ptr [rdi + 8], rcx
+	mov qword ptr [rdi + 16], rdx
+	mov qword ptr [rdi], rsi
+	mov rax, rdi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..d85fe71ca66f
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      907
+Total uOps:        2500
+
+Dispatch Width:    4
+uOps Per Cycle:    2.76
+IPC:               2.65
+Block RThroughput: 6.3
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        test	sil, 3
+ 1      1     0.50                        sete	al
+ 1      1     0.33                        cmp	rdx, 12
+ 1      1     0.50                        setae	cl
+ 1      1     0.33                        and	cl, al
+ 1      1     0.33                        cmp	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rdi], rsi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+ 1      1     0.33                        movabs	rcx, 9223372036854775804
+ 1      1     0.33                        and	rcx, rdx
+ 1      1     0.33                        or	rdx, 3
+ 1      1     0.33                        add	rdx, -12
+ 1      1     0.33                        movabs	r8, -6148914691236517205
+ 1      1     0.33                        mov	rax, rdx
+ 2      4     1.00                        mul	r8
+ 1      1     0.50                        shr	rdx
+ 1      1     1.00           *            mov	qword ptr [rdi + 8], rcx
+ 1      1     1.00           *            mov	qword ptr [rdi + 16], rdx
+ 1      1     1.00           *            mov	qword ptr [rdi], rsi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.96   6.07   4.00   6.97   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.92   0.07    -     0.01    -      -     test	sil, 3
+ -      -     0.98    -      -     0.02    -      -     sete	al
+ -      -     0.03   0.97    -      -      -      -     cmp	rdx, 12
+ -      -     0.99    -      -     0.01    -      -     setae	cl
+ -      -     0.03   0.94    -     0.03    -      -     and	cl, al
+ -      -     0.06   0.94    -      -      -      -     cmp	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rdi], rsi
+ -      -     0.01   0.05    -     0.94    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.92   0.08    -      -      -      -     movabs	rcx, 9223372036854775804
+ -      -     0.96   0.01    -     0.03    -      -     and	rcx, rdx
+ -      -      -     0.03    -     0.97    -      -     or	rdx, 3
+ -      -     0.01   0.96    -     0.03    -      -     add	rdx, -12
+ -      -     0.03   0.06    -     0.91    -      -     movabs	r8, -6148914691236517205
+ -      -     0.94   0.03    -     0.03    -      -     mov	rax, rdx
+ -      -     1.00   1.00    -      -      -      -     mul	r8
+ -      -     0.05    -      -     0.95    -      -     shr	rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rdi + 8], rcx
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rdi + 16], rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rdi], rsi
+ -      -     0.03   0.93    -     0.04    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.rs b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.rs
new file mode 100644
index 000000000000..131a12103656
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.rs
@@ -0,0 +1,22 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_prefix_dynamic_size(
+    source: &[u8],
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_prefix(source) {
+        Ok((packet, _rest)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64
new file mode 100644
index 000000000000..fc050aac2637
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64
@@ -0,0 +1,19 @@
+bench_ref_type_from_prefix_dynamic_size:
+	mov rax, rdi
+	cmp rdx, 4
+	setb cl
+	or cl, sil
+	test cl, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rax], rsi
+	ret
+.LBB5_2:
+	movabs rcx, 9223372036854775806
+	and rcx, rdx
+	add rdx, -4
+	shr rdx
+	mov qword ptr [rax + 8], rcx
+	mov qword ptr [rax + 16], rdx
+	mov qword ptr [rax], rsi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..a249f0305291
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64.mca
@@ -0,0 +1,73 @@
+Iterations:        100
+Instructions:      1700
+Total Cycles:      431
+Total uOps:        1700
+
+Dispatch Width:    4
+uOps Per Cycle:    3.94
+IPC:               3.94
+Block RThroughput: 4.3
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        cmp	rdx, 4
+ 1      1     0.50                        setb	cl
+ 1      1     0.33                        or	cl, sil
+ 1      1     0.33                        test	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+ 1      1     0.33                        movabs	rcx, 9223372036854775806
+ 1      1     0.33                        and	rcx, rdx
+ 1      1     0.33                        add	rdx, -4
+ 1      1     0.50                        shr	rdx
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rcx
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rdx
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     3.99   3.75   4.00   4.26   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -     0.99    -     0.01    -      -     mov	rax, rdi
+ -      -     0.74   0.26    -      -      -      -     cmp	rdx, 4
+ -      -     1.00    -      -      -      -      -     setb	cl
+ -      -     0.25   0.74    -     0.01    -      -     or	cl, sil
+ -      -     0.01   0.97    -     0.02    -      -     test	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.48   0.52    -      -      -      -     movabs	rcx, 9223372036854775806
+ -      -     0.73   0.27    -      -      -      -     and	rcx, rdx
+ -      -     0.02    -      -     0.98    -      -     add	rdx, -4
+ -      -     0.76    -      -     0.24    -      -     shr	rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], rcx
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_static_size.rs b/rust/zerocopy/benches/ref_type_from_prefix_static_size.rs
new file mode 100644
index 000000000000..c149fd5088ee
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_static_size.rs
@@ -0,0 +1,20 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_prefix_static_size(source: &[u8]) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_prefix(source) {
+        Ok((packet, _rest)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64 b/rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64
new file mode 100644
index 000000000000..420fd6f3b4bd
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64
@@ -0,0 +1,15 @@
+bench_ref_type_from_prefix_static_size:
+	mov rax, rdi
+	cmp rdx, 6
+	setb cl
+	or cl, sil
+	test cl, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rax], rsi
+	ret
+.LBB5_2:
+	mov qword ptr [rax + 8], 6
+	mov qword ptr [rax + 16], 0
+	mov qword ptr [rax], rsi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64.mca
new file mode 100644
index 000000000000..6b65f303a786
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64.mca
@@ -0,0 +1,65 @@
+Iterations:        100
+Instructions:      1300
+Total Cycles:      404
+Total uOps:        1300
+
+Dispatch Width:    4
+uOps Per Cycle:    3.22
+IPC:               3.22
+Block RThroughput: 4.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        cmp	rdx, 6
+ 1      1     0.50                        setb	cl
+ 1      1     0.33                        or	cl, sil
+ 1      1     0.33                        test	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax + 8], 6
+ 1      1     1.00           *            mov	qword ptr [rax + 16], 0
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     2.55   2.34   4.00   3.11   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.81   0.18    -     0.01    -      -     mov	rax, rdi
+ -      -     0.56   0.43    -     0.01    -      -     cmp	rdx, 6
+ -      -     1.00    -      -      -      -      -     setb	cl
+ -      -      -     0.99    -     0.01    -      -     or	cl, sil
+ -      -     0.18   0.74    -     0.08    -      -     test	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], 6
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], 0
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.rs
new file mode 100644
index 000000000000..a4fe5a6c86ca
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.rs
@@ -0,0 +1,23 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_prefix_with_elems_dynamic_padding(
+    source: &[u8],
+    count: usize,
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_prefix_with_elems(source, count) {
+        Ok((packet, _rest)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64
new file mode 100644
index 000000000000..fb9d6bfaac27
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64
@@ -0,0 +1,26 @@
+bench_ref_type_from_prefix_with_elems_dynamic_padding:
+	mov rax, rdi
+	movabs rdi, 6148914691236517201
+	cmp rcx, rdi
+	ja .LBB5_4
+	lea rdi, [rcx + 2*rcx]
+	or rdi, 3
+	add rdi, 9
+	cmp rdi, rdx
+	setbe dl
+	movabs r8, 3074457345618258599
+	cmp rcx, r8
+	setb r8b
+	and r8b, dl
+	cmp r8b, 1
+	jne .LBB5_4
+	test sil, 3
+	je .LBB5_3
+.LBB5_4:
+	mov qword ptr [rax], 0
+	ret
+.LBB5_3:
+	mov qword ptr [rax], rsi
+	mov qword ptr [rax + 8], rdi
+	mov qword ptr [rax + 16], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..0ef4c84142b0
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64.mca
@@ -0,0 +1,85 @@
+Iterations:        100
+Instructions:      2300
+Total Cycles:      674
+Total uOps:        2400
+
+Dispatch Width:    4
+uOps Per Cycle:    3.56
+IPC:               3.41
+Block RThroughput: 6.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        movabs	rdi, 6148914691236517201
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        ja	.LBB5_4
+ 1      1     0.50                        lea	rdi, [rcx + 2*rcx]
+ 1      1     0.33                        or	rdi, 3
+ 1      1     0.33                        add	rdi, 9
+ 1      1     0.33                        cmp	rdi, rdx
+ 2      2     1.00                        setbe	dl
+ 1      1     0.33                        movabs	r8, 3074457345618258599
+ 1      1     0.33                        cmp	rcx, r8
+ 1      1     0.50                        setb	r8b
+ 1      1     0.33                        and	r8b, dl
+ 1      1     0.33                        cmp	r8b, 1
+ 1      1     1.00                        jne	.LBB5_4
+ 1      1     0.33                        test	sil, 3
+ 1      1     1.00                        je	.LBB5_3
+ 1      1     1.00           *            mov	qword ptr [rax], 0
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdi
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.66   6.65   4.00   6.69   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.01   0.98    -     0.01    -      -     mov	rax, rdi
+ -      -     0.01   0.99    -      -      -      -     movabs	rdi, 6148914691236517201
+ -      -     0.02   0.98    -      -      -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_4
+ -      -     0.02   0.98    -      -      -      -     lea	rdi, [rcx + 2*rcx]
+ -      -     0.68   0.32    -      -      -      -     or	rdi, 3
+ -      -     0.98   0.02    -      -      -      -     add	rdi, 9
+ -      -     0.97   0.03    -      -      -      -     cmp	rdi, rdx
+ -      -     1.96    -      -     0.04    -      -     setbe	dl
+ -      -     0.02   0.98    -      -      -      -     movabs	r8, 3074457345618258599
+ -      -     0.02   0.34    -     0.64    -      -     cmp	rcx, r8
+ -      -     0.02    -      -     0.98    -      -     setb	r8b
+ -      -     0.97   0.02    -     0.01    -      -     and	r8b, dl
+ -      -     0.97   0.02    -     0.01    -      -     cmp	r8b, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_4
+ -      -     0.01   0.99    -      -      -      -     test	sil, 3
+ -      -      -      -      -     1.00    -      -     je	.LBB5_3
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], 0
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rdi
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.rs b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.rs
new file mode 100644
index 000000000000..b0911e8fd8e7
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.rs
@@ -0,0 +1,23 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_prefix_with_elems_dynamic_size(
+    source: &[u8],
+    count: usize,
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_prefix_with_elems(source, count) {
+        Ok((packet, _rest)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64
new file mode 100644
index 000000000000..20ba73bd552e
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_from_prefix_with_elems_dynamic_size:
+	mov rax, rdi
+	lea rdi, [rcx + rcx]
+	test rcx, rcx
+	sets r8b
+	cmp rdi, -5
+	setae r9b
+	or r9b, r8b
+	jne .LBB5_3
+	add rdi, 4
+	cmp rdi, rdx
+	ja .LBB5_3
+	movabs rdx, 4611686018427387902
+	cmp rcx, rdx
+	setb dl
+	test sil, 1
+	sete r8b
+	test dl, r8b
+	jne .LBB5_4
+.LBB5_3:
+	mov qword ptr [rax], 0
+	ret
+.LBB5_4:
+	mov qword ptr [rax], rsi
+	mov qword ptr [rax + 8], rdi
+	mov qword ptr [rax + 16], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..5600d4ea6f69
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      672
+Total uOps:        2400
+
+Dispatch Width:    4
+uOps Per Cycle:    3.57
+IPC:               3.57
+Block RThroughput: 6.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	rdi, [rcx + rcx]
+ 1      1     0.33                        test	rcx, rcx
+ 1      1     0.50                        sets	r8b
+ 1      1     0.33                        cmp	rdi, -5
+ 1      1     0.50                        setae	r9b
+ 1      1     0.33                        or	r9b, r8b
+ 1      1     1.00                        jne	.LBB5_3
+ 1      1     0.33                        add	rdi, 4
+ 1      1     0.33                        cmp	rdi, rdx
+ 1      1     1.00                        ja	.LBB5_3
+ 1      1     0.33                        movabs	rdx, 4611686018427387902
+ 1      1     0.33                        cmp	rcx, rdx
+ 1      1     0.50                        setb	dl
+ 1      1     0.33                        test	sil, 1
+ 1      1     0.50                        sete	r8b
+ 1      1     0.33                        test	dl, r8b
+ 1      1     1.00                        jne	.LBB5_4
+ 1      1     1.00           *            mov	qword ptr [rax], 0
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdi
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.66   6.65   4.00   6.69   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.03   0.96    -     0.01    -      -     mov	rax, rdi
+ -      -     0.64   0.36    -      -      -      -     lea	rdi, [rcx + rcx]
+ -      -     0.34   0.66    -      -      -      -     test	rcx, rcx
+ -      -     0.99    -      -     0.01    -      -     sets	r8b
+ -      -     0.66   0.34    -      -      -      -     cmp	rdi, -5
+ -      -     0.67    -      -     0.33    -      -     setae	r9b
+ -      -     0.01   0.99    -      -      -      -     or	r9b, r8b
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -      -     0.99    -     0.01    -      -     add	rdi, 4
+ -      -     0.66   0.33    -     0.01    -      -     cmp	rdi, rdx
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -      -     0.01    -     0.99    -      -     movabs	rdx, 4611686018427387902
+ -      -     0.33   0.34    -     0.33    -      -     cmp	rcx, rdx
+ -      -     1.00    -      -      -      -      -     setb	dl
+ -      -     0.33   0.67    -      -      -      -     test	sil, 1
+ -      -     1.00    -      -      -      -      -     sete	r8b
+ -      -      -     1.00    -      -      -      -     test	dl, r8b
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_4
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], 0
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rdi
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.rs
new file mode 100644
index 000000000000..894b7d875b42
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.rs
@@ -0,0 +1,22 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_suffix_dynamic_padding(
+    source: &[u8],
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_suffix(source) {
+        Ok((_rest, packet)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64
new file mode 100644
index 000000000000..4a0f5e88612e
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64
@@ -0,0 +1,31 @@
+bench_ref_type_from_suffix_dynamic_padding:
+	lea eax, [rdx + rsi]
+	test al, 3
+	sete al
+	cmp rdx, 12
+	setae cl
+	and cl, al
+	cmp cl, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rdi], rsi
+	mov rax, rdi
+	ret
+.LBB5_2:
+	mov rax, rdx
+	or rax, 3
+	add rax, -12
+	movabs rcx, -6148914691236517205
+	mov r8, rdx
+	mul rcx
+	shr rdx
+	mov eax, r8d
+	and eax, 3
+	movabs rcx, 9223372036854775804
+	and rcx, r8
+	add rsi, rax
+	mov qword ptr [rdi + 8], rcx
+	mov qword ptr [rdi + 16], rdx
+	mov qword ptr [rdi], rsi
+	mov rax, rdi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..ad884432de74
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64.mca
@@ -0,0 +1,97 @@
+Iterations:        100
+Instructions:      2900
+Total Cycles:      942
+Total uOps:        3000
+
+Dispatch Width:    4
+uOps Per Cycle:    3.18
+IPC:               3.08
+Block RThroughput: 7.5
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.50                        lea	eax, [rdx + rsi]
+ 1      1     0.33                        test	al, 3
+ 1      1     0.50                        sete	al
+ 1      1     0.33                        cmp	rdx, 12
+ 1      1     0.50                        setae	cl
+ 1      1     0.33                        and	cl, al
+ 1      1     0.33                        cmp	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rdi], rsi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+ 1      1     0.33                        mov	rax, rdx
+ 1      1     0.33                        or	rax, 3
+ 1      1     0.33                        add	rax, -12
+ 1      1     0.33                        movabs	rcx, -6148914691236517205
+ 1      1     0.33                        mov	r8, rdx
+ 2      4     1.00                        mul	rcx
+ 1      1     0.50                        shr	rdx
+ 1      1     0.33                        mov	eax, r8d
+ 1      1     0.33                        and	eax, 3
+ 1      1     0.33                        movabs	rcx, 9223372036854775804
+ 1      1     0.33                        and	rcx, r8
+ 1      1     0.33                        add	rsi, rax
+ 1      1     1.00           *            mov	qword ptr [rdi + 8], rcx
+ 1      1     1.00           *            mov	qword ptr [rdi + 16], rdx
+ 1      1     1.00           *            mov	qword ptr [rdi], rsi
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     8.34   8.01   4.00   8.65   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.36   0.64    -      -      -      -     lea	eax, [rdx + rsi]
+ -      -     0.32   0.36    -     0.32    -      -     test	al, 3
+ -      -     0.69    -      -     0.31    -      -     sete	al
+ -      -     0.32   0.04    -     0.64    -      -     cmp	rdx, 12
+ -      -     0.68    -      -     0.32    -      -     setae	cl
+ -      -     0.31   0.37    -     0.32    -      -     and	cl, al
+ -      -     0.31   0.37    -     0.32    -      -     cmp	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rdi], rsi
+ -      -     0.33   0.36    -     0.31    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.32   0.32    -     0.36    -      -     mov	rax, rdx
+ -      -     0.01   0.63    -     0.36    -      -     or	rax, 3
+ -      -      -     0.68    -     0.32    -      -     add	rax, -12
+ -      -     0.34   0.63    -     0.03    -      -     movabs	rcx, -6148914691236517205
+ -      -     0.32   0.32    -     0.36    -      -     mov	r8, rdx
+ -      -     1.00   1.00    -      -      -      -     mul	rcx
+ -      -     0.69    -      -     0.31    -      -     shr	rdx
+ -      -     0.37   0.32    -     0.31    -      -     mov	eax, r8d
+ -      -     0.35   0.33    -     0.32    -      -     and	eax, 3
+ -      -     0.63   0.35    -     0.02    -      -     movabs	rcx, 9223372036854775804
+ -      -     0.32   0.32    -     0.36    -      -     and	rcx, r8
+ -      -     0.33   0.35    -     0.32    -      -     add	rsi, rax
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rdi + 8], rcx
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rdi + 16], rdx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rdi], rsi
+ -      -     0.34   0.62    -     0.04    -      -     mov	rax, rdi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.rs b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.rs
new file mode 100644
index 000000000000..2cdadc3316d6
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.rs
@@ -0,0 +1,22 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_suffix_dynamic_size(
+    source: &[u8],
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_suffix(source) {
+        Ok((_rest, packet)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64
new file mode 100644
index 000000000000..9dc329867dde
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64
@@ -0,0 +1,23 @@
+bench_ref_type_from_suffix_dynamic_size:
+	mov rax, rdi
+	lea ecx, [rdx + rsi]
+	cmp rdx, 4
+	setb dil
+	or dil, cl
+	test dil, 1
+	je .LBB5_2
+	xor esi, esi
+	mov qword ptr [rax], rsi
+	ret
+.LBB5_2:
+	lea rcx, [rdx - 4]
+	shr rcx
+	mov edi, edx
+	and edi, 1
+	movabs r8, 9223372036854775806
+	and r8, rdx
+	add rsi, rdi
+	mov qword ptr [rax + 8], r8
+	mov qword ptr [rax + 16], rcx
+	mov qword ptr [rax], rsi
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..7639f237aa87
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64.mca
@@ -0,0 +1,81 @@
+Iterations:        100
+Instructions:      2100
+Total Cycles:      540
+Total uOps:        2100
+
+Dispatch Width:    4
+uOps Per Cycle:    3.89
+IPC:               3.89
+Block RThroughput: 5.3
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	ecx, [rdx + rsi]
+ 1      1     0.33                        cmp	rdx, 4
+ 1      1     0.50                        setb	dil
+ 1      1     0.33                        or	dil, cl
+ 1      1     0.33                        test	dil, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	esi, esi
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+ 1      1     0.50                        lea	rcx, [rdx - 4]
+ 1      1     0.50                        shr	rcx
+ 1      1     0.33                        mov	edi, edx
+ 1      1     0.33                        and	edi, 1
+ 1      1     0.33                        movabs	r8, 9223372036854775806
+ 1      1     0.33                        and	r8, rdx
+ 1      1     0.33                        add	rsi, rdi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], r8
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     5.32   5.33   4.00   5.35   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.33   0.66    -     0.01    -      -     mov	rax, rdi
+ -      -     0.99   0.01    -      -      -      -     lea	ecx, [rdx + rsi]
+ -      -     0.01   0.98    -     0.01    -      -     cmp	rdx, 4
+ -      -     0.99    -      -     0.01    -      -     setb	dil
+ -      -      -     1.00    -      -      -      -     or	dil, cl
+ -      -      -     1.00    -      -      -      -     test	dil, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.65   0.35    -      -      -      -     lea	rcx, [rdx - 4]
+ -      -     0.68    -      -     0.32    -      -     shr	rcx
+ -      -      -     0.64    -     0.36    -      -     mov	edi, edx
+ -      -     0.66   0.01    -     0.33    -      -     and	edi, 1
+ -      -     0.34    -      -     0.66    -      -     movabs	r8, 9223372036854775806
+ -      -     0.32   0.68    -      -      -      -     and	r8, rdx
+ -      -     0.35    -      -     0.65    -      -     add	rsi, rdi
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], r8
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], rcx
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_static_size.rs b/rust/zerocopy/benches/ref_type_from_suffix_static_size.rs
new file mode 100644
index 000000000000..2ad2d2f5ee33
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_static_size.rs
@@ -0,0 +1,20 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_suffix_static_size(source: &[u8]) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_suffix(source) {
+        Ok((_rest, packet)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64 b/rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64
new file mode 100644
index 000000000000..37a3d72e7ca1
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64
@@ -0,0 +1,18 @@
+bench_ref_type_from_suffix_static_size:
+	mov rax, rdi
+	lea ecx, [rdx + rsi]
+	cmp rdx, 6
+	setb dil
+	or dil, cl
+	test dil, 1
+	je .LBB5_2
+	xor ecx, ecx
+	mov qword ptr [rax], rcx
+	ret
+.LBB5_2:
+	lea rcx, [rsi + rdx]
+	add rcx, -6
+	mov qword ptr [rax + 8], 6
+	mov qword ptr [rax + 16], 0
+	mov qword ptr [rax], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64.mca
new file mode 100644
index 000000000000..4dfa9bda8ceb
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64.mca
@@ -0,0 +1,71 @@
+Iterations:        100
+Instructions:      1600
+Total Cycles:      405
+Total uOps:        1600
+
+Dispatch Width:    4
+uOps Per Cycle:    3.95
+IPC:               3.95
+Block RThroughput: 4.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	ecx, [rdx + rsi]
+ 1      1     0.33                        cmp	rdx, 6
+ 1      1     0.50                        setb	dil
+ 1      1     0.33                        or	dil, cl
+ 1      1     0.33                        test	dil, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	ecx, ecx
+ 1      1     1.00           *            mov	qword ptr [rax], rcx
+ 1      1     1.00                  U     ret
+ 1      1     0.50                        lea	rcx, [rsi + rdx]
+ 1      1     0.33                        add	rcx, -6
+ 1      1     1.00           *            mov	qword ptr [rax + 8], 6
+ 1      1     1.00           *            mov	qword ptr [rax + 16], 0
+ 1      1     1.00           *            mov	qword ptr [rax], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     3.66   3.66   4.00   3.68   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.66   0.33    -     0.01    -      -     mov	rax, rdi
+ -      -     0.33   0.67    -      -      -      -     lea	ecx, [rdx + rsi]
+ -      -     0.34   0.33    -     0.33    -      -     cmp	rdx, 6
+ -      -     0.99    -      -     0.01    -      -     setb	dil
+ -      -     0.33   0.67    -      -      -      -     or	dil, cl
+ -      -      -     1.00    -      -      -      -     test	dil, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	ecx, ecx
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], rcx
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.34   0.66    -      -      -      -     lea	rcx, [rsi + rdx]
+ -      -     0.67    -      -     0.33    -      -     add	rcx, -6
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], 6
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], 0
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.rs
new file mode 100644
index 000000000000..105086dd4dc9
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.rs
@@ -0,0 +1,23 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_suffix_with_elems_dynamic_padding(
+    source: &[u8],
+    count: usize,
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_suffix_with_elems(source, count) {
+        Ok((_rest, packet)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64
new file mode 100644
index 000000000000..a52ec2c34dd9
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_from_suffix_with_elems_dynamic_padding:
+	mov rax, rdi
+	movabs rdi, 6148914691236517201
+	cmp rcx, rdi
+	ja .LBB5_3
+	lea rdi, [rcx + 2*rcx]
+	or rdi, 3
+	add rdi, 9
+	sub rdx, rdi
+	setae r8b
+	movabs r9, 3074457345618258599
+	cmp rcx, r9
+	setb r9b
+	and r9b, r8b
+	cmp r9b, 1
+	jne .LBB5_3
+	add rsi, rdx
+	test sil, 3
+	je .LBB5_4
+.LBB5_3:
+	mov qword ptr [rax], 0
+	ret
+.LBB5_4:
+	mov qword ptr [rax], rsi
+	mov qword ptr [rax + 8], rdi
+	mov qword ptr [rax + 16], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..b8036059b98a
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      673
+Total uOps:        2400
+
+Dispatch Width:    4
+uOps Per Cycle:    3.57
+IPC:               3.57
+Block RThroughput: 6.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.33                        movabs	rdi, 6148914691236517201
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        ja	.LBB5_3
+ 1      1     0.50                        lea	rdi, [rcx + 2*rcx]
+ 1      1     0.33                        or	rdi, 3
+ 1      1     0.33                        add	rdi, 9
+ 1      1     0.33                        sub	rdx, rdi
+ 1      1     0.50                        setae	r8b
+ 1      1     0.33                        movabs	r9, 3074457345618258599
+ 1      1     0.33                        cmp	rcx, r9
+ 1      1     0.50                        setb	r9b
+ 1      1     0.33                        and	r9b, r8b
+ 1      1     0.33                        cmp	r9b, 1
+ 1      1     1.00                        jne	.LBB5_3
+ 1      1     0.33                        add	rsi, rdx
+ 1      1     0.33                        test	sil, 3
+ 1      1     1.00                        je	.LBB5_4
+ 1      1     1.00           *            mov	qword ptr [rax], 0
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdi
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.66   6.66   4.00   6.68   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.33   0.01    -     0.66    -      -     mov	rax, rdi
+ -      -     0.34   0.02    -     0.64    -      -     movabs	rdi, 6148914691236517201
+ -      -     0.34   0.34    -     0.32    -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -     0.66   0.34    -      -      -      -     lea	rdi, [rcx + 2*rcx]
+ -      -     0.02   0.97    -     0.01    -      -     or	rdi, 3
+ -      -     0.02   0.98    -      -      -      -     add	rdi, 9
+ -      -     0.01   0.99    -      -      -      -     sub	rdx, rdi
+ -      -     1.00    -      -      -      -      -     setae	r8b
+ -      -     0.97   0.02    -     0.01    -      -     movabs	r9, 3074457345618258599
+ -      -     0.98   0.01    -     0.01    -      -     cmp	rcx, r9
+ -      -     0.98    -      -     0.02    -      -     setb	r9b
+ -      -     0.01   0.98    -     0.01    -      -     and	r9b, r8b
+ -      -     0.02   0.98    -      -      -      -     cmp	r9b, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -      -     1.00    -      -      -      -     add	rsi, rdx
+ -      -     0.98   0.02    -      -      -      -     test	sil, 3
+ -      -      -      -      -     1.00    -      -     je	.LBB5_4
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], 0
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rdi
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.rs b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.rs
new file mode 100644
index 000000000000..926f3044b4bf
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.rs
@@ -0,0 +1,23 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_from_suffix_with_elems_dynamic_size(
+    source: &[u8],
+    count: usize,
+) -> Option<Ref<&[u8], format::LocoPacket>> {
+    match Ref::from_suffix_with_elems(source, count) {
+        Ok((_rest, packet)) => Some(packet),
+        _ => None,
+    }
+}
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64
new file mode 100644
index 000000000000..a6c84ec32242
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_from_suffix_with_elems_dynamic_size:
+	mov rax, rdi
+	lea rdi, [rcx + rcx]
+	test rcx, rcx
+	sets r8b
+	cmp rdi, -5
+	setae r9b
+	or r9b, r8b
+	jne .LBB5_4
+	add rdi, 4
+	sub rdx, rdi
+	jb .LBB5_4
+	movabs r8, 4611686018427387901
+	cmp rcx, r8
+	ja .LBB5_4
+	add rsi, rdx
+	mov edx, esi
+	and edx, 1
+	je .LBB5_5
+.LBB5_4:
+	mov qword ptr [rax], 0
+	ret
+.LBB5_5:
+	mov qword ptr [rax], rsi
+	mov qword ptr [rax + 8], rdi
+	mov qword ptr [rax + 16], rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..113b75b4172d
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      673
+Total uOps:        2400
+
+Dispatch Width:    4
+uOps Per Cycle:    3.57
+IPC:               3.57
+Block RThroughput: 6.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        mov	rax, rdi
+ 1      1     0.50                        lea	rdi, [rcx + rcx]
+ 1      1     0.33                        test	rcx, rcx
+ 1      1     0.50                        sets	r8b
+ 1      1     0.33                        cmp	rdi, -5
+ 1      1     0.50                        setae	r9b
+ 1      1     0.33                        or	r9b, r8b
+ 1      1     1.00                        jne	.LBB5_4
+ 1      1     0.33                        add	rdi, 4
+ 1      1     0.33                        sub	rdx, rdi
+ 1      1     1.00                        jb	.LBB5_4
+ 1      1     0.33                        movabs	r8, 4611686018427387901
+ 1      1     0.33                        cmp	rcx, r8
+ 1      1     1.00                        ja	.LBB5_4
+ 1      1     0.33                        add	rsi, rdx
+ 1      1     0.33                        mov	edx, esi
+ 1      1     0.33                        and	edx, 1
+ 1      1     1.00                        je	.LBB5_5
+ 1      1     1.00           *            mov	qword ptr [rax], 0
+ 1      1     1.00                  U     ret
+ 1      1     1.00           *            mov	qword ptr [rax], rsi
+ 1      1     1.00           *            mov	qword ptr [rax + 8], rdi
+ 1      1     1.00           *            mov	qword ptr [rax + 16], rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.65   6.65   4.00   6.70   2.00   2.00   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -     0.99    -     0.01    -      -     mov	rax, rdi
+ -      -     0.01   0.99    -      -      -      -     lea	rdi, [rcx + rcx]
+ -      -     0.67   0.33    -      -      -      -     test	rcx, rcx
+ -      -     0.99    -      -     0.01    -      -     sets	r8b
+ -      -      -     1.00    -      -      -      -     cmp	rdi, -5
+ -      -     1.00    -      -      -      -      -     setae	r9b
+ -      -     1.00    -      -      -      -      -     or	r9b, r8b
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_4
+ -      -      -     0.99    -     0.01    -      -     add	rdi, 4
+ -      -      -     0.33    -     0.67    -      -     sub	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jb	.LBB5_4
+ -      -      -     1.00    -      -      -      -     movabs	r8, 4611686018427387901
+ -      -     0.66   0.34    -      -      -      -     cmp	rcx, r8
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_4
+ -      -     0.34   0.66    -      -      -      -     add	rsi, rdx
+ -      -     0.98   0.02    -      -      -      -     mov	edx, esi
+ -      -     1.00    -      -      -      -      -     and	edx, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_5
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax], 0
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax], rsi
+ -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 8], rdi
+ -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 16], rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.rs b/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.rs
new file mode 100644
index 000000000000..04ac859a98a8
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_into_mut_dynamic_size(
+    source: Ref<&mut [u8], format::LocoPacket>,
+) -> &mut format::LocoPacket {
+    Ref::into_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64
new file mode 100644
index 000000000000..b7568f6631ce
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_into_mut_dynamic_size:
+	mov rdx, qword ptr [rdi + 16]
+	mov rax, qword ptr [rdi]
+	mov rcx, qword ptr [rdi + 8]
+	mov esi, 1
+	movabs rdi, 4611686018427387902
+	cmp rdx, rdi
+	jae .LBB8_3
+	test al, 1
+	jne .LBB8_2
+	lea rdi, [2*rdx + 4]
+	cmp rcx, rdi
+	jne .LBB8_3
+	ret
+.LBB8_2:
+	xor esi, esi
+.LBB8_3:
+	sub rsp, 24
+	mov qword ptr [rsp], rsi
+	mov qword ptr [rsp + 8], rax
+	mov qword ptr [rsp + 16], rcx
+	lea rdi, [rip + .Lanon.HASH.2]
+	lea rcx, [rip + .Lanon.HASH.1]
+	lea r8, [rip + .Lanon.HASH.4]
+	mov rdx, rsp
+	mov esi, 54
+	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..03137756a8b5
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      1647
+Total uOps:        2700
+
+Dispatch Width:    4
+uOps Per Cycle:    1.64
+IPC:               1.46
+Block RThroughput: 6.8
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 16]
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rcx, qword ptr [rdi + 8]
+ 1      1     0.33                        mov	esi, 1
+ 1      1     0.33                        movabs	rdi, 4611686018427387902
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     1.00                        jae	.LBB8_3
+ 1      1     0.33                        test	al, 1
+ 1      1     1.00                        jne	.LBB8_2
+ 1      1     0.50                        lea	rdi, [2*rdx + 4]
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        jne	.LBB8_3
+ 1      1     1.00                  U     ret
+ 1      0     0.25                        xor	esi, esi
+ 1      1     0.33                        sub	rsp, 24
+ 1      1     1.00           *            mov	qword ptr [rsp], rsi
+ 1      1     1.00           *            mov	qword ptr [rsp + 8], rax
+ 1      1     1.00           *            mov	qword ptr [rsp + 16], rcx
+ 1      1     0.50                        lea	rdi, [rip + .Lanon.HASH.2]
+ 1      1     0.50                        lea	rcx, [rip + .Lanon.HASH.1]
+ 1      1     0.50                        lea	r8, [rip + .Lanon.HASH.4]
+ 1      1     0.33                        mov	rdx, rsp
+ 1      1     0.33                        mov	esi, 54
+ 4      7     1.00    *                   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     5.15   5.74   4.00   6.11   3.98   4.02   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.71   0.29   mov	rdx, qword ptr [rdi + 16]
+ -      -      -      -      -      -     0.72   0.28   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.29   0.71   mov	rcx, qword ptr [rdi + 8]
+ -      -     0.83   0.16    -     0.01    -      -     mov	esi, 1
+ -      -     0.16   0.84    -      -      -      -     movabs	rdi, 4611686018427387902
+ -      -     0.80   0.04    -     0.16    -      -     cmp	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jae	.LBB8_3
+ -      -     0.13   0.74    -     0.13    -      -     test	al, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_2
+ -      -     0.10   0.90    -      -      -      -     lea	rdi, [2*rdx + 4]
+ -      -     0.09   0.91    -      -      -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_3
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -     0.29   0.13    -     0.58    -      -     sub	rsp, 24
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp], rsi
+ -      -      -      -     1.00    -     0.28   0.72   mov	qword ptr [rsp + 8], rax
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp + 16], rcx
+ -      -     0.76   0.24    -      -      -      -     lea	rdi, [rip + .Lanon.HASH.2]
+ -      -     0.82   0.18    -      -      -      -     lea	rcx, [rip + .Lanon.HASH.1]
+ -      -     0.92   0.08    -      -      -      -     lea	r8, [rip + .Lanon.HASH.4]
+ -      -     0.09   0.68    -     0.23    -      -     mov	rdx, rsp
+ -      -     0.16   0.84    -      -      -      -     mov	esi, 54
+ -      -      -      -     1.00   1.00   0.54   1.46   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_into_mut_static_size.rs b/rust/zerocopy/benches/ref_type_into_mut_static_size.rs
new file mode 100644
index 000000000000..edab9abe0aa8
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_mut_static_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_into_mut_static_size(
+    source: Ref<&mut [u8], format::LocoPacket>,
+) -> &mut format::LocoPacket {
+    Ref::into_mut(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64 b/rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64
new file mode 100644
index 000000000000..0412b33d6cc3
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64
@@ -0,0 +1,3 @@
+bench_ref_type_into_mut_static_size:
+	mov rax, qword ptr [rdi]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64.mca
new file mode 100644
index 000000000000..2de0e6f9791c
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64.mca
@@ -0,0 +1,43 @@
+Iterations:        100
+Instructions:      200
+Total Cycles:      103
+Total uOps:        200
+
+Dispatch Width:    4
+uOps Per Cycle:    1.94
+IPC:               1.94
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   0.50   0.50   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.rs b/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.rs
new file mode 100644
index 000000000000..9f5f3b618c2f
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_padding.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_into_ref_dynamic_padding(
+    source: Ref<&[u8], format::LocoPacket>,
+) -> &format::LocoPacket {
+    Ref::into_ref(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64 b/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64
new file mode 100644
index 000000000000..ca16dbc03e8e
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64
@@ -0,0 +1,29 @@
+bench_ref_type_into_ref_dynamic_padding:
+	mov rdx, qword ptr [rdi + 16]
+	mov rax, qword ptr [rdi]
+	mov rcx, qword ptr [rdi + 8]
+	mov esi, 1
+	movabs rdi, 3074457345618258599
+	cmp rdx, rdi
+	jae .LBB8_3
+	test al, 3
+	jne .LBB8_2
+	lea rdi, [rdx + 2*rdx]
+	or rdi, 3
+	add rdi, 9
+	cmp rcx, rdi
+	jne .LBB8_3
+	ret
+.LBB8_2:
+	xor esi, esi
+.LBB8_3:
+	sub rsp, 24
+	mov qword ptr [rsp], rsi
+	mov qword ptr [rsp + 8], rax
+	mov qword ptr [rsp + 16], rcx
+	lea rdi, [rip + .Lanon.HASH.2]
+	lea rcx, [rip + .Lanon.HASH.1]
+	lea r8, [rip + .Lanon.HASH.4]
+	mov rdx, rsp
+	mov esi, 54
+	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64.mca
new file mode 100644
index 000000000000..bf8eade92561
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64.mca
@@ -0,0 +1,91 @@
+Iterations:        100
+Instructions:      2600
+Total Cycles:      1812
+Total uOps:        2900
+
+Dispatch Width:    4
+uOps Per Cycle:    1.60
+IPC:               1.43
+Block RThroughput: 7.3
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 16]
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rcx, qword ptr [rdi + 8]
+ 1      1     0.33                        mov	esi, 1
+ 1      1     0.33                        movabs	rdi, 3074457345618258599
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     1.00                        jae	.LBB8_3
+ 1      1     0.33                        test	al, 3
+ 1      1     1.00                        jne	.LBB8_2
+ 1      1     0.50                        lea	rdi, [rdx + 2*rdx]
+ 1      1     0.33                        or	rdi, 3
+ 1      1     0.33                        add	rdi, 9
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        jne	.LBB8_3
+ 1      1     1.00                  U     ret
+ 1      0     0.25                        xor	esi, esi
+ 1      1     0.33                        sub	rsp, 24
+ 1      1     1.00           *            mov	qword ptr [rsp], rsi
+ 1      1     1.00           *            mov	qword ptr [rsp + 8], rax
+ 1      1     1.00           *            mov	qword ptr [rsp + 16], rcx
+ 1      1     0.50                        lea	rdi, [rip + .Lanon.HASH.2]
+ 1      1     0.50                        lea	rcx, [rip + .Lanon.HASH.1]
+ 1      1     0.50                        lea	r8, [rip + .Lanon.HASH.4]
+ 1      1     0.33                        mov	rdx, rsp
+ 1      1     0.33                        mov	esi, 54
+ 4      7     1.00    *                   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     6.41   6.42   4.00   6.17   3.99   4.01   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.54   0.46   mov	rdx, qword ptr [rdi + 16]
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.49   0.51   mov	rcx, qword ptr [rdi + 8]
+ -      -     0.52   0.47    -     0.01    -      -     mov	esi, 1
+ -      -     0.47   0.53    -      -      -      -     movabs	rdi, 3074457345618258599
+ -      -     0.47   0.53    -      -      -      -     cmp	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jae	.LBB8_3
+ -      -     0.54   0.44    -     0.02    -      -     test	al, 3
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_2
+ -      -     0.44   0.56    -      -      -      -     lea	rdi, [rdx + 2*rdx]
+ -      -     0.48   0.52    -      -      -      -     or	rdi, 3
+ -      -     0.48   0.48    -     0.04    -      -     add	rdi, 9
+ -      -     0.51   0.39    -     0.10    -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_3
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -     0.53   0.47    -      -      -      -     sub	rsp, 24
+ -      -      -      -     1.00    -     0.52   0.48   mov	qword ptr [rsp], rsi
+ -      -      -      -     1.00    -     0.48   0.52   mov	qword ptr [rsp + 8], rax
+ -      -      -      -     1.00    -     0.52   0.48   mov	qword ptr [rsp + 16], rcx
+ -      -     0.49   0.51    -      -      -      -     lea	rdi, [rip + .Lanon.HASH.2]
+ -      -     0.46   0.54    -      -      -      -     lea	rcx, [rip + .Lanon.HASH.1]
+ -      -     0.54   0.46    -      -      -      -     lea	r8, [rip + .Lanon.HASH.4]
+ -      -     0.04   0.06    -     0.90    -      -     mov	rdx, rsp
+ -      -     0.44   0.46    -     0.10    -      -     mov	esi, 54
+ -      -      -      -     1.00   1.00   0.94   1.06   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.rs b/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.rs
new file mode 100644
index 000000000000..535c67985200
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_dynamic_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_into_ref_dynamic_size(
+    source: Ref<&[u8], format::LocoPacket>,
+) -> &format::LocoPacket {
+    Ref::into_ref(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64 b/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64
new file mode 100644
index 000000000000..81624de69046
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64
@@ -0,0 +1,27 @@
+bench_ref_type_into_ref_dynamic_size:
+	mov rdx, qword ptr [rdi + 16]
+	mov rax, qword ptr [rdi]
+	mov rcx, qword ptr [rdi + 8]
+	mov esi, 1
+	movabs rdi, 4611686018427387902
+	cmp rdx, rdi
+	jae .LBB8_3
+	test al, 1
+	jne .LBB8_2
+	lea rdi, [2*rdx + 4]
+	cmp rcx, rdi
+	jne .LBB8_3
+	ret
+.LBB8_2:
+	xor esi, esi
+.LBB8_3:
+	sub rsp, 24
+	mov qword ptr [rsp], rsi
+	mov qword ptr [rsp + 8], rax
+	mov qword ptr [rsp + 16], rcx
+	lea rdi, [rip + .Lanon.HASH.2]
+	lea rcx, [rip + .Lanon.HASH.1]
+	lea r8, [rip + .Lanon.HASH.4]
+	mov rdx, rsp
+	mov esi, 54
+	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64.mca b/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64.mca
new file mode 100644
index 000000000000..03137756a8b5
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64.mca
@@ -0,0 +1,87 @@
+Iterations:        100
+Instructions:      2400
+Total Cycles:      1647
+Total uOps:        2700
+
+Dispatch Width:    4
+uOps Per Cycle:    1.64
+IPC:               1.46
+Block RThroughput: 6.8
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rdx, qword ptr [rdi + 16]
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	rcx, qword ptr [rdi + 8]
+ 1      1     0.33                        mov	esi, 1
+ 1      1     0.33                        movabs	rdi, 4611686018427387902
+ 1      1     0.33                        cmp	rdx, rdi
+ 1      1     1.00                        jae	.LBB8_3
+ 1      1     0.33                        test	al, 1
+ 1      1     1.00                        jne	.LBB8_2
+ 1      1     0.50                        lea	rdi, [2*rdx + 4]
+ 1      1     0.33                        cmp	rcx, rdi
+ 1      1     1.00                        jne	.LBB8_3
+ 1      1     1.00                  U     ret
+ 1      0     0.25                        xor	esi, esi
+ 1      1     0.33                        sub	rsp, 24
+ 1      1     1.00           *            mov	qword ptr [rsp], rsi
+ 1      1     1.00           *            mov	qword ptr [rsp + 8], rax
+ 1      1     1.00           *            mov	qword ptr [rsp + 16], rcx
+ 1      1     0.50                        lea	rdi, [rip + .Lanon.HASH.2]
+ 1      1     0.50                        lea	rcx, [rip + .Lanon.HASH.1]
+ 1      1     0.50                        lea	r8, [rip + .Lanon.HASH.4]
+ 1      1     0.33                        mov	rdx, rsp
+ 1      1     0.33                        mov	esi, 54
+ 4      7     1.00    *                   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     5.15   5.74   4.00   6.11   3.98   4.02   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.71   0.29   mov	rdx, qword ptr [rdi + 16]
+ -      -      -      -      -      -     0.72   0.28   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.29   0.71   mov	rcx, qword ptr [rdi + 8]
+ -      -     0.83   0.16    -     0.01    -      -     mov	esi, 1
+ -      -     0.16   0.84    -      -      -      -     movabs	rdi, 4611686018427387902
+ -      -     0.80   0.04    -     0.16    -      -     cmp	rdx, rdi
+ -      -      -      -      -     1.00    -      -     jae	.LBB8_3
+ -      -     0.13   0.74    -     0.13    -      -     test	al, 1
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_2
+ -      -     0.10   0.90    -      -      -      -     lea	rdi, [2*rdx + 4]
+ -      -     0.09   0.91    -      -      -      -     cmp	rcx, rdi
+ -      -      -      -      -     1.00    -      -     jne	.LBB8_3
+ -      -      -      -      -     1.00    -      -     ret
+ -      -      -      -      -      -      -      -     xor	esi, esi
+ -      -     0.29   0.13    -     0.58    -      -     sub	rsp, 24
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp], rsi
+ -      -      -      -     1.00    -     0.28   0.72   mov	qword ptr [rsp + 8], rax
+ -      -      -      -     1.00    -     0.72   0.28   mov	qword ptr [rsp + 16], rcx
+ -      -     0.76   0.24    -      -      -      -     lea	rdi, [rip + .Lanon.HASH.2]
+ -      -     0.82   0.18    -      -      -      -     lea	rcx, [rip + .Lanon.HASH.1]
+ -      -     0.92   0.08    -      -      -      -     lea	r8, [rip + .Lanon.HASH.4]
+ -      -     0.09   0.68    -     0.23    -      -     mov	rdx, rsp
+ -      -     0.16   0.84    -      -      -      -     mov	esi, 54
+ -      -      -      -     1.00   1.00   0.54   1.46   call	qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
diff --git a/rust/zerocopy/benches/ref_type_into_ref_static_size.rs b/rust/zerocopy/benches/ref_type_into_ref_static_size.rs
new file mode 100644
index 000000000000..a2bdf559a903
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_static_size.rs
@@ -0,0 +1,19 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_into_ref_static_size(
+    source: Ref<&[u8], format::LocoPacket>,
+) -> &format::LocoPacket {
+    Ref::into_ref(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64 b/rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64
new file mode 100644
index 000000000000..173562c46561
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64
@@ -0,0 +1,3 @@
+bench_ref_type_into_ref_static_size:
+	mov rax, qword ptr [rdi]
+	ret
diff --git a/rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64.mca
new file mode 100644
index 000000000000..2de0e6f9791c
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64.mca
@@ -0,0 +1,43 @@
+Iterations:        100
+Instructions:      200
+Total Cycles:      103
+Total uOps:        200
+
+Dispatch Width:    4
+uOps Per Cycle:    1.94
+IPC:               1.94
+Block RThroughput: 1.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -      -      -      -     1.00   0.50   0.50   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_read_static_size.rs b/rust/zerocopy/benches/ref_type_read_static_size.rs
new file mode 100644
index 000000000000..da7111261b80
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_read_static_size.rs
@@ -0,0 +1,17 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_read_static_size(source: &Ref<&[u8], format::LocoPacket>) -> format::LocoPacket {
+    Ref::read(source)
+}
diff --git a/rust/zerocopy/benches/ref_type_read_static_size.x86-64 b/rust/zerocopy/benches/ref_type_read_static_size.x86-64
new file mode 100644
index 000000000000..c5ebb527f419
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_read_static_size.x86-64
@@ -0,0 +1,7 @@
+bench_ref_type_read_static_size:
+	mov rax, qword ptr [rdi]
+	mov ecx, dword ptr [rax]
+	movzx eax, word ptr [rax + 4]
+	shl rax, 32
+	or rax, rcx
+	ret
diff --git a/rust/zerocopy/benches/ref_type_read_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_read_static_size.x86-64.mca
new file mode 100644
index 000000000000..37cfa368ce16
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_read_static_size.x86-64.mca
@@ -0,0 +1,51 @@
+Iterations:        100
+Instructions:      600
+Total Cycles:      169
+Total uOps:        600
+
+Dispatch Width:    4
+uOps Per Cycle:    3.55
+IPC:               3.55
+Block RThroughput: 1.5
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      5     0.50    *                   mov	ecx, dword ptr [rax]
+ 1      5     0.50    *                   movzx	eax, word ptr [rax + 4]
+ 1      1     0.50                        shl	rax, 32
+ 1      1     0.33                        or	rax, rcx
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     0.91   0.90    -     1.19   1.50   1.50   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -      -      -     0.31   0.69   mov	ecx, dword ptr [rax]
+ -      -      -      -      -      -     0.69   0.31   movzx	eax, word ptr [rax + 4]
+ -      -     0.91    -      -     0.09    -      -     shl	rax, 32
+ -      -      -     0.90    -     0.10    -      -     or	rax, rcx
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/ref_type_write_static_size.rs b/rust/zerocopy/benches/ref_type_write_static_size.rs
new file mode 100644
index 000000000000..6537cc4609e9
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_write_static_size.rs
@@ -0,0 +1,20 @@
+// Copyright 2026 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use zerocopy::Ref;
+
+#[path = "formats/coco_static_size.rs"]
+mod format;
+
+#[unsafe(no_mangle)]
+fn bench_ref_type_write_static_size(
+    destination: &mut Ref<&mut [u8], format::LocoPacket>,
+    value: format::LocoPacket,
+) {
+    Ref::write(destination, value)
+}
diff --git a/rust/zerocopy/benches/ref_type_write_static_size.x86-64 b/rust/zerocopy/benches/ref_type_write_static_size.x86-64
new file mode 100644
index 000000000000..1b919d01409a
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_write_static_size.x86-64
@@ -0,0 +1,6 @@
+bench_ref_type_write_static_size:
+	mov rax, qword ptr [rdi]
+	mov dword ptr [rax], esi
+	shr rsi, 32
+	mov word ptr [rax + 4], si
+	ret
diff --git a/rust/zerocopy/benches/ref_type_write_static_size.x86-64.mca b/rust/zerocopy/benches/ref_type_write_static_size.x86-64.mca
new file mode 100644
index 000000000000..a7089d3b1336
--- /dev/null
+++ b/rust/zerocopy/benches/ref_type_write_static_size.x86-64.mca
@@ -0,0 +1,49 @@
+Iterations:        100
+Instructions:      500
+Total Cycles:      208
+Total uOps:        500
+
+Dispatch Width:    4
+uOps Per Cycle:    2.40
+IPC:               2.40
+Block RThroughput: 2.0
+
+
+Instruction Info:
+[1]: #uOps
+[2]: Latency
+[3]: RThroughput
+[4]: MayLoad
+[5]: MayStore
+[6]: HasSideEffects (U)
+
+[1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      5     0.50    *                   mov	rax, qword ptr [rdi]
+ 1      1     1.00           *            mov	dword ptr [rax], esi
+ 1      1     0.50                        shr	rsi, 32
+ 1      1     1.00           *            mov	word ptr [rax + 4], si
+ 1      1     1.00                  U     ret
+
+
+Resources:
+[0]   - SBDivider
+[1]   - SBFPDivider
+[2]   - SBPort0
+[3]   - SBPort1
+[4]   - SBPort4
+[5]   - SBPort5
+[6.0] - SBPort23
+[6.1] - SBPort23
+
+
+Resource pressure per iteration:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
+ -      -     0.99    -     2.00   1.01   1.50   1.50   
+
+Resource pressure by instruction:
+[0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -      -      -      -      -     0.50   0.50   mov	rax, qword ptr [rdi]
+ -      -      -      -     1.00    -     0.33   0.67   mov	dword ptr [rax], esi
+ -      -     0.99    -      -     0.01    -      -     shr	rsi, 32
+ -      -      -      -     1.00    -     0.67   0.33   mov	word ptr [rax + 4], si
+ -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64 b/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64
index 03684cb09f8f..0a8a4f501a07 100644
--- a/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64
@@ -1,9 +1,8 @@
 bench_split_via_runtime_check_dynamic_padding:
 	mov rax, rdi
 	mov rdx, qword ptr [rsi + 16]
-	mov ecx, edx
-	and ecx, 3
-	cmp ecx, 1
+	lea ecx, [rdx - 1]
+	test cl, 3
 	jne .LBB5_1
 	mov rcx, qword ptr [rsi]
 	mov rsi, qword ptr [rsi + 8]
diff --git a/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64.mca
index 5034ab0583bd..7140b06e8842 100644
--- a/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64.mca
@@ -1,11 +1,11 @@
 Iterations:        100
-Instructions:      2000
+Instructions:      1900
 Total Cycles:      708
-Total uOps:        2000
+Total uOps:        1900
 
 Dispatch Width:    4
-uOps Per Cycle:    2.82
-IPC:               2.82
+uOps Per Cycle:    2.68
+IPC:               2.68
 Block RThroughput: 5.0
 
 
@@ -20,9 +20,8 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        mov	rax, rdi
  1      5     0.50    *                   mov	rdx, qword ptr [rsi + 16]
- 1      1     0.33                        mov	ecx, edx
- 1      1     0.33                        and	ecx, 3
- 1      1     0.33                        cmp	ecx, 1
+ 1      1     0.50                        lea	ecx, [rdx - 1]
+ 1      1     0.33                        test	cl, 3
  1      1     1.00                        jne	.LBB5_1
  1      5     0.50    *                   mov	rcx, qword ptr [rsi]
  1      5     0.50    *                   mov	rsi, qword ptr [rsi + 8]
@@ -53,22 +52,21 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     3.00   3.02   5.00   4.98   4.00   4.00   
+ -      -     2.99   3.00   5.00   4.01   4.00   4.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -      -     0.99    -     0.01    -      -     mov	rax, rdi
+ -      -     0.99    -      -     0.01    -      -     mov	rax, rdi
  -      -      -      -      -      -      -     1.00   mov	rdx, qword ptr [rsi + 16]
- -      -     0.99   0.01    -      -      -      -     mov	ecx, edx
- -      -     0.99   0.01    -      -      -      -     and	ecx, 3
- -      -     0.97   0.03    -      -      -      -     cmp	ecx, 1
+ -      -      -     1.00    -      -      -      -     lea	ecx, [rdx - 1]
+ -      -      -     0.98    -     0.02    -      -     test	cl, 3
  -      -      -      -      -     1.00    -      -     jne	.LBB5_1
  -      -      -      -      -      -     1.00    -     mov	rcx, qword ptr [rsi]
  -      -      -      -      -      -     0.99   0.01   mov	rsi, qword ptr [rsi + 8]
- -      -     0.01   0.99    -      -      -      -     lea	rdi, [rdx + 2*rdx]
- -      -      -     0.96    -     0.04    -      -     add	rdi, rcx
- -      -     0.03    -      -     0.97    -      -     add	rdi, 9
- -      -     0.01   0.03    -     0.96    -      -     sub	rsi, rdx
+ -      -     1.00    -      -      -      -      -     lea	rdi, [rdx + 2*rdx]
+ -      -     0.01   0.01    -     0.98    -      -     add	rdi, rcx
+ -      -      -     1.00    -      -      -      -     add	rdi, 9
+ -      -     0.99   0.01    -      -      -      -     sub	rsi, rdx
  -      -      -      -     1.00    -     1.00    -     mov	qword ptr [rax + 8], rdx
  -      -      -      -     1.00    -      -     1.00   mov	qword ptr [rax + 16], rdi
  -      -      -      -     1.00    -     0.01   0.99   mov	qword ptr [rax + 24], rsi
diff --git a/rust/zerocopy/benches/try_read_from_bytes.x86-64 b/rust/zerocopy/benches/try_read_from_bytes.x86-64
index 08088a08fd85..2135facc2655 100644
--- a/rust/zerocopy/benches/try_read_from_bytes.x86-64
+++ b/rust/zerocopy/benches/try_read_from_bytes.x86-64
@@ -1,23 +1,11 @@
 bench_try_read_from_bytes_static_size:
-	mov ax, -16191
+	mov eax, 49345
 	cmp rsi, 6
-	jne .LBB5_1
-	mov ecx, dword ptr [rdi]
-	movzx edx, cx
-	cmp edx, 49344
-	jne .LBB5_4
-	movzx eax, word ptr [rdi + 4]
-	shl rax, 32
-	or rcx, rax
-	shr rcx, 16
-	mov ax, -16192
-.LBB5_4:
-	shl rcx, 16
-	movzx eax, ax
-	or rax, rcx
-	ret
-.LBB5_1:
-	shl rcx, 16
-	movzx eax, ax
-	or rax, rcx
+	jne .LBB5_3
+	cmp word ptr [rdi], -16192
+	jne .LBB5_3
+	mov eax, dword ptr [rdi + 2]
+	shl rax, 16
+	or rax, 49344
+.LBB5_3:
 	ret
diff --git a/rust/zerocopy/benches/try_read_from_bytes.x86-64.mca b/rust/zerocopy/benches/try_read_from_bytes.x86-64.mca
index 385e6a480253..f5568fef5ae7 100644
--- a/rust/zerocopy/benches/try_read_from_bytes.x86-64.mca
+++ b/rust/zerocopy/benches/try_read_from_bytes.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      2000
-Total Cycles:      608
-Total uOps:        2000
+Instructions:      900
+Total Cycles:      305
+Total uOps:        1000
 
 Dispatch Width:    4
-uOps Per Cycle:    3.29
-IPC:               3.29
-Block RThroughput: 5.0
+uOps Per Cycle:    3.28
+IPC:               2.95
+Block RThroughput: 3.0
 
 
 Instruction Info:
@@ -18,25 +18,14 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        mov	ax, -16191
+ 1      1     0.33                        mov	eax, 49345
  1      1     0.33                        cmp	rsi, 6
- 1      1     1.00                        jne	.LBB5_1
- 1      5     0.50    *                   mov	ecx, dword ptr [rdi]
- 1      1     0.33                        movzx	edx, cx
- 1      1     0.33                        cmp	edx, 49344
- 1      1     1.00                        jne	.LBB5_4
- 1      5     0.50    *                   movzx	eax, word ptr [rdi + 4]
- 1      1     0.50                        shl	rax, 32
- 1      1     0.33                        or	rcx, rax
- 1      1     0.50                        shr	rcx, 16
- 1      1     0.33                        mov	ax, -16192
- 1      1     0.50                        shl	rcx, 16
- 1      1     0.33                        movzx	eax, ax
- 1      1     0.33                        or	rax, rcx
- 1      1     1.00                  U     ret
- 1      1     0.50                        shl	rcx, 16
- 1      1     0.33                        movzx	eax, ax
- 1      1     0.33                        or	rax, rcx
+ 1      1     1.00                        jne	.LBB5_3
+ 2      6     0.50    *                   cmp	word ptr [rdi], -16192
+ 1      1     1.00                        jne	.LBB5_3
+ 1      5     0.50    *                   mov	eax, dword ptr [rdi + 2]
+ 1      1     0.50                        shl	rax, 16
+ 1      1     0.33                        or	rax, 49344
  1      1     1.00                  U     ret
 
 
@@ -53,27 +42,16 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     5.99   5.99    -     6.02   1.00   1.00   
+ -      -     2.50   2.49    -     3.01   1.00   1.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -      -     0.99    -     0.01    -      -     mov	ax, -16191
- -      -      -     0.01    -     0.99    -      -     cmp	rsi, 6
- -      -      -      -      -     1.00    -      -     jne	.LBB5_1
- -      -      -      -      -      -      -     1.00   mov	ecx, dword ptr [rdi]
- -      -     0.98    -      -     0.02    -      -     movzx	edx, cx
- -      -     0.99   0.01    -      -      -      -     cmp	edx, 49344
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -      -      -      -      -     1.00    -     movzx	eax, word ptr [rdi + 4]
- -      -     0.01    -      -     0.99    -      -     shl	rax, 32
- -      -     0.02   0.98    -      -      -      -     or	rcx, rax
- -      -     1.00    -      -      -      -      -     shr	rcx, 16
- -      -     0.99   0.01    -      -      -      -     mov	ax, -16192
- -      -     1.00    -      -      -      -      -     shl	rcx, 16
- -      -      -     1.00    -      -      -      -     movzx	eax, ax
- -      -      -     1.00    -      -      -      -     or	rax, rcx
- -      -      -      -      -     1.00    -      -     ret
- -      -     1.00    -      -      -      -      -     shl	rcx, 16
- -      -      -     1.00    -      -      -      -     movzx	eax, ax
- -      -      -     0.99    -     0.01    -      -     or	rax, rcx
+ -      -     0.50   0.49    -     0.01    -      -     mov	eax, 49345
+ -      -     0.49   0.51    -      -      -      -     cmp	rsi, 6
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -     0.47   0.53    -      -     0.43   0.57   cmp	word ptr [rdi], -16192
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -      -      -      -      -     0.57   0.43   mov	eax, dword ptr [rdi + 2]
+ -      -     1.00    -      -      -      -      -     shl	rax, 16
+ -      -     0.04   0.96    -      -      -      -     or	rax, 49344
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_read_from_prefix.x86-64 b/rust/zerocopy/benches/try_read_from_prefix.x86-64
index d3e1edc3ea73..0f820efff5f8 100644
--- a/rust/zerocopy/benches/try_read_from_prefix.x86-64
+++ b/rust/zerocopy/benches/try_read_from_prefix.x86-64
@@ -1,16 +1,11 @@
 bench_try_read_from_prefix_static_size:
 	mov eax, 49345
 	cmp rsi, 6
-	jb .LBB5_2
-	mov eax, dword ptr [rdi]
-	movzx ecx, word ptr [rdi + 4]
-	shl rcx, 32
-	or rcx, rax
-	movzx eax, cx
-	and rcx, -65536
-	or rcx, 49344
-	cmp eax, 49344
-	mov eax, 49345
-	cmove rax, rcx
-.LBB5_2:
+	jb .LBB5_3
+	cmp word ptr [rdi], -16192
+	jne .LBB5_3
+	mov eax, dword ptr [rdi + 2]
+	shl rax, 16
+	or rax, 49344
+.LBB5_3:
 	ret
diff --git a/rust/zerocopy/benches/try_read_from_prefix.x86-64.mca b/rust/zerocopy/benches/try_read_from_prefix.x86-64.mca
index 40401d89e83d..e0ba4c8320e3 100644
--- a/rust/zerocopy/benches/try_read_from_prefix.x86-64.mca
+++ b/rust/zerocopy/benches/try_read_from_prefix.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1400
-Total Cycles:      442
-Total uOps:        1500
+Instructions:      900
+Total Cycles:      305
+Total uOps:        1000
 
 Dispatch Width:    4
-uOps Per Cycle:    3.39
-IPC:               3.17
-Block RThroughput: 3.8
+uOps Per Cycle:    3.28
+IPC:               2.95
+Block RThroughput: 3.0
 
 
 Instruction Info:
@@ -20,17 +20,12 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        mov	eax, 49345
  1      1     0.33                        cmp	rsi, 6
- 1      1     1.00                        jb	.LBB5_2
- 1      5     0.50    *                   mov	eax, dword ptr [rdi]
- 1      5     0.50    *                   movzx	ecx, word ptr [rdi + 4]
- 1      1     0.50                        shl	rcx, 32
- 1      1     0.33                        or	rcx, rax
- 1      1     0.33                        movzx	eax, cx
- 1      1     0.33                        and	rcx, -65536
- 1      1     0.33                        or	rcx, 49344
- 1      1     0.33                        cmp	eax, 49344
- 1      1     0.33                        mov	eax, 49345
- 2      2     0.67                        cmove	rax, rcx
+ 1      1     1.00                        jb	.LBB5_3
+ 2      6     0.50    *                   cmp	word ptr [rdi], -16192
+ 1      1     1.00                        jne	.LBB5_3
+ 1      5     0.50    *                   mov	eax, dword ptr [rdi + 2]
+ 1      1     0.50                        shl	rax, 16
+ 1      1     0.33                        or	rax, 49344
  1      1     1.00                  U     ret
 
 
@@ -47,21 +42,16 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     4.33   4.33    -     4.34   1.00   1.00   
+ -      -     2.50   2.49    -     3.01   1.00   1.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.65   0.01    -     0.34    -      -     mov	eax, 49345
- -      -     0.01   0.33    -     0.66    -      -     cmp	rsi, 6
- -      -      -      -      -     1.00    -      -     jb	.LBB5_2
- -      -      -      -      -      -      -     1.00   mov	eax, dword ptr [rdi]
- -      -      -      -      -      -     1.00    -     movzx	ecx, word ptr [rdi + 4]
- -      -     0.65    -      -     0.35    -      -     shl	rcx, 32
- -      -      -     0.67    -     0.33    -      -     or	rcx, rax
- -      -     0.01   0.99    -      -      -      -     movzx	eax, cx
- -      -     0.99   0.01    -      -      -      -     and	rcx, -65536
- -      -     0.01   0.99    -      -      -      -     or	rcx, 49344
- -      -     0.99   0.01    -      -      -      -     cmp	eax, 49344
- -      -     0.02   0.33    -     0.65    -      -     mov	eax, 49345
- -      -     1.00   0.99    -     0.01    -      -     cmove	rax, rcx
+ -      -     0.50   0.49    -     0.01    -      -     mov	eax, 49345
+ -      -     0.49   0.51    -      -      -      -     cmp	rsi, 6
+ -      -      -      -      -     1.00    -      -     jb	.LBB5_3
+ -      -     0.47   0.53    -      -     0.43   0.57   cmp	word ptr [rdi], -16192
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -      -      -      -      -     0.57   0.43   mov	eax, dword ptr [rdi + 2]
+ -      -     1.00    -      -      -      -      -     shl	rax, 16
+ -      -     0.04   0.96    -      -      -      -     or	rax, 49344
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_read_from_suffix.x86-64 b/rust/zerocopy/benches/try_read_from_suffix.x86-64
index 095e326f0467..a91c074e1806 100644
--- a/rust/zerocopy/benches/try_read_from_suffix.x86-64
+++ b/rust/zerocopy/benches/try_read_from_suffix.x86-64
@@ -1,18 +1,11 @@
 bench_try_read_from_suffix_static_size:
 	mov eax, 49345
 	cmp rsi, 6
-	jb .LBB5_2
-	mov eax, dword ptr [rdi + rsi - 6]
-	movzx ecx, word ptr [rdi + rsi - 2]
-	shl rcx, 32
-	or rcx, rax
-	movzx edx, cx
-	xor eax, eax
-	cmp edx, 49344
-	cmovne rcx, rsi
-	sete al
-	and rcx, -65536
-	xor rax, 49345
-	or rax, rcx
-.LBB5_2:
+	jb .LBB5_3
+	cmp word ptr [rdi + rsi - 6], -16192
+	jne .LBB5_3
+	mov eax, dword ptr [rdi + rsi - 4]
+	shl rax, 16
+	or rax, 49344
+.LBB5_3:
 	ret
diff --git a/rust/zerocopy/benches/try_read_from_suffix.x86-64.mca b/rust/zerocopy/benches/try_read_from_suffix.x86-64.mca
index d3eaadbb8a81..e42f6b93effb 100644
--- a/rust/zerocopy/benches/try_read_from_suffix.x86-64.mca
+++ b/rust/zerocopy/benches/try_read_from_suffix.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1600
-Total Cycles:      478
-Total uOps:        1700
+Instructions:      900
+Total Cycles:      305
+Total uOps:        1000
 
 Dispatch Width:    4
-uOps Per Cycle:    3.56
-IPC:               3.35
-Block RThroughput: 4.3
+uOps Per Cycle:    3.28
+IPC:               2.95
+Block RThroughput: 3.0
 
 
 Instruction Info:
@@ -20,19 +20,12 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        mov	eax, 49345
  1      1     0.33                        cmp	rsi, 6
- 1      1     1.00                        jb	.LBB5_2
- 1      5     0.50    *                   mov	eax, dword ptr [rdi + rsi - 6]
- 1      5     0.50    *                   movzx	ecx, word ptr [rdi + rsi - 2]
- 1      1     0.50                        shl	rcx, 32
- 1      1     0.33                        or	rcx, rax
- 1      1     0.33                        movzx	edx, cx
- 1      0     0.25                        xor	eax, eax
- 1      1     0.33                        cmp	edx, 49344
- 2      2     0.67                        cmovne	rcx, rsi
- 1      1     0.50                        sete	al
- 1      1     0.33                        and	rcx, -65536
- 1      1     0.33                        xor	rax, 49345
- 1      1     0.33                        or	rax, rcx
+ 1      1     1.00                        jb	.LBB5_3
+ 2      6     0.50    *                   cmp	word ptr [rdi + rsi - 6], -16192
+ 1      1     1.00                        jne	.LBB5_3
+ 1      5     0.50    *                   mov	eax, dword ptr [rdi + rsi - 4]
+ 1      1     0.50                        shl	rax, 16
+ 1      1     0.33                        or	rax, 49344
  1      1     1.00                  U     ret
 
 
@@ -49,23 +42,16 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     4.66   4.66    -     4.68   1.00   1.00   
+ -      -     2.50   2.49    -     3.01   1.00   1.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.32   0.01    -     0.67    -      -     mov	eax, 49345
- -      -     0.62   0.02    -     0.36    -      -     cmp	rsi, 6
- -      -      -      -      -     1.00    -      -     jb	.LBB5_2
- -      -      -      -      -      -      -     1.00   mov	eax, dword ptr [rdi + rsi - 6]
- -      -      -      -      -      -     1.00    -     movzx	ecx, word ptr [rdi + rsi - 2]
- -      -     0.37    -      -     0.63    -      -     shl	rcx, 32
- -      -     0.99   0.01    -      -      -      -     or	rcx, rax
- -      -     1.00    -      -      -      -      -     movzx	edx, cx
- -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.35   0.64    -     0.01    -      -     cmp	edx, 49344
- -      -     1.00   1.00    -      -      -      -     cmovne	rcx, rsi
- -      -      -      -      -     1.00    -      -     sete	al
- -      -     0.01   0.99    -      -      -      -     and	rcx, -65536
- -      -      -     1.00    -      -      -      -     xor	rax, 49345
- -      -      -     0.99    -     0.01    -      -     or	rax, rcx
+ -      -     0.50   0.49    -     0.01    -      -     mov	eax, 49345
+ -      -     0.49   0.51    -      -      -      -     cmp	rsi, 6
+ -      -      -      -      -     1.00    -      -     jb	.LBB5_3
+ -      -     0.47   0.53    -      -     0.43   0.57   cmp	word ptr [rdi + rsi - 6], -16192
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_3
+ -      -      -      -      -      -     0.57   0.43   mov	eax, dword ptr [rdi + rsi - 4]
+ -      -     1.00    -      -      -      -      -     shl	rax, 16
+ -      -     0.04   0.96    -      -      -      -     or	rax, 49344
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64 b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64
index 217c5fc61796..5584e9054185 100644
--- a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64
@@ -1,24 +1,22 @@
 bench_try_ref_from_bytes_dynamic_padding:
-	test dil, 3
-	jne .LBB5_4
-	movabs rax, 9223372036854775804
-	and rax, rsi
-	cmp rax, 9
-	jb .LBB5_4
-	add rax, -9
+	cmp rsi, 12
+	setae al
+	mov ecx, esi
+	or ecx, edi
+	test cl, 3
+	sete cl
+	and cl, al
+	cmp cl, 1
+	je .LBB5_2
+	xor eax, eax
+	ret
+.LBB5_2:
+	add rsi, -9
 	movabs rcx, -6148914691236517205
+	mov rax, rsi
 	mul rcx
 	shr rdx
-	lea rax, [rdx + 2*rdx]
-	or rax, 3
-	add rax, 9
-	cmp rsi, rax
-	jne .LBB5_4
+	xor eax, eax
 	cmp word ptr [rdi], -16192
-	je .LBB5_5
-.LBB5_4:
-	xor edi, edi
-	mov rdx, rsi
-.LBB5_5:
-	mov rax, rdi
+	cmove rax, rdi
 	ret
diff --git a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64.mca
index 95b993c7e0a8..ccd610c7ef41 100644
--- a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64.mca
@@ -1,10 +1,10 @@
 Iterations:        100
-Instructions:      2100
-Total Cycles:      709
+Instructions:      2000
+Total Cycles:      675
 Total uOps:        2300
 
 Dispatch Width:    4
-uOps Per Cycle:    3.24
+uOps Per Cycle:    3.41
 IPC:               2.96
 Block RThroughput: 5.8
 
@@ -18,26 +18,25 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        test	dil, 3
- 1      1     1.00                        jne	.LBB5_4
- 1      1     0.33                        movabs	rax, 9223372036854775804
- 1      1     0.33                        and	rax, rsi
- 1      1     0.33                        cmp	rax, 9
- 1      1     1.00                        jb	.LBB5_4
- 1      1     0.33                        add	rax, -9
+ 1      1     0.33                        cmp	rsi, 12
+ 1      1     0.50                        setae	al
+ 1      1     0.33                        mov	ecx, esi
+ 1      1     0.33                        or	ecx, edi
+ 1      1     0.33                        test	cl, 3
+ 1      1     0.50                        sete	cl
+ 1      1     0.33                        and	cl, al
+ 1      1     0.33                        cmp	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	eax, eax
+ 1      1     1.00                  U     ret
+ 1      1     0.33                        add	rsi, -9
  1      1     0.33                        movabs	rcx, -6148914691236517205
+ 1      1     0.33                        mov	rax, rsi
  2      4     1.00                        mul	rcx
  1      1     0.50                        shr	rdx
- 1      1     0.50                        lea	rax, [rdx + 2*rdx]
- 1      1     0.33                        or	rax, 3
- 1      1     0.33                        add	rax, 9
- 1      1     0.33                        cmp	rsi, rax
- 1      1     1.00                        jne	.LBB5_4
+ 1      0     0.25                        xor	eax, eax
  2      6     0.50    *                   cmp	word ptr [rdi], -16192
- 1      1     1.00                        je	.LBB5_5
- 1      0     0.25                        xor	edi, edi
- 1      1     0.33                        mov	rdx, rsi
- 1      1     0.33                        mov	rax, rdi
+ 2      2     0.67                        cmove	rax, rdi
  1      1     1.00                  U     ret
 
 
@@ -54,28 +53,27 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.98   6.99    -     7.03   0.50   0.50   
+ -      -     6.67   6.66    -     6.67   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.48   0.51    -     0.01    -      -     test	dil, 3
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -     0.51   0.49    -      -      -      -     movabs	rax, 9223372036854775804
- -      -     0.01   0.99    -      -      -      -     and	rax, rsi
- -      -     0.51   0.49    -      -      -      -     cmp	rax, 9
- -      -      -      -      -     1.00    -      -     jb	.LBB5_4
- -      -     0.98    -      -     0.02    -      -     add	rax, -9
- -      -     0.98   0.02    -      -      -      -     movabs	rcx, -6148914691236517205
+ -      -     0.33   0.66    -     0.01    -      -     cmp	rsi, 12
+ -      -     1.00    -      -      -      -      -     setae	al
+ -      -     0.66   0.34    -      -      -      -     mov	ecx, esi
+ -      -      -     0.99    -     0.01    -      -     or	ecx, edi
+ -      -      -     0.67    -     0.33    -      -     test	cl, 3
+ -      -     0.67    -      -     0.33    -      -     sete	cl
+ -      -     0.33   0.34    -     0.33    -      -     and	cl, al
+ -      -     0.33    -      -     0.67    -      -     cmp	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	eax, eax
+ -      -      -      -      -     1.00    -      -     ret
+ -      -     0.67   0.33    -      -      -      -     add	rsi, -9
+ -      -     0.99   0.01    -      -      -      -     movabs	rcx, -6148914691236517205
+ -      -      -     0.99    -     0.01    -      -     mov	rax, rsi
  -      -     1.00   1.00    -      -      -      -     mul	rcx
- -      -     0.99    -      -     0.01    -      -     shr	rdx
- -      -      -     1.00    -      -      -      -     lea	rax, [rdx + 2*rdx]
- -      -      -     0.51    -     0.49    -      -     or	rax, 3
- -      -     0.01   0.49    -     0.50    -      -     add	rax, 9
- -      -      -     0.02    -     0.98    -      -     cmp	rsi, rax
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -     0.51   0.49    -      -     0.50   0.50   cmp	word ptr [rdi], -16192
- -      -      -      -      -     1.00    -      -     je	.LBB5_5
- -      -      -      -      -      -      -      -     xor	edi, edi
- -      -     0.50   0.50    -      -      -      -     mov	rdx, rsi
- -      -     0.50   0.48    -     0.02    -      -     mov	rax, rdi
+ -      -     0.01    -      -     0.99    -      -     shr	rdx
+ -      -      -      -      -      -      -      -     xor	eax, eax
+ -      -     0.67   0.33    -      -     0.50   0.50   cmp	word ptr [rdi], -16192
+ -      -     0.01   1.00    -     0.99    -      -     cmove	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64 b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64
index cf67afd31ce0..39b12e14eec1 100644
--- a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64
@@ -1,22 +1,21 @@
 bench_try_ref_from_bytes_dynamic_size:
-	mov rdx, rsi
-	mov rax, rdi
 	cmp rsi, 4
-	setb cl
-	or cl, al
+	setae al
+	mov ecx, esi
+	or ecx, edi
 	test cl, 1
-	jne .LBB5_4
-	lea rcx, [rdx - 4]
-	mov rsi, rcx
-	and rsi, -2
-	add rsi, 4
-	cmp rdx, rsi
-	jne .LBB5_4
-	cmp word ptr [rax], -16192
-	jne .LBB5_4
-	shr rcx
-	mov rdx, rcx
+	sete cl
+	and cl, al
+	cmp cl, 1
+	je .LBB5_2
+	xor eax, eax
 	ret
-.LBB5_4:
+.LBB5_2:
+	lea rdx, [rsi - 4]
+	shr rdx
+	movzx ecx, word ptr [rdi]
 	xor eax, eax
+	cmp ecx, 49344
+	cmovne rdx, rsi
+	cmove rax, rdi
 	ret
diff --git a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64.mca b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64.mca
index ecd7a18f6d6d..eecf3a1554cb 100644
--- a/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64.mca
@@ -1,10 +1,10 @@
 Iterations:        100
-Instructions:      2000
-Total Cycles:      639
+Instructions:      1900
+Total Cycles:      607
 Total uOps:        2100
 
 Dispatch Width:    4
-uOps Per Cycle:    3.29
+uOps Per Cycle:    3.46
 IPC:               3.13
 Block RThroughput: 5.3
 
@@ -18,25 +18,24 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.33                        mov	rdx, rsi
- 1      1     0.33                        mov	rax, rdi
  1      1     0.33                        cmp	rsi, 4
- 1      1     0.50                        setb	cl
- 1      1     0.33                        or	cl, al
+ 1      1     0.50                        setae	al
+ 1      1     0.33                        mov	ecx, esi
+ 1      1     0.33                        or	ecx, edi
  1      1     0.33                        test	cl, 1
- 1      1     1.00                        jne	.LBB5_4
- 1      1     0.50                        lea	rcx, [rdx - 4]
- 1      1     0.33                        mov	rsi, rcx
- 1      1     0.33                        and	rsi, -2
- 1      1     0.33                        add	rsi, 4
- 1      1     0.33                        cmp	rdx, rsi
- 1      1     1.00                        jne	.LBB5_4
- 2      6     0.50    *                   cmp	word ptr [rax], -16192
- 1      1     1.00                        jne	.LBB5_4
- 1      1     0.50                        shr	rcx
- 1      1     0.33                        mov	rdx, rcx
+ 1      1     0.50                        sete	cl
+ 1      1     0.33                        and	cl, al
+ 1      1     0.33                        cmp	cl, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      0     0.25                        xor	eax, eax
  1      1     1.00                  U     ret
+ 1      1     0.50                        lea	rdx, [rsi - 4]
+ 1      1     0.50                        shr	rdx
+ 1      5     0.50    *                   movzx	ecx, word ptr [rdi]
  1      0     0.25                        xor	eax, eax
+ 1      1     0.33                        cmp	ecx, 49344
+ 2      2     0.67                        cmovne	rdx, rsi
+ 2      2     0.67                        cmove	rax, rdi
  1      1     1.00                  U     ret
 
 
@@ -53,27 +52,26 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.32   6.32    -     6.36   0.50   0.50   
+ -      -     5.99   5.99    -     6.02   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.33   0.66    -     0.01    -      -     mov	rdx, rsi
- -      -     0.66   0.34    -      -      -      -     mov	rax, rdi
- -      -     0.34   0.66    -      -      -      -     cmp	rsi, 4
- -      -     0.99    -      -     0.01    -      -     setb	cl
- -      -     0.01   0.99    -      -      -      -     or	cl, al
- -      -      -     1.00    -      -      -      -     test	cl, 1
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -     0.66   0.34    -      -      -      -     lea	rcx, [rdx - 4]
- -      -     0.33   0.66    -     0.01    -      -     mov	rsi, rcx
- -      -     1.00    -      -      -      -      -     and	rsi, -2
- -      -     0.66   0.34    -      -      -      -     add	rsi, 4
- -      -      -     1.00    -      -      -      -     cmp	rdx, rsi
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -      -      -      -     1.00   0.50   0.50   cmp	word ptr [rax], -16192
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -     0.67    -      -     0.33    -      -     shr	rcx
- -      -     0.67   0.33    -      -      -      -     mov	rdx, rcx
+ -      -     0.02   0.97    -     0.01    -      -     cmp	rsi, 4
+ -      -     1.00    -      -      -      -      -     setae	al
+ -      -      -     1.00    -      -      -      -     mov	ecx, esi
+ -      -     0.93   0.05    -     0.02    -      -     or	ecx, edi
+ -      -     0.94   0.06    -      -      -      -     test	cl, 1
+ -      -     0.99    -      -     0.01    -      -     sete	cl
+ -      -     0.98   0.02    -      -      -      -     and	cl, al
+ -      -     0.98   0.02    -      -      -      -     cmp	cl, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -      -      -      -      -      -      -     xor	eax, eax
  -      -      -      -      -     1.00    -      -     ret
+ -      -     0.01   0.99    -      -      -      -     lea	rdx, [rsi - 4]
+ -      -      -      -      -     1.00    -      -     shr	rdx
+ -      -      -      -      -      -     0.50   0.50   movzx	ecx, word ptr [rdi]
  -      -      -      -      -      -      -      -     xor	eax, eax
+ -      -     0.02   0.96    -     0.02    -      -     cmp	ecx, 49344
+ -      -     0.05   0.97    -     0.98    -      -     cmovne	rdx, rsi
+ -      -     0.07   0.95    -     0.98    -      -     cmove	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64 b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64
index d832cb7ecf7f..ff64bb659591 100644
--- a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64
@@ -1,19 +1,18 @@
 bench_try_ref_from_prefix_dynamic_padding:
+	test dil, 3
+	sete al
+	cmp rsi, 12
+	setae cl
+	test al, cl
+	jne .LBB5_2
 	xor edx, edx
-	mov eax, 0
 	test dil, 3
-	je .LBB5_1
-	ret
-.LBB5_1:
-	movabs rax, 9223372036854775804
-	and rsi, rax
-	cmp rsi, 9
-	jae .LBB5_3
-	mov edx, 1
+	sete dl
 	xor eax, eax
 	ret
-.LBB5_3:
-	add rsi, -9
+.LBB5_2:
+	or rsi, 3
+	add rsi, -12
 	movabs rcx, -6148914691236517205
 	mov rax, rsi
 	mul rcx
diff --git a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64.mca
index 482112a39b33..29225404a28f 100644
--- a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64.mca
@@ -18,19 +18,19 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
+ 1      1     0.33                        test	dil, 3
+ 1      1     0.50                        sete	al
+ 1      1     0.33                        cmp	rsi, 12
+ 1      1     0.50                        setae	cl
+ 1      1     0.33                        test	al, cl
+ 1      1     1.00                        jne	.LBB5_2
  1      0     0.25                        xor	edx, edx
- 1      1     0.33                        mov	eax, 0
  1      1     0.33                        test	dil, 3
- 1      1     1.00                        je	.LBB5_1
- 1      1     1.00                  U     ret
- 1      1     0.33                        movabs	rax, 9223372036854775804
- 1      1     0.33                        and	rsi, rax
- 1      1     0.33                        cmp	rsi, 9
- 1      1     1.00                        jae	.LBB5_3
- 1      1     0.33                        mov	edx, 1
+ 1      1     0.50                        sete	dl
  1      0     0.25                        xor	eax, eax
  1      1     1.00                  U     ret
- 1      1     0.33                        add	rsi, -9
+ 1      1     0.33                        or	rsi, 3
+ 1      1     0.33                        add	rsi, -12
  1      1     0.33                        movabs	rcx, -6148914691236517205
  1      1     0.33                        mov	rax, rsi
  2      4     1.00                        mul	rcx
@@ -63,29 +63,29 @@ Resource pressure per iteration:
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
+ -      -     0.01   0.98    -     0.01    -      -     test	dil, 3
+ -      -     0.98    -      -     0.02    -      -     sete	al
+ -      -      -     1.00    -      -      -      -     cmp	rsi, 12
+ -      -      -      -      -     1.00    -      -     setae	cl
+ -      -     0.01   0.03    -     0.96    -      -     test	al, cl
+ -      -      -      -      -     1.00    -      -     jne	.LBB5_2
  -      -      -      -      -      -      -      -     xor	edx, edx
- -      -     0.32   0.34    -     0.34    -      -     mov	eax, 0
- -      -     0.34   0.33    -     0.33    -      -     test	dil, 3
- -      -      -      -      -     1.00    -      -     je	.LBB5_1
- -      -      -      -      -     1.00    -      -     ret
- -      -     0.35   0.65    -      -      -      -     movabs	rax, 9223372036854775804
- -      -     0.96   0.03    -     0.01    -      -     and	rsi, rax
- -      -     0.01   0.97    -     0.02    -      -     cmp	rsi, 9
- -      -      -      -      -     1.00    -      -     jae	.LBB5_3
- -      -     0.67   0.01    -     0.32    -      -     mov	edx, 1
+ -      -      -     1.00    -      -      -      -     test	dil, 3
+ -      -     0.99    -      -     0.01    -      -     sete	dl
  -      -      -      -      -      -      -      -     xor	eax, eax
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.02   0.34    -     0.64    -      -     add	rsi, -9
- -      -     0.33   0.66    -     0.01    -      -     movabs	rcx, -6148914691236517205
- -      -     0.66   0.34    -      -      -      -     mov	rax, rsi
+ -      -      -     1.00    -      -      -      -     or	rsi, 3
+ -      -     0.01   0.99    -      -      -      -     add	rsi, -12
+ -      -     0.01   0.99    -      -      -      -     movabs	rcx, -6148914691236517205
+ -      -     0.34   0.66    -      -      -      -     mov	rax, rsi
  -      -     1.00   1.00    -      -      -      -     mul	rcx
- -      -     0.01   0.99    -      -      -      -     mov	rax, rdx
- -      -     0.99    -      -     0.01    -      -     shr	rax
+ -      -     0.99    -      -     0.01    -      -     mov	rax, rdx
+ -      -     1.00    -      -      -      -      -     shr	rax
  -      -      -      -      -      -     0.50   0.50   movzx	ecx, word ptr [rdi]
- -      -     0.33   0.03    -     0.64    -      -     cmp	cx, -16192
- -      -     0.01   0.31    -     0.68    -      -     mov	edx, 2
- -      -     1.00   1.00    -      -      -      -     cmove	rdx, rax
+ -      -     0.34   0.32    -     0.34    -      -     cmp	cx, -16192
+ -      -     0.33   0.01    -     0.66    -      -     mov	edx, 2
+ -      -     0.99   0.01    -     1.00    -      -     cmove	rdx, rax
  -      -      -      -      -      -      -      -     xor	eax, eax
  -      -     0.33   0.33    -     0.34    -      -     cmp	ecx, 49344
- -      -     1.00   1.00    -      -      -      -     cmove	rax, rdi
+ -      -     1.00   0.01    -     0.99    -      -     cmove	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64 b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64
index be7f34b9f8f5..de31f571f3c9 100644
--- a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64
@@ -1,14 +1,15 @@
 bench_try_ref_from_prefix_dynamic_size:
-	xor edx, edx
-	mov eax, 0
-	test dil, 1
-	jne .LBB5_4
 	cmp rsi, 4
-	jae .LBB5_3
-	mov edx, 1
+	setb al
+	or al, dil
+	test al, 1
+	je .LBB5_2
+	not edi
+	and edi, 1
 	xor eax, eax
+	mov rdx, rdi
 	ret
-.LBB5_3:
+.LBB5_2:
 	add rsi, -4
 	shr rsi
 	movzx ecx, word ptr [rdi]
@@ -18,5 +19,4 @@ bench_try_ref_from_prefix_dynamic_size:
 	xor eax, eax
 	cmp cx, -16192
 	cmove rax, rdi
-.LBB5_4:
 	ret
diff --git a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64.mca b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64.mca
index 11706defe11e..cd0919d04c08 100644
--- a/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1900
-Total Cycles:      573
-Total uOps:        2100
+Instructions:      2000
+Total Cycles:      643
+Total uOps:        2200
 
 Dispatch Width:    4
-uOps Per Cycle:    3.66
-IPC:               3.32
-Block RThroughput: 5.3
+uOps Per Cycle:    3.42
+IPC:               3.11
+Block RThroughput: 5.5
 
 
 Instruction Info:
@@ -18,14 +18,15 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      0     0.25                        xor	edx, edx
- 1      1     0.33                        mov	eax, 0
- 1      1     0.33                        test	dil, 1
- 1      1     1.00                        jne	.LBB5_4
  1      1     0.33                        cmp	rsi, 4
- 1      1     1.00                        jae	.LBB5_3
- 1      1     0.33                        mov	edx, 1
+ 1      1     0.50                        setb	al
+ 1      1     0.33                        or	al, dil
+ 1      1     0.33                        test	al, 1
+ 1      1     1.00                        je	.LBB5_2
+ 1      1     0.33                        not	edi
+ 1      1     0.33                        and	edi, 1
  1      0     0.25                        xor	eax, eax
+ 1      1     0.33                        mov	rdx, rdi
  1      1     1.00                  U     ret
  1      1     0.33                        add	rsi, -4
  1      1     0.50                        shr	rsi
@@ -52,26 +53,27 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     5.66   5.67    -     5.67   0.50   0.50   
+ -      -     6.33   6.33    -     6.34   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -      -      -      -      -      -      -     xor	edx, edx
- -      -     0.30   0.37    -     0.33    -      -     mov	eax, 0
- -      -     0.35   0.32    -     0.33    -      -     test	dil, 1
- -      -      -      -      -     1.00    -      -     jne	.LBB5_4
- -      -     0.32   0.33    -     0.35    -      -     cmp	rsi, 4
- -      -      -      -      -     1.00    -      -     jae	.LBB5_3
- -      -     0.33   0.35    -     0.32    -      -     mov	edx, 1
+ -      -     0.67   0.32    -     0.01    -      -     cmp	rsi, 4
+ -      -     0.99    -      -     0.01    -      -     setb	al
+ -      -     0.19   0.48    -     0.33    -      -     or	al, dil
+ -      -     0.50   0.16    -     0.34    -      -     test	al, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
+ -      -     0.50   0.50    -      -      -      -     not	edi
+ -      -     0.49   0.34    -     0.17    -      -     and	edi, 1
  -      -      -      -      -      -      -      -     xor	eax, eax
+ -      -     0.16   0.84    -      -      -      -     mov	rdx, rdi
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.34   0.64    -     0.02    -      -     add	rsi, -4
- -      -     1.00    -      -      -      -      -     shr	rsi
+ -      -     0.68   0.32    -      -      -      -     add	rsi, -4
+ -      -     0.85    -      -     0.15    -      -     shr	rsi
  -      -      -      -      -      -     0.50   0.50   movzx	ecx, word ptr [rdi]
- -      -     0.60   0.40    -      -      -      -     cmp	ecx, 49344
- -      -     0.05   0.95    -      -      -      -     mov	edx, 2
- -      -     1.00   1.00    -      -      -      -     cmove	rdx, rsi
+ -      -      -     0.50    -     0.50    -      -     cmp	ecx, 49344
+ -      -     0.63   0.37    -      -      -      -     mov	edx, 2
+ -      -     0.17   1.00    -     0.83    -      -     cmove	rdx, rsi
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.37   0.31    -     0.32    -      -     cmp	cx, -16192
- -      -     1.00   1.00    -      -      -      -     cmove	rax, rdi
+ -      -     0.50   0.50    -      -      -      -     cmp	cx, -16192
+ -      -      -     1.00    -     1.00    -      -     cmove	rax, rdi
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64 b/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64
index b3e924442865..cee9a3179097 100644
--- a/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64
@@ -1,26 +1,23 @@
 bench_try_ref_from_suffix_dynamic_padding:
 	lea eax, [rsi + rdi]
 	test al, 3
-	jne .LBB5_1
-	movabs rax, 9223372036854775804
-	and rax, rsi
-	cmp rax, 9
-	jae .LBB5_3
-.LBB5_1:
+	setne al
+	cmp rsi, 12
+	setb cl
+	or cl, al
+	je .LBB5_2
 	xor eax, eax
 	ret
-.LBB5_3:
-	add rax, -9
+.LBB5_2:
+	mov rax, rsi
+	or rax, 3
+	add rax, -12
 	movabs rcx, -6148914691236517205
 	mul rcx
 	shr rdx
-	lea rcx, [rdx + 2*rdx]
-	sub rsi, rcx
-	or rcx, -4
-	add rsi, rdi
-	lea rdi, [rcx + rsi]
-	add rdi, -8
+	and esi, 3
+	lea rcx, [rdi + rsi]
 	xor eax, eax
-	cmp word ptr [rcx + rsi - 8], -16192
-	cmove rax, rdi
+	cmp word ptr [rdi + rsi], -16192
+	cmove rax, rcx
 	ret
diff --git a/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64.mca
index d56ae56d854a..92df4484b823 100644
--- a/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      2300
-Total Cycles:      791
-Total uOps:        2600
+Instructions:      2100
+Total Cycles:      710
+Total uOps:        2400
 
 Dispatch Width:    4
-uOps Per Cycle:    3.29
-IPC:               2.91
-Block RThroughput: 6.5
+uOps Per Cycle:    3.38
+IPC:               2.96
+Block RThroughput: 6.0
 
 
 Instruction Info:
@@ -20,26 +20,24 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.50                        lea	eax, [rsi + rdi]
  1      1     0.33                        test	al, 3
- 1      1     1.00                        jne	.LBB5_1
- 1      1     0.33                        movabs	rax, 9223372036854775804
- 1      1     0.33                        and	rax, rsi
- 1      1     0.33                        cmp	rax, 9
- 1      1     1.00                        jae	.LBB5_3
+ 1      1     0.50                        setne	al
+ 1      1     0.33                        cmp	rsi, 12
+ 1      1     0.50                        setb	cl
+ 1      1     0.33                        or	cl, al
+ 1      1     1.00                        je	.LBB5_2
  1      0     0.25                        xor	eax, eax
  1      1     1.00                  U     ret
- 1      1     0.33                        add	rax, -9
+ 1      1     0.33                        mov	rax, rsi
+ 1      1     0.33                        or	rax, 3
+ 1      1     0.33                        add	rax, -12
  1      1     0.33                        movabs	rcx, -6148914691236517205
  2      4     1.00                        mul	rcx
  1      1     0.50                        shr	rdx
- 1      1     0.50                        lea	rcx, [rdx + 2*rdx]
- 1      1     0.33                        sub	rsi, rcx
- 1      1     0.33                        or	rcx, -4
- 1      1     0.33                        add	rsi, rdi
- 1      1     0.50                        lea	rdi, [rcx + rsi]
- 1      1     0.33                        add	rdi, -8
+ 1      1     0.33                        and	esi, 3
+ 1      1     0.50                        lea	rcx, [rdi + rsi]
  1      0     0.25                        xor	eax, eax
- 2      6     0.50    *                   cmp	word ptr [rcx + rsi - 8], -16192
- 2      2     0.67                        cmove	rax, rdi
+ 2      6     0.50    *                   cmp	word ptr [rdi + rsi], -16192
+ 2      2     0.67                        cmove	rax, rcx
  1      1     1.00                  U     ret
 
 
@@ -56,30 +54,28 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     7.70   7.58    -     7.72   0.50   0.50   
+ -      -     7.00   7.00    -     7.00   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.26   0.74    -      -      -      -     lea	eax, [rsi + rdi]
- -      -     0.19   0.28    -     0.53    -      -     test	al, 3
- -      -      -      -      -     1.00    -      -     jne	.LBB5_1
- -      -     0.93   0.06    -     0.01    -      -     movabs	rax, 9223372036854775804
- -      -     0.81   0.14    -     0.05    -      -     and	rax, rsi
- -      -     0.55   0.43    -     0.02    -      -     cmp	rax, 9
- -      -      -      -      -     1.00    -      -     jae	.LBB5_3
+ -      -     0.99   0.01    -      -      -      -     lea	eax, [rsi + rdi]
+ -      -     0.01   0.99    -      -      -      -     test	al, 3
+ -      -     0.98    -      -     0.02    -      -     setne	al
+ -      -     0.99    -      -     0.01    -      -     cmp	rsi, 12
+ -      -     0.02    -      -     0.98    -      -     setb	cl
+ -      -      -     0.03    -     0.97    -      -     or	cl, al
+ -      -      -      -      -     1.00    -      -     je	.LBB5_2
  -      -      -      -      -      -      -      -     xor	eax, eax
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.42   0.56    -     0.02    -      -     add	rax, -9
- -      -     0.67   0.30    -     0.03    -      -     movabs	rcx, -6148914691236517205
+ -      -      -     1.00    -      -      -      -     mov	rax, rsi
+ -      -     0.03   0.97    -      -      -      -     or	rax, 3
+ -      -      -     1.00    -      -      -      -     add	rax, -12
+ -      -     0.99    -      -     0.01    -      -     movabs	rcx, -6148914691236517205
  -      -     1.00   1.00    -      -      -      -     mul	rcx
- -      -     0.71    -      -     0.29    -      -     shr	rdx
- -      -     0.32   0.68    -      -      -      -     lea	rcx, [rdx + 2*rdx]
- -      -     0.57   0.04    -     0.39    -      -     sub	rsi, rcx
- -      -     0.28   0.67    -     0.05    -      -     or	rcx, -4
- -      -     0.29   0.29    -     0.42    -      -     add	rsi, rdi
- -      -     0.02   0.98    -      -      -      -     lea	rdi, [rcx + rsi]
- -      -     0.02   0.41    -     0.57    -      -     add	rdi, -8
+ -      -     0.01    -      -     0.99    -      -     shr	rdx
+ -      -     1.00    -      -      -      -      -     and	esi, 3
+ -      -     0.97   0.03    -      -      -      -     lea	rcx, [rdi + rsi]
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.57   0.01    -     0.42   0.50   0.50   cmp	word ptr [rcx + rsi - 8], -16192
- -      -     0.09   0.99    -     0.92    -      -     cmove	rax, rdi
+ -      -      -     0.97    -     0.03   0.50   0.50   cmp	word ptr [rdi + rsi], -16192
+ -      -     0.01   1.00    -     0.99    -      -     cmove	rax, rcx
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64 b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64
index c7530d8b6815..ca483dee63ba 100644
--- a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64
@@ -1,32 +1,23 @@
 bench_try_ref_from_suffix_with_elems_dynamic_padding:
 	movabs rax, 3074457345618258598
 	cmp rdx, rax
-	ja .LBB5_1
-	lea r8d, [rsi + rdi]
-	xor ecx, ecx
-	mov eax, 0
-	test r8b, 3
-	je .LBB5_3
-	mov rdx, rcx
-	ret
-.LBB5_3:
+	ja .LBB5_3
 	lea rax, [rdx + 2*rdx]
 	or rax, 3
 	add rax, 9
+	lea ecx, [rsi + rdi]
+	test cl, 3
+	setne cl
 	sub rsi, rax
-	jae .LBB5_4
-.LBB5_1:
+	setb al
+	or al, cl
+	je .LBB5_4
+.LBB5_3:
 	xor eax, eax
-	mov edx, 1
 	ret
 .LBB5_4:
-	lea r8, [rdi + rsi]
-	movzx esi, word ptr [rdi + rsi]
-	cmp si, -16192
-	mov ecx, 2
-	cmove rcx, rdx
+	lea rcx, [rdi + rsi]
 	xor eax, eax
-	cmp esi, 49344
-	cmove rax, r8
-	mov rdx, rcx
+	cmp word ptr [rdi + rsi], -16192
+	cmove rax, rcx
 	ret
diff --git a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64.mca b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
index be736c00c250..c37a42c160f7 100644
--- a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      2800
-Total Cycles:      878
-Total uOps:        3000
+Instructions:      2000
+Total Cycles:      643
+Total uOps:        2200
 
 Dispatch Width:    4
 uOps Per Cycle:    3.42
-IPC:               3.19
-Block RThroughput: 7.5
+IPC:               3.11
+Block RThroughput: 5.5
 
 
 Instruction Info:
@@ -20,31 +20,23 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        movabs	rax, 3074457345618258598
  1      1     0.33                        cmp	rdx, rax
- 1      1     1.00                        ja	.LBB5_1
- 1      1     0.50                        lea	r8d, [rsi + rdi]
- 1      0     0.25                        xor	ecx, ecx
- 1      1     0.33                        mov	eax, 0
- 1      1     0.33                        test	r8b, 3
- 1      1     1.00                        je	.LBB5_3
- 1      1     0.33                        mov	rdx, rcx
- 1      1     1.00                  U     ret
+ 1      1     1.00                        ja	.LBB5_3
  1      1     0.50                        lea	rax, [rdx + 2*rdx]
  1      1     0.33                        or	rax, 3
  1      1     0.33                        add	rax, 9
+ 1      1     0.50                        lea	ecx, [rsi + rdi]
+ 1      1     0.33                        test	cl, 3
+ 1      1     0.50                        setne	cl
  1      1     0.33                        sub	rsi, rax
- 1      1     1.00                        jae	.LBB5_4
+ 1      1     0.50                        setb	al
+ 1      1     0.33                        or	al, cl
+ 1      1     1.00                        je	.LBB5_4
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        mov	edx, 1
  1      1     1.00                  U     ret
- 1      1     0.50                        lea	r8, [rdi + rsi]
- 1      5     0.50    *                   movzx	esi, word ptr [rdi + rsi]
- 1      1     0.33                        cmp	si, -16192
- 1      1     0.33                        mov	ecx, 2
- 2      2     0.67                        cmove	rcx, rdx
+ 1      1     0.50                        lea	rcx, [rdi + rsi]
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        cmp	esi, 49344
- 2      2     0.67                        cmove	rax, r8
- 1      1     0.33                        mov	rdx, rcx
+ 2      6     0.50    *                   cmp	word ptr [rdi + rsi], -16192
+ 2      2     0.67                        cmove	rax, rcx
  1      1     1.00                  U     ret
 
 
@@ -61,35 +53,27 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     8.65   8.65    -     8.70   0.50   0.50   
+ -      -     6.32   6.33    -     6.35   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.67   0.30    -     0.03    -      -     movabs	rax, 3074457345618258598
- -      -     0.01   0.99    -      -      -      -     cmp	rdx, rax
- -      -      -      -      -     1.00    -      -     ja	.LBB5_1
- -      -     0.99   0.01    -      -      -      -     lea	r8d, [rsi + rdi]
- -      -      -      -      -      -      -      -     xor	ecx, ecx
- -      -     0.35   0.62    -     0.03    -      -     mov	eax, 0
- -      -     0.99   0.01    -      -      -      -     test	r8b, 3
- -      -      -      -      -     1.00    -      -     je	.LBB5_3
- -      -     0.68   0.30    -     0.02    -      -     mov	rdx, rcx
- -      -      -      -      -     1.00    -      -     ret
- -      -     0.07   0.93    -      -      -      -     lea	rax, [rdx + 2*rdx]
- -      -     0.06   0.35    -     0.59    -      -     or	rax, 3
- -      -     0.02   0.07    -     0.91    -      -     add	rax, 9
- -      -     0.01   0.04    -     0.95    -      -     sub	rsi, rax
- -      -      -      -      -     1.00    -      -     jae	.LBB5_4
+ -      -      -     0.99    -     0.01    -      -     movabs	rax, 3074457345618258598
+ -      -     0.02   0.98    -      -      -      -     cmp	rdx, rax
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -     0.66   0.34    -      -      -      -     lea	rax, [rdx + 2*rdx]
+ -      -     0.99    -      -     0.01    -      -     or	rax, 3
+ -      -     0.99   0.01    -      -      -      -     add	rax, 9
+ -      -     0.01   0.99    -      -      -      -     lea	ecx, [rsi + rdi]
+ -      -      -     0.99    -     0.01    -      -     test	cl, 3
+ -      -     0.02    -      -     0.98    -      -     setne	cl
+ -      -     0.97   0.02    -     0.01    -      -     sub	rsi, rax
+ -      -     0.99    -      -     0.01    -      -     setb	al
+ -      -     0.32   0.67    -     0.01    -      -     or	al, cl
+ -      -      -      -      -     1.00    -      -     je	.LBB5_4
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.92   0.01    -     0.07    -      -     mov	edx, 1
  -      -      -      -      -     1.00    -      -     ret
- -      -      -     1.00    -      -      -      -     lea	r8, [rdi + rsi]
- -      -      -      -      -      -     0.50   0.50   movzx	esi, word ptr [rdi + rsi]
- -      -     0.01   0.99    -      -      -      -     cmp	si, -16192
- -      -     0.88   0.04    -     0.08    -      -     mov	ecx, 2
- -      -     1.00   0.99    -     0.01    -      -     cmove	rcx, rdx
+ -      -      -     1.00    -      -      -      -     lea	rcx, [rdi + rsi]
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.99   0.01    -      -      -      -     cmp	esi, 49344
- -      -     1.00   1.00    -      -      -      -     cmove	rax, r8
- -      -      -     0.99    -     0.01    -      -     mov	rdx, rcx
+ -      -     0.35   0.32    -     0.33   0.50   0.50   cmp	word ptr [rdi + rsi], -16192
+ -      -     1.00   0.02    -     0.98    -      -     cmove	rax, rcx
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64 b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64
index 952eb12de8d6..748eb1166e13 100644
--- a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64
@@ -1,28 +1,20 @@
 bench_try_ref_from_suffix_with_elems_dynamic_size:
 	movabs rax, 4611686018427387901
 	cmp rdx, rax
-	ja .LBB5_1
-	lea r8d, [rsi + rdi]
-	xor ecx, ecx
-	mov eax, 0
-	test r8b, 1
-	jne .LBB5_5
+	ja .LBB5_3
 	lea rax, [2*rdx + 4]
+	lea ecx, [rsi + rdi]
 	sub rsi, rax
-	jae .LBB5_4
-.LBB5_1:
+	setb al
+	or al, cl
+	test al, 1
+	je .LBB5_4
+.LBB5_3:
 	xor eax, eax
-	mov edx, 1
 	ret
 .LBB5_4:
-	lea r8, [rdi + rsi]
-	movzx esi, word ptr [rdi + rsi]
-	cmp si, -16192
-	mov ecx, 2
-	cmove rcx, rdx
+	lea rcx, [rdi + rsi]
 	xor eax, eax
-	cmp esi, 49344
-	cmove rax, r8
-.LBB5_5:
-	mov rdx, rcx
+	cmp word ptr [rdi + rsi], -16192
+	cmove rax, rcx
 	ret
diff --git a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64.mca b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64.mca
index d4f78f67a252..53ff06192696 100644
--- a/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      2400
-Total Cycles:      1107
-Total uOps:        2600
+Instructions:      1700
+Total Cycles:      544
+Total uOps:        1900
 
 Dispatch Width:    4
-uOps Per Cycle:    2.35
-IPC:               2.17
-Block RThroughput: 6.5
+uOps Per Cycle:    3.49
+IPC:               3.13
+Block RThroughput: 4.8
 
 
 Instruction Info:
@@ -20,27 +20,20 @@ Instruction Info:
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
  1      1     0.33                        movabs	rax, 4611686018427387901
  1      1     0.33                        cmp	rdx, rax
- 1      1     1.00                        ja	.LBB5_1
- 1      1     0.50                        lea	r8d, [rsi + rdi]
- 1      0     0.25                        xor	ecx, ecx
- 1      1     0.33                        mov	eax, 0
- 1      1     0.33                        test	r8b, 1
- 1      1     1.00                        jne	.LBB5_5
+ 1      1     1.00                        ja	.LBB5_3
  1      1     0.50                        lea	rax, [2*rdx + 4]
+ 1      1     0.50                        lea	ecx, [rsi + rdi]
  1      1     0.33                        sub	rsi, rax
- 1      1     1.00                        jae	.LBB5_4
+ 1      1     0.50                        setb	al
+ 1      1     0.33                        or	al, cl
+ 1      1     0.33                        test	al, 1
+ 1      1     1.00                        je	.LBB5_4
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        mov	edx, 1
  1      1     1.00                  U     ret
- 1      1     0.50                        lea	r8, [rdi + rsi]
- 1      5     0.50    *                   movzx	esi, word ptr [rdi + rsi]
- 1      1     0.33                        cmp	si, -16192
- 1      1     0.33                        mov	ecx, 2
- 2      2     0.67                        cmove	rcx, rdx
+ 1      1     0.50                        lea	rcx, [rdi + rsi]
  1      0     0.25                        xor	eax, eax
- 1      1     0.33                        cmp	esi, 49344
- 2      2     0.67                        cmove	rax, r8
- 1      1     0.33                        mov	rdx, rcx
+ 2      6     0.50    *                   cmp	word ptr [rdi + rsi], -16192
+ 2      2     0.67                        cmove	rax, rcx
  1      1     1.00                  U     ret
 
 
@@ -57,31 +50,24 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     6.99   7.00    -     8.01   0.50   0.50   
+ -      -     5.33   5.33    -     5.34   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.02   0.95    -     0.03    -      -     movabs	rax, 4611686018427387901
- -      -     0.93   0.04    -     0.03    -      -     cmp	rdx, rax
- -      -      -      -      -     1.00    -      -     ja	.LBB5_1
- -      -     0.96   0.04    -      -      -      -     lea	r8d, [rsi + rdi]
- -      -      -      -      -      -      -      -     xor	ecx, ecx
- -      -     0.95   0.02    -     0.03    -      -     mov	eax, 0
- -      -     0.95   0.05    -      -      -      -     test	r8b, 1
- -      -      -      -      -     1.00    -      -     jne	.LBB5_5
- -      -     0.06   0.94    -      -      -      -     lea	rax, [2*rdx + 4]
- -      -     0.93   0.07    -      -      -      -     sub	rsi, rax
- -      -      -      -      -     1.00    -      -     jae	.LBB5_4
+ -      -     0.66   0.33    -     0.01    -      -     movabs	rax, 4611686018427387901
+ -      -     0.02   0.98    -      -      -      -     cmp	rdx, rax
+ -      -      -      -      -     1.00    -      -     ja	.LBB5_3
+ -      -     0.98   0.02    -      -      -      -     lea	rax, [2*rdx + 4]
+ -      -     0.66   0.34    -      -      -      -     lea	ecx, [rsi + rdi]
+ -      -     0.33   0.65    -     0.02    -      -     sub	rsi, rax
+ -      -     0.99    -      -     0.01    -      -     setb	al
+ -      -     0.01   0.36    -     0.63    -      -     or	al, cl
+ -      -     0.01   0.96    -     0.03    -      -     test	al, 1
+ -      -      -      -      -     1.00    -      -     je	.LBB5_4
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.03   0.95    -     0.02    -      -     mov	edx, 1
  -      -      -      -      -     1.00    -      -     ret
- -      -     0.97   0.03    -      -      -      -     lea	r8, [rdi + rsi]
- -      -      -      -      -      -     0.50   0.50   movzx	esi, word ptr [rdi + rsi]
- -      -     0.03   0.97    -      -      -      -     cmp	si, -16192
- -      -     0.05   0.94    -     0.01    -      -     mov	ecx, 2
- -      -     0.06   0.98    -     0.96    -      -     cmove	rcx, rdx
+ -      -     0.32   0.68    -      -      -      -     lea	rcx, [rdi + rsi]
  -      -      -      -      -      -      -      -     xor	eax, eax
- -      -     0.97   0.03    -      -      -      -     cmp	esi, 49344
- -      -     0.06   0.96    -     0.98    -      -     cmove	rax, r8
- -      -     0.02   0.03    -     0.95    -      -     mov	rdx, rcx
+ -      -     0.36   0.02    -     0.62   0.50   0.50   cmp	word ptr [rdi + rsi], -16192
+ -      -     0.99   0.99    -     0.02    -      -     cmove	rax, rcx
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/write_to_dynamic_size.x86-64 b/rust/zerocopy/benches/write_to_dynamic_size.x86-64
index c5abb17f7eba..714b68c51734 100644
--- a/rust/zerocopy/benches/write_to_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/write_to_dynamic_size.x86-64
@@ -3,8 +3,7 @@ bench_write_to_dynamic_size:
 	push rbx
 	push rax
 	mov rbx, rcx
-	lea r14, [2*rsi + 5]
-	and r14, -2
+	lea r14, [2*rsi + 4]
 	cmp rcx, r14
 	jne .LBB5_2
 	mov rax, rdi
diff --git a/rust/zerocopy/benches/write_to_dynamic_size.x86-64.mca b/rust/zerocopy/benches/write_to_dynamic_size.x86-64.mca
index 5b2c08a31a29..2cc0a58c70fc 100644
--- a/rust/zerocopy/benches/write_to_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/write_to_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1900
+Instructions:      1800
 Total Cycles:      2890
-Total uOps:        2500
+Total uOps:        2400
 
 Dispatch Width:    4
-uOps Per Cycle:    0.87
-IPC:               0.66
-Block RThroughput: 6.3
+uOps Per Cycle:    0.83
+IPC:               0.62
+Block RThroughput: 6.0
 
 
 Instruction Info:
@@ -22,8 +22,7 @@ Instruction Info:
  2      5     1.00           *            push	rbx
  2      5     1.00           *            push	rax
  1      1     0.33                        mov	rbx, rcx
- 1      1     0.50                        lea	r14, [2*rsi + 5]
- 1      1     0.33                        and	r14, -2
+ 1      1     0.50                        lea	r14, [2*rsi + 4]
  1      1     0.33                        cmp	rcx, r14
  1      1     1.00                        jne	.LBB5_2
  1      1     0.33                        mov	rax, rdi
@@ -52,25 +51,24 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     4.66   4.64   4.00   4.70   4.00   3.00   
+ -      -     4.47   4.01   4.00   4.52   4.00   3.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
  -      -      -      -     1.00    -      -     1.00   push	r14
  -      -      -      -     1.00    -     1.00    -     push	rbx
  -      -      -      -     1.00    -      -     1.00   push	rax
- -      -     0.02   0.97    -     0.01    -      -     mov	rbx, rcx
- -      -     0.97   0.03    -      -      -      -     lea	r14, [2*rsi + 5]
- -      -     0.63   0.35    -     0.02    -      -     and	r14, -2
- -      -     0.31   0.34    -     0.35    -      -     cmp	rcx, r14
+ -      -      -     0.99    -     0.01    -      -     mov	rbx, rcx
+ -      -     0.99   0.01    -      -      -      -     lea	r14, [2*rsi + 4]
+ -      -     0.02   0.95    -     0.03    -      -     cmp	rcx, r14
  -      -      -      -      -     1.00    -      -     jne	.LBB5_2
- -      -     0.33   0.33    -     0.34    -      -     mov	rax, rdi
- -      -     0.36   0.31    -     0.33    -      -     mov	rdi, rdx
- -      -     0.33   0.35    -     0.32    -      -     mov	rsi, rax
- -      -     0.35   0.63    -     0.02    -      -     mov	rdx, rbx
+ -      -     0.48   0.04    -     0.48    -      -     mov	rax, rdi
+ -      -     0.51   0.01    -     0.48    -      -     mov	rdi, rdx
+ -      -     0.01   0.98    -     0.01    -      -     mov	rsi, rax
+ -      -     0.98   0.02    -      -      -      -     mov	rdx, rbx
  -      -      -      -     1.00   1.00   2.00    -     call	qword ptr [rip + memcpy@GOTPCREL]
- -      -     0.65   0.35    -      -      -      -     cmp	rbx, r14
- -      -     0.69    -      -     0.31    -      -     sete	al
+ -      -     0.94   0.03    -     0.03    -      -     cmp	rbx, r14
+ -      -     0.52    -      -     0.48    -      -     sete	al
  -      -     0.02   0.98    -      -      -      -     add	rsp, 8
  -      -      -      -      -      -      -     1.00   pop	rbx
  -      -      -      -      -      -     1.00    -     pop	r14
diff --git a/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64 b/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64
index d7779c6c9178..63e5d5200962 100644
--- a/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64
@@ -3,8 +3,7 @@ bench_write_to_prefix_dynamic_size:
 	push rbx
 	push rax
 	mov rbx, rcx
-	lea r14, [2*rsi + 5]
-	and r14, -2
+	lea r14, [2*rsi + 4]
 	cmp r14, rcx
 	ja .LBB5_2
 	mov rax, rdi
diff --git a/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64.mca b/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64.mca
index 4cebe24d4f3b..e623ab3f302c 100644
--- a/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      1900
+Instructions:      1800
 Total Cycles:      2890
-Total uOps:        2600
+Total uOps:        2500
 
 Dispatch Width:    4
-uOps Per Cycle:    0.90
-IPC:               0.66
-Block RThroughput: 6.5
+uOps Per Cycle:    0.87
+IPC:               0.62
+Block RThroughput: 6.3
 
 
 Instruction Info:
@@ -22,8 +22,7 @@ Instruction Info:
  2      5     1.00           *            push	rbx
  2      5     1.00           *            push	rax
  1      1     0.33                        mov	rbx, rcx
- 1      1     0.50                        lea	r14, [2*rsi + 5]
- 1      1     0.33                        and	r14, -2
+ 1      1     0.50                        lea	r14, [2*rsi + 4]
  1      1     0.33                        cmp	r14, rcx
  1      1     1.00                        ja	.LBB5_2
  1      1     0.33                        mov	rax, rdi
@@ -52,26 +51,25 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     5.47   4.49   4.00   5.04   4.00   3.00   
+ -      -     4.09   4.00   4.00   5.91   4.00   3.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
  -      -      -      -     1.00    -      -     1.00   push	r14
  -      -      -      -     1.00    -     1.00    -     push	rbx
  -      -      -      -     1.00    -      -     1.00   push	rax
- -      -     0.48   0.51    -     0.01    -      -     mov	rbx, rcx
- -      -     0.51   0.49    -      -      -      -     lea	r14, [2*rsi + 5]
- -      -     0.48   0.05    -     0.47    -      -     and	r14, -2
- -      -     0.48   0.49    -     0.03    -      -     cmp	r14, rcx
+ -      -     0.02   0.97    -     0.01    -      -     mov	rbx, rcx
+ -      -     0.04   0.96    -      -      -      -     lea	r14, [2*rsi + 4]
+ -      -     0.02   0.04    -     0.94    -      -     cmp	r14, rcx
  -      -      -      -      -     1.00    -      -     ja	.LBB5_2
- -      -     0.04   0.47    -     0.49    -      -     mov	rax, rdi
- -      -     0.49   0.03    -     0.48    -      -     mov	rdi, rdx
- -      -     0.03   0.48    -     0.49    -      -     mov	rsi, rax
- -      -     0.48   0.51    -     0.01    -      -     mov	rdx, r14
+ -      -     0.96   0.01    -     0.03    -      -     mov	rax, rdi
+ -      -     0.03   0.93    -     0.04    -      -     mov	rdi, rdx
+ -      -     0.94   0.06    -      -      -      -     mov	rsi, rax
+ -      -     0.06   0.93    -     0.01    -      -     mov	rdx, r14
  -      -      -      -     1.00   1.00   2.00    -     call	qword ptr [rip + memcpy@GOTPCREL]
- -      -     0.51   0.49    -      -      -      -     cmp	r14, rbx
- -      -     1.94    -      -     0.06    -      -     setbe	al
- -      -     0.03   0.97    -      -      -      -     add	rsp, 8
+ -      -     0.93   0.05    -     0.02    -      -     cmp	r14, rbx
+ -      -     0.14    -      -     1.86    -      -     setbe	al
+ -      -     0.95   0.05    -      -      -      -     add	rsp, 8
  -      -      -      -      -      -      -     1.00   pop	rbx
  -      -      -      -      -      -     1.00    -     pop	r14
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64 b/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64
index 75f349562db6..d13a9bb3b83c 100644
--- a/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64
@@ -3,8 +3,7 @@ bench_write_to_suffix_dynamic_size:
 	push rbx
 	push rax
 	mov rbx, rcx
-	lea r14, [2*rsi + 5]
-	and r14, -2
+	lea r14, [2*rsi + 4]
 	sub rcx, r14
 	jb .LBB5_2
 	mov rax, rdi
diff --git a/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64.mca b/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64.mca
index 95cb9dfe2eb7..fb8fce317e0c 100644
--- a/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      2000
+Instructions:      1900
 Total Cycles:      2890
-Total uOps:        2600
+Total uOps:        2500
 
 Dispatch Width:    4
-uOps Per Cycle:    0.90
-IPC:               0.69
-Block RThroughput: 6.5
+uOps Per Cycle:    0.87
+IPC:               0.66
+Block RThroughput: 6.3
 
 
 Instruction Info:
@@ -22,8 +22,7 @@ Instruction Info:
  2      5     1.00           *            push	rbx
  2      5     1.00           *            push	rax
  1      1     0.33                        mov	rbx, rcx
- 1      1     0.50                        lea	r14, [2*rsi + 5]
- 1      1     0.33                        and	r14, -2
+ 1      1     0.50                        lea	r14, [2*rsi + 4]
  1      1     0.33                        sub	rcx, r14
  1      1     1.00                        jb	.LBB5_2
  1      1     0.33                        mov	rax, rdi
@@ -53,27 +52,26 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     4.98   4.98   4.00   5.04   4.00   3.00   
+ -      -     4.65   4.64   4.00   4.71   4.00   3.00   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
  -      -      -      -     1.00    -      -     1.00   push	r14
  -      -      -      -     1.00    -     1.00    -     push	rbx
  -      -      -      -     1.00    -      -     1.00   push	rax
- -      -     0.94   0.05    -     0.01    -      -     mov	rbx, rcx
- -      -     0.06   0.94    -      -      -      -     lea	r14, [2*rsi + 5]
- -      -     0.93   0.02    -     0.05    -      -     and	r14, -2
- -      -     0.05   0.94    -     0.01    -      -     sub	rcx, r14
+ -      -     0.02   0.97    -     0.01    -      -     mov	rbx, rcx
+ -      -     0.97   0.03    -      -      -      -     lea	r14, [2*rsi + 4]
+ -      -     0.64   0.35    -     0.01    -      -     sub	rcx, r14
  -      -      -      -      -     1.00    -      -     jb	.LBB5_2
- -      -     0.02   0.04    -     0.94    -      -     mov	rax, rdi
- -      -     0.03   0.97    -      -      -      -     add	rdx, rcx
- -      -     0.95   0.05    -      -      -      -     mov	rdi, rdx
- -      -     0.94   0.03    -     0.03    -      -     mov	rsi, rax
- -      -     0.01   0.03    -     0.96    -      -     mov	rdx, r14
+ -      -     0.35   0.31    -     0.34    -      -     mov	rax, rdi
+ -      -     0.32   0.68    -      -      -      -     add	rdx, rcx
+ -      -     0.32   0.34    -     0.34    -      -     mov	rdi, rdx
+ -      -     0.67   0.32    -     0.01    -      -     mov	rsi, rax
+ -      -     0.34   0.35    -     0.31    -      -     mov	rdx, r14
  -      -      -      -     1.00   1.00   2.00    -     call	qword ptr [rip + memcpy@GOTPCREL]
- -      -     0.05   0.94    -     0.01    -      -     cmp	rbx, r14
- -      -     0.97    -      -     0.03    -      -     setae	al
- -      -     0.03   0.97    -      -      -      -     add	rsp, 8
+ -      -     0.35   0.31    -     0.34    -      -     cmp	rbx, r14
+ -      -     0.65    -      -     0.35    -      -     setae	al
+ -      -     0.02   0.98    -      -      -      -     add	rsp, 8
  -      -      -      -      -      -      -     1.00   pop	rbx
  -      -      -      -      -      -     1.00    -     pop	r14
  -      -      -      -      -     1.00    -      -     ret
diff --git a/rust/zerocopy/benches/zero_dynamic_size.x86-64 b/rust/zerocopy/benches/zero_dynamic_size.x86-64
index 2b31ed644eaf..92e2748b1353 100644
--- a/rust/zerocopy/benches/zero_dynamic_size.x86-64
+++ b/rust/zerocopy/benches/zero_dynamic_size.x86-64
@@ -1,5 +1,4 @@
 bench_zero_dynamic_size:
-	lea rdx, [2*rsi + 5]
-	and rdx, -2
+	lea rdx, [2*rsi + 4]
 	xor esi, esi
 	jmp qword ptr [rip + memset@GOTPCREL]
diff --git a/rust/zerocopy/benches/zero_dynamic_size.x86-64.mca b/rust/zerocopy/benches/zero_dynamic_size.x86-64.mca
index 0b086a29b0ed..7dee3b1de141 100644
--- a/rust/zerocopy/benches/zero_dynamic_size.x86-64.mca
+++ b/rust/zerocopy/benches/zero_dynamic_size.x86-64.mca
@@ -1,12 +1,12 @@
 Iterations:        100
-Instructions:      400
-Total Cycles:      142
-Total uOps:        500
+Instructions:      300
+Total Cycles:      108
+Total uOps:        400
 
 Dispatch Width:    4
-uOps Per Cycle:    3.52
-IPC:               2.82
-Block RThroughput: 1.3
+uOps Per Cycle:    3.70
+IPC:               2.78
+Block RThroughput: 1.0
 
 
 Instruction Info:
@@ -18,8 +18,7 @@ Instruction Info:
 [6]: HasSideEffects (U)
 
 [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
- 1      1     0.50                        lea	rdx, [2*rsi + 5]
- 1      1     0.33                        and	rdx, -2
+ 1      1     0.50                        lea	rdx, [2*rsi + 4]
  1      0     0.25                        xor	esi, esi
  2      6     1.00    *                   jmp	qword ptr [rip + memset@GOTPCREL]
 
@@ -37,11 +36,10 @@ Resources:
 
 Resource pressure per iteration:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  
- -      -     0.99   1.00    -     1.01   0.50   0.50   
+ -      -     0.50   0.50    -     1.00   0.50   0.50   
 
 Resource pressure by instruction:
 [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
- -      -     0.99   0.01    -      -      -      -     lea	rdx, [2*rsi + 5]
- -      -      -     0.99    -     0.01    -      -     and	rdx, -2
+ -      -     0.50   0.50    -      -      -      -     lea	rdx, [2*rsi + 4]
  -      -      -      -      -      -      -      -     xor	esi, esi
  -      -      -      -      -     1.00   0.50   0.50   jmp	qword ptr [rip + memset@GOTPCREL]
diff --git a/rust/zerocopy/src/byte_slice.rs b/rust/zerocopy/src/byte_slice.rs
index b7f85098dbc4..26fcc088aecf 100644
--- a/rust/zerocopy/src/byte_slice.rs
+++ b/rust/zerocopy/src/byte_slice.rs
@@ -427,8 +427,12 @@ fn test_ref_mut_split_at_unchecked() {
         let borrow_mut = cell.borrow_mut();
         let slice_ref_mut: cell::RefMut<'_, [u8]> = cell::RefMut::map(borrow_mut, |a| &mut a[..]);
         // SAFETY: 2 is within bounds of [1, 2, 3, 4]
-        let (l, r) = unsafe { slice_ref_mut.split_at_unchecked(2) };
+        let (mut l, mut r) = unsafe { slice_ref_mut.split_at_unchecked(2) };
         assert_eq!(*l, [1, 2]);
         assert_eq!(*r, [3, 4]);
+        l[0] = 5;
+        r[0] = 6;
+        drop((l, r));
+        assert_eq!(*cell.borrow(), [5, 2, 6, 4]);
     }
 }
diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index c761d5728320..6189a6e7f77c 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -87,7 +87,7 @@
 pub trait ByteOrder:
     Copy + Clone + Debug + Display + Eq + PartialEq + Ord + PartialOrd + Hash + private::Sealed
 {
-    #[doc(hidden)]
+    /// A value-level representation of byte order.
     const ORDER: Order;
 }
 
@@ -98,11 +98,12 @@ impl Sealed for super::BigEndian {}
     impl Sealed for super::LittleEndian {}
 }
 
-#[allow(missing_copy_implementations, missing_debug_implementations)]
-#[doc(hidden)]
-#[derive(PartialEq)]
+/// A value-level representation of [`ByteOrder`].
+#[derive(Copy, Clone, Debug, Eq, PartialEq, Ord, PartialOrd, Hash)]
 pub enum Order {
+    /// A value-level representation of [`BigEndian`].
     BigEndian,
+    /// A value-level representation of [`LittleEndian`].
     LittleEndian,
 }
 
@@ -1235,7 +1236,7 @@ fn is_nan(self) -> bool { self.is_nan() }
     impl_traits!(I32, i32, signed);
     impl_traits!(I64, i64, signed);
     impl_traits!(I128, i128, signed);
-    impl_traits!(Isize, isize, unsigned);
+    impl_traits!(Isize, isize, signed);
     impl_traits!(F32, f32, signed, @float);
     impl_traits!(F64, f64, signed, @float);
 
@@ -1383,6 +1384,18 @@ fn test_non_native<T: ByteOrderType>() {
         call_for_all_types!(test_non_native, NonNativeEndian);
     }
 
+    #[test]
+    fn test_float_bit_patterns() {
+        for bits in [0u32, 0x8000_0000, 0x7F80_0000, 0xFF80_0000, 0x7FC0_1234] {
+            let be = F32::<BE>::new(f32::from_bits(bits));
+            let le = F32::<LE>::new(f32::from_bits(bits));
+            assert_eq!(be.to_bytes(), bits.to_be_bytes());
+            assert_eq!(le.to_bytes(), bits.to_le_bytes());
+            assert_eq!(be.get().to_bits(), bits);
+            assert_eq!(le.get().to_bits(), bits);
+        }
+    }
+
     #[test]
     fn test_ops_impls() {
         // Test implementations of traits in `core::ops`. Some of these are
@@ -1551,6 +1564,17 @@ fn t<T>()
 
         test!(@unary Not, not, call_for_signed_types, call_for_unsigned_types);
         test!(@unary Neg, neg, call_for_signed_types, call_for_float_types);
+
+        for shift in [0u64, 1, 31, 63] {
+            let n = 0x0123_4567_89AB_CDEFu64;
+            let shift_u32: u32 = shift.try_into().unwrap();
+            let shl = n.checked_shl(shift_u32).unwrap();
+            let shr = n.checked_shr(shift_u32).unwrap();
+            assert_eq!(core::ops::Shl::shl(U64::<NativeEndian>::new(n), shift).get(), shl);
+            assert_eq!(core::ops::Shr::shr(U64::<NativeEndian>::new(n), shift).get(), shr);
+            assert_eq!(core::ops::Shl::shl(U64::<NonNativeEndian>::new(n), shift).get(), shl);
+            assert_eq!(core::ops::Shr::shr(U64::<NonNativeEndian>::new(n), shift).get(), shr);
+        }
     }
 
     #[test]
@@ -1579,6 +1603,13 @@ fn test_byteorder_traits_coverage() {
         assert!(val_be <= val_be);
         assert_eq!(val_be.cmp(&val_be), core::cmp::Ordering::Equal);
 
+        let low = U16::<LE>::new(255);
+        let high = U16::<LE>::new(256);
+        assert!(low < high);
+        assert!(low < 256u16);
+        assert_eq!(low.cmp(&high), core::cmp::Ordering::Less);
+        assert!(I16::<LE>::new(-1) < I16::<LE>::new(0));
+
         // PartialOrd with native
         assert!(val_be == 1u16);
         assert!(val_be >= 1u16);
diff --git a/rust/zerocopy/src/error.rs b/rust/zerocopy/src/error.rs
index 5eb30de934f3..98399bab7e97 100644
--- a/rust/zerocopy/src/error.rs
+++ b/rust/zerocopy/src/error.rs
@@ -199,10 +199,8 @@ impl<Src, Dst: ?Sized + Unaligned, S, V> From<ConvertError<AlignmentError<Src, D
     #[inline]
     fn from(err: ConvertError<AlignmentError<Src, Dst>, S, V>) -> ConvertError<Infallible, S, V> {
         match err {
-            ConvertError::Alignment(e) => {
-                #[allow(unreachable_code)]
-                return ConvertError::Alignment(Infallible::from(e));
-            }
+            #[allow(unreachable_code)]
+            ConvertError::Alignment(e) => match Infallible::from(e) {},
             ConvertError::Size(e) => ConvertError::Size(e),
             ConvertError::Validity(e) => ConvertError::Validity(e),
         }
@@ -237,7 +235,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 #[cfg(any(not(no_zerocopy_core_error_1_81_0), feature = "std", test))]
-#[cfg_attr(doc_cfg, doc(cfg(all(rust = "1.81.0", feature = "std"))))]
+#[cfg_attr(doc_cfg, doc(cfg(any(rust = "1.81.0", feature = "std"))))]
 impl<A, S, V> Error for ConvertError<A, S, V>
 where
     A: fmt::Display + fmt::Debug,
@@ -410,7 +408,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 #[cfg(any(not(no_zerocopy_core_error_1_81_0), feature = "std", test))]
-#[cfg_attr(doc_cfg, doc(cfg(all(rust = "1.81.0", feature = "std"))))]
+#[cfg_attr(doc_cfg, doc(cfg(any(rust = "1.81.0", feature = "std"))))]
 impl<Src, Dst: ?Sized> Error for AlignmentError<Src, Dst>
 where
     Src: Deref,
@@ -571,7 +569,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 #[cfg(any(not(no_zerocopy_core_error_1_81_0), feature = "std", test))]
-#[cfg_attr(doc_cfg, doc(cfg(all(rust = "1.81.0", feature = "std"))))]
+#[cfg_attr(doc_cfg, doc(cfg(any(rust = "1.81.0", feature = "std"))))]
 impl<Src, Dst: ?Sized> Error for SizeError<Src, Dst>
 where
     Src: Deref,
@@ -707,7 +705,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 #[cfg(any(not(no_zerocopy_core_error_1_81_0), feature = "std", test))]
-#[cfg_attr(doc_cfg, doc(cfg(all(rust = "1.81.0", feature = "std"))))]
+#[cfg_attr(doc_cfg, doc(cfg(any(rust = "1.81.0", feature = "std"))))]
 impl<Src, Dst: ?Sized> Error for ValidityError<Src, Dst> where Dst: KnownLayout + TryFromBytes {}
 
 impl<Src, Dst: ?Sized + TryFromBytes, A, S> From<ValidityError<Src, Dst>>
diff --git a/rust/zerocopy/src/impls.rs b/rust/zerocopy/src/impls.rs
index 62e234c5202b..01b509b98264 100644
--- a/rust/zerocopy/src/impls.rs
+++ b/rust/zerocopy/src/impls.rs
@@ -111,7 +111,7 @@
 //   pattern 0x01.
 const _: () = unsafe {
     unsafe_impl!(=> TryFromBytes for bool; |byte| {
-        let byte = byte.transmute_with::<u8, invariant::Valid, CastSizedExact, BecauseImmutable>();
+        let byte = byte.transmute_with::<u8, invariant::Safe, CastSizedExact, BecauseImmutable>();
         *byte.unaligned_as_ref() < 2
     })
 };
@@ -140,7 +140,7 @@
 //   `char`.
 const _: () = unsafe {
     unsafe_impl!(=> TryFromBytes for char; |c| {
-        let c = c.transmute_with::<Unalign<u32>, invariant::Valid, CastSizedExact, BecauseImmutable>();
+        let c = c.transmute_with::<Unalign<u32>, invariant::Safe, CastSizedExact, BecauseImmutable>();
         let c = c.read().into_inner();
         char::from_u32(c).is_some()
     });
@@ -173,7 +173,7 @@
 //   Returns `Err` if the slice is not UTF-8.
 const _: () = unsafe {
     unsafe_impl!(=> TryFromBytes for str; |c| {
-        let c = c.transmute_with::<[u8], invariant::Valid, CastUnsized, BecauseImmutable>();
+        let c = c.transmute_with::<[u8], invariant::Safe, CastUnsized, BecauseImmutable>();
         let c = c.unaligned_as_ref();
         core::str::from_utf8(c).is_ok()
     })
@@ -183,7 +183,7 @@ macro_rules! unsafe_impl_try_from_bytes_for_nonzero {
     ($($nonzero:ident[$prim:ty]),*) => {
         $(
             unsafe_impl!(=> TryFromBytes for $nonzero; |n| {
-                let n = n.transmute_with::<Unalign<$prim>, invariant::Valid, CastSizedExact, BecauseImmutable>();
+                let n = n.transmute_with::<Unalign<$prim>, invariant::Safe, CastSizedExact, BecauseImmutable>();
                 $nonzero::new(n.read().into_inner()).is_some()
             });
         )*
@@ -421,15 +421,15 @@ macro_rules! unsafe_impl_transmute_from_for_atomic {
         ($($($tyvar:ident)? => $atomic:ty [$prim:ty]),*) => {{
             crate::util::macros::__unsafe();
 
-            use crate::pointer::{SizeEq, TransmuteFrom, invariant::Valid};
+            use crate::pointer::{SizeEq, TransmuteFrom, invariant::Safe};
 
             $(
                 // SAFETY: The caller promised that `$atomic` and `$prim` have
                 // the same size and bit validity.
-                unsafe impl<$($tyvar)?> TransmuteFrom<$atomic, Valid, Valid> for $prim {}
+                unsafe impl<$($tyvar)?> TransmuteFrom<$atomic, Safe, Safe> for $prim {}
                 // SAFETY: The caller promised that `$atomic` and `$prim` have
                 // the same size and bit validity.
-                unsafe impl<$($tyvar)?> TransmuteFrom<$prim, Valid, Valid> for $atomic {}
+                unsafe impl<$($tyvar)?> TransmuteFrom<$prim, Safe, Safe> for $atomic {}
 
                 impl<$($tyvar)?> SizeEq<ReadOnly<$atomic>> for ReadOnly<$prim> {
                     type CastFrom = $crate::pointer::cast::CastSizedExact;
@@ -444,9 +444,9 @@ impl<$($tyvar)?> SizeEq<ReadOnly<$atomic>> for ReadOnly<$prim> {
                 //   `UnsafeCell<T>` has the same in-memory representation as
                 //   its inner type `T`. A consequence of this guarantee is that
                 //   it is possible to convert between `T` and `UnsafeCell<T>`.
-                unsafe impl<$($tyvar)?> TransmuteFrom<$atomic, Valid, Valid> for core::cell::UnsafeCell<$prim> {}
+                unsafe impl<$($tyvar)?> TransmuteFrom<$atomic, Safe, Safe> for core::cell::UnsafeCell<$prim> {}
                 // SAFETY: See previous safety comment.
-                unsafe impl<$($tyvar)?> TransmuteFrom<core::cell::UnsafeCell<$prim>, Valid, Valid> for $atomic {}
+                unsafe impl<$($tyvar)?> TransmuteFrom<core::cell::UnsafeCell<$prim>, Safe, Safe> for $atomic {}
             )*
         }};
     }
@@ -758,7 +758,7 @@ mod atomic_ptr {
     pub enum value {}
 
     // SAFETY: See safety comment on `ProjectToTag`.
-    unsafe impl<T: ?Sized> HasTag for ManuallyDrop<T> {
+    unsafe impl<T: ?Sized, Client> HasTag<Client> for ManuallyDrop<T> {
         #[inline]
         fn only_derive_is_allowed_to_implement_this_trait()
         where
@@ -796,8 +796,8 @@ fn only_derive_is_allowed_to_implement_this_trait()
     // private field, and because it is the name it is referred to in the public
     // documentation of `ManuallyDrop::new`, `ManuallyDrop::into_inner`,
     // `ManuallyDrop::take` and `ManuallyDrop::drop`.
-    unsafe impl<T: ?Sized>
-        HasField<value, { crate::STRUCT_VARIANT_ID }, { crate::ident_id!(value) }>
+    unsafe impl<T: ?Sized, Client>
+        HasField<Client, value, { crate::STRUCT_VARIANT_ID }, { crate::ident_id!(value) }>
         for ManuallyDrop<T>
     {
         #[inline]
@@ -849,7 +849,7 @@ fn project(slf: PtrInner<'_, Self>) -> *mut T {
 const _: () = unsafe { unsafe_impl!(T: ?Sized + Unaligned => Unaligned for UnsafeCell<T>) };
 assert_unaligned!(UnsafeCell<()>, UnsafeCell<u8>);
 
-// SAFETY: See safety comment in `is_bit_valid` impl.
+// SAFETY: See safety comment in `is_safe` impl.
 unsafe impl<T: TryFromBytes + ?Sized> TryFromBytes for UnsafeCell<T> {
     #[allow(clippy::missing_inline_in_public_items)]
     fn only_derive_is_allowed_to_implement_this_trait()
@@ -859,11 +859,11 @@ fn only_derive_is_allowed_to_implement_this_trait()
     }
 
     #[inline(always)]
-    fn is_bit_valid<A>(candidate: Maybe<'_, Self, A>) -> bool
+    fn is_safe<A>(candidate: Maybe<'_, Self, A>) -> bool
     where
         A: invariant::Alignment,
     {
-        T::is_bit_valid(candidate.transmute::<_, _, BecauseImmutable>())
+        T::is_safe(candidate.transmute::<_, _, BecauseImmutable>())
     }
 }
 
@@ -897,10 +897,10 @@ fn is_bit_valid<A>(candidate: Maybe<'_, Self, A>) -> bool
         let c: Ptr<'_, ReadOnly<[T]>, _> = c.cast::<_, crate::pointer::cast::CastUnsized, _>();
 
         // Note that this call may panic, but it would still be sound even if it
-        // did. `is_bit_valid` does not promise that it will not panic (in fact,
-        // it explicitly warns that it's a possibility), and we have not
-        // violated any safety invariants that we must fix before returning.
-        <[T] as TryFromBytes>::is_bit_valid(c)
+        // did. `is_safe` does not promise that it will not panic (in fact, it
+        // explicitly warns that it's a possibility), and we have not violated
+        // any safety invariants that we must fix before returning.
+        <[T] as TryFromBytes>::is_safe(c)
     });
     unsafe_impl!(const N: usize, T: FromZeros => FromZeros for [T; N]);
     unsafe_impl!(const N: usize, T: FromBytes => FromBytes for [T; N]);
@@ -924,14 +924,14 @@ fn is_bit_valid<A>(candidate: Maybe<'_, Self, A>) -> bool
         //
         // In other words, the layout of a `[T] is a sequence of `T`s laid out
         // back-to-back with no bytes in between. If all elements in `candidate`
-        // are `is_bit_valid`, so too is `candidate`.
+        // are `is_safe`, so too is `candidate`.
         //
         // Note that any of the below calls may panic, but it would still be
-        // sound even if it did. `is_bit_valid` does not promise that it will
-        // not panic (in fact, it explicitly warns that it's a possibility), and
-        // we have not violated any safety invariants that we must fix before
+        // sound even if it did. `is_safe` does not promise that it will not
+        // panic (in fact, it explicitly warns that it's a possibility), and we
+        // have not violated any safety invariants that we must fix before
         // returning.
-        c.iter().all(<T as TryFromBytes>::is_bit_valid)
+        c.iter().all(<T as TryFromBytes>::is_safe)
     });
     unsafe_impl!(T: FromZeros => FromZeros for [T]);
     unsafe_impl!(T: FromBytes => FromBytes for [T]);
@@ -946,7 +946,7 @@ fn is_bit_valid<A>(candidate: Maybe<'_, Self, A>) -> bool
 //   null pointers, so this is not a footgun.
 // - `TryFromBytes`: By the same reasoning as for `FromZeroes`, we can implement
 //   `TryFromBytes` for thin pointers provided that
-//   [`TryFromByte::is_bit_valid`] only produces `true` for zeroed bytes.
+//   [`TryFromBytes::is_safe`] only produces `true` for zeroed bytes.
 //
 // NOTE(#170): Implementing `FromBytes` and `IntoBytes` for raw pointers would
 // be sound, but carries provenance footguns. We want to support `FromBytes` and
@@ -1012,11 +1012,11 @@ macro_rules! impl_tuple {
             // SAFETY: If all fields of the tuple `Self` are `Immutable`, so too is `Self`.
             unsafe_impl!($($head_T: Immutable,)* $next_T: Immutable => Immutable for ($($head_T,)* $next_T,));
 
-            // SAFETY: If all fields in `c` are `is_bit_valid`, so too is `c`.
+            // SAFETY: If all fields in `c` are `is_safe`, so too is `c`.
             unsafe_impl!($($head_T: TryFromBytes,)* $next_T: TryFromBytes => TryFromBytes for ($($head_T,)* $next_T,); |c| {
                 let mut c = c;
-                $(TryFromBytes::is_bit_valid(into_inner!(c.reborrow().project::<_, { crate::STRUCT_VARIANT_ID }, { crate::ident_id!($head_I) }>())) &&)*
-                    TryFromBytes::is_bit_valid(into_inner!(c.reborrow().project::<_, { crate::STRUCT_VARIANT_ID }, { crate::ident_id!($next_I) }>()))
+                $(TryFromBytes::is_safe(into_inner!(c.reborrow().project::<crate::project_clients::TryFromBytesDerive, _, { crate::STRUCT_VARIANT_ID }, { crate::ident_id!($head_I) }>())) &&)*
+                    TryFromBytes::is_safe(into_inner!(c.reborrow().project::<crate::project_clients::TryFromBytesDerive, _, { crate::STRUCT_VARIANT_ID }, { crate::ident_id!($next_I) }>()))
             });
 
             // SAFETY: If all fields in `Self` are `FromZeros`, so too is `Self`.
@@ -1026,7 +1026,9 @@ macro_rules! impl_tuple {
             unsafe_impl!($($head_T: FromBytes,)* $next_T: FromBytes => FromBytes for ($($head_T,)* $next_T,));
 
             // SAFETY: See safety comment on `ProjectToTag`.
-            unsafe impl<$($head_T,)* $next_T> crate::HasTag for ($($head_T,)* $next_T,) {
+            unsafe impl<Client, $($head_T,)* $next_T> crate::HasTag<Client>
+                for ($($head_T,)* $next_T,)
+            {
                 #[inline]
                 fn only_derive_is_allowed_to_implement_this_trait()
                 where
@@ -1077,7 +1079,8 @@ fn only_derive_is_allowed_to_implement_this_trait()
             // - `()` has the same visibility as the `.$CurrI` field (ie, `.0`,
             //   `.1`, etc)
             // - `Type` has the same type as `$CurrI`; i.e., `$CurrT`.
-            unsafe impl<$($AllT),+> crate::HasField<
+            unsafe impl<Client, $($AllT),+> crate::HasField<
+                Client,
                 (),
                 { crate::STRUCT_VARIANT_ID },
                 { crate::ident_id!($CurrI)}
@@ -1103,7 +1106,8 @@ fn project(slf: crate::PtrInner<'_, Self>) -> *mut Self::Type {
             }
 
             // SAFETY: See comments on items.
-            unsafe impl<Aliasing, Alignment, $($AllT),+> crate::ProjectField<
+            unsafe impl<Client, Aliasing, Alignment, $($AllT),+> crate::ProjectField<
+                Client,
                 (),
                 (Aliasing, Alignment, crate::invariant::Uninit),
                 { crate::STRUCT_VARIANT_ID },
@@ -1129,7 +1133,8 @@ fn only_derive_is_allowed_to_implement_this_trait()
             }
 
             // SAFETY: See comments on items.
-            unsafe impl<Aliasing, Alignment, $($AllT),+> crate::ProjectField<
+            unsafe impl<Client, Aliasing, Alignment, $($AllT),+> crate::ProjectField<
+                Client,
                 (),
                 (Aliasing, Alignment, crate::invariant::Initialized),
                 { crate::STRUCT_VARIANT_ID },
@@ -1155,9 +1160,10 @@ fn only_derive_is_allowed_to_implement_this_trait()
             }
 
             // SAFETY: See comments on items.
-            unsafe impl<Aliasing, Alignment, $($AllT),+> crate::ProjectField<
+            unsafe impl<Client, Aliasing, Alignment, $($AllT),+> crate::ProjectField<
+                Client,
                 (),
-                (Aliasing, Alignment, crate::invariant::Valid),
+                (Aliasing, Alignment, crate::invariant::Safe),
                 { crate::STRUCT_VARIANT_ID },
                 { crate::ident_id!($CurrI)}
             > for ($($AllT,)+)
@@ -1174,7 +1180,7 @@ fn only_derive_is_allowed_to_implement_this_trait()
                 // SAFETY: Tuples are product types whose fields are
                 // well-aligned, so projection preserves both the alignment and
                 // validity invariants of the outer pointer.
-                type Invariants = (Aliasing, Alignment, crate::invariant::Valid);
+                type Invariants = (Aliasing, Alignment, crate::invariant::Safe);
 
                 // SAFETY: Tuples are product types and so projection is infallible;
                 type Error = core::convert::Infallible;
@@ -1389,10 +1395,9 @@ mod tests {
 
     #[test]
     fn test_impls() {
-        // A type that can supply test cases for testing
-        // `TryFromBytes::is_bit_valid`. All types passed to `assert_impls!`
-        // must implement this trait; that macro uses it to generate runtime
-        // tests for `TryFromBytes` impls.
+        // A type that can supply test cases for testing `TryFromBytes::is_safe`.
+        // All types passed to `assert_impls!` must implement this trait; that
+        // macro uses it to generate runtime tests for `TryFromBytes` impls.
         //
         // All `T: FromBytes` types are provided with a blanket impl. Other
         // types must implement `TryFromBytesTestable` directly (ie using
@@ -1574,19 +1579,15 @@ mod autoref_trick {
 
             pub(super) struct AutorefWrapper<T: ?Sized>(pub(super) PhantomData<T>);
 
-            pub(super) trait TestIsBitValidShared<T: ?Sized> {
+            pub(super) trait TestIsSafeShared<T: ?Sized> {
                 #[allow(clippy::needless_lifetimes)]
-                fn test_is_bit_valid_shared<'ptr>(&self, candidate: Maybe<'ptr, T>)
-                    -> Option<bool>;
+                fn test_is_safe_shared<'ptr>(&self, candidate: Maybe<'ptr, T>) -> Option<bool>;
             }
 
-            impl<T: TryFromBytes + Immutable + ?Sized> TestIsBitValidShared<T> for AutorefWrapper<T> {
+            impl<T: TryFromBytes + Immutable + ?Sized> TestIsSafeShared<T> for AutorefWrapper<T> {
                 #[allow(clippy::needless_lifetimes)]
-                fn test_is_bit_valid_shared<'ptr>(
-                    &self,
-                    candidate: Maybe<'ptr, T>,
-                ) -> Option<bool> {
-                    Some(T::is_bit_valid(candidate))
+                fn test_is_safe_shared<'ptr>(&self, candidate: Maybe<'ptr, T>) -> Option<bool> {
+                    Some(T::is_safe(candidate))
                 }
             }
 
@@ -1690,12 +1691,12 @@ macro_rules! assert_impls {
                 #[allow(unused, non_local_definitions)]
                 impl AutorefWrapper<$ty> {
                     #[allow(clippy::needless_lifetimes)]
-                    fn test_is_bit_valid_shared<'ptr>(
+                    fn test_is_safe_shared<'ptr>(
                         &mut self,
                         candidate: Maybe<'ptr, $ty>,
                     ) -> Option<bool> {
                         assert_on_allowlist!(
-                            test_is_bit_valid_shared($ty):
+                            test_is_safe_shared($ty):
                             ManuallyDrop<UnsafeCell<()>>,
                             ManuallyDrop<[UnsafeCell<u8>]>,
                             ManuallyDrop<[UnsafeCell<bool>]>,
@@ -1799,9 +1800,9 @@ fn test_as_bytes(&mut self, _t: &ReadOnly<$ty>) -> Option<&[u8]> {
                     // necessarily `IntoBytes`, but that's the corner we've
                     // backed ourselves into by using `Ptr::from_ref`.
                     let c = unsafe { c.assume_initialized() };
-                    let res = w.test_is_bit_valid_shared(c);
+                    let res = w.test_is_safe_shared(c);
                     if let Some(res) = res {
-                        assert!(res, "{}::is_bit_valid (shared `Ptr`): got false, expected true", stringify!($ty));
+                        assert!(res, "{}::is_safe (shared `Ptr`): got false, expected true", stringify!($ty));
                     }
 
                     let c = Ptr::from_mut(&mut *val);
@@ -1810,8 +1811,8 @@ fn test_as_bytes(&mut self, _t: &ReadOnly<$ty>) -> Option<&[u8]> {
                     // necessarily `IntoBytes`, but that's the corner we've
                     // backed ourselves into by using `Ptr::from_ref`.
                     let mut c = unsafe { c.assume_initialized() };
-                    let res = <$ty as TryFromBytes>::is_bit_valid(c.reborrow_shared());
-                    assert!(res, "{}::is_bit_valid (exclusive `Ptr`): got false, expected true", stringify!($ty));
+                    let res = <$ty as TryFromBytes>::is_safe(c.reborrow_shared());
+                    assert!(res, "{}::is_safe (exclusive `Ptr`): got false, expected true", stringify!($ty));
 
                     // `bytes` is `Some(val.as_bytes())` if `$ty: IntoBytes +
                     // Immutable` and `None` otherwise.
@@ -2237,11 +2238,11 @@ fn test_as_bytes(&mut self, _t: &ReadOnly<$ty>) -> Option<&[u8]> {
 
         assert_impls!(ManuallyDrop<u8>: KnownLayout, Immutable, TryFromBytes, FromZeros, FromBytes, IntoBytes, Unaligned);
         // This test is important because it allows us to test our hand-rolled
-        // implementation of `<ManuallyDrop<T> as TryFromBytes>::is_bit_valid`.
+        // implementation of `<ManuallyDrop<T> as TryFromBytes>::is_safe`.
         assert_impls!(ManuallyDrop<bool>: KnownLayout, Immutable, TryFromBytes, FromZeros, IntoBytes, Unaligned, !FromBytes);
         assert_impls!(ManuallyDrop<[u8]>: KnownLayout, Immutable, TryFromBytes, FromZeros, FromBytes, IntoBytes, Unaligned);
         // This test is important because it allows us to test our hand-rolled
-        // implementation of `<ManuallyDrop<T> as TryFromBytes>::is_bit_valid`.
+        // implementation of `<ManuallyDrop<T> as TryFromBytes>::is_safe`.
         assert_impls!(ManuallyDrop<[bool]>: KnownLayout, Immutable, TryFromBytes, FromZeros, IntoBytes, Unaligned, !FromBytes);
         assert_impls!(ManuallyDrop<NotZerocopy>: !Immutable, !TryFromBytes, !KnownLayout, !FromZeros, !FromBytes, !IntoBytes, !Unaligned);
         assert_impls!(ManuallyDrop<[NotZerocopy]>: KnownLayout, !Immutable, !TryFromBytes, !FromZeros, !FromBytes, !IntoBytes, !Unaligned);
@@ -2255,14 +2256,14 @@ fn test_as_bytes(&mut self, _t: &ReadOnly<$ty>) -> Option<&[u8]> {
 
         assert_impls!(Wrapping<u8>: KnownLayout, Immutable, TryFromBytes, FromZeros, FromBytes, IntoBytes, Unaligned);
         // This test is important because it allows us to test our hand-rolled
-        // implementation of `<Wrapping<T> as TryFromBytes>::is_bit_valid`.
+        // implementation of `<Wrapping<T> as TryFromBytes>::is_safe`.
         assert_impls!(Wrapping<bool>: KnownLayout, Immutable, TryFromBytes, FromZeros, IntoBytes, Unaligned, !FromBytes);
         assert_impls!(Wrapping<NotZerocopy>: KnownLayout, !Immutable, !TryFromBytes, !FromZeros, !FromBytes, !IntoBytes, !Unaligned);
         assert_impls!(Wrapping<UnsafeCell<()>>: KnownLayout, TryFromBytes, FromZeros, FromBytes, IntoBytes, Unaligned, !Immutable);
 
         assert_impls!(Unalign<u8>: KnownLayout, Immutable, TryFromBytes, FromZeros, FromBytes, IntoBytes, Unaligned);
         // This test is important because it allows us to test our hand-rolled
-        // implementation of `<Unalign<T> as TryFromBytes>::is_bit_valid`.
+        // implementation of `<Unalign<T> as TryFromBytes>::is_safe`.
         assert_impls!(Unalign<bool>: KnownLayout, Immutable, TryFromBytes, FromZeros, IntoBytes, Unaligned, !FromBytes);
         assert_impls!(Unalign<NotZerocopy>: KnownLayout, Unaligned, !Immutable, !TryFromBytes, !FromZeros, !FromBytes, !IntoBytes);
 
diff --git a/rust/zerocopy/src/layout.rs b/rust/zerocopy/src/layout.rs
index b1fa0cd436db..5d5598cd0cfb 100644
--- a/rust/zerocopy/src/layout.rs
+++ b/rust/zerocopy/src/layout.rs
@@ -30,6 +30,7 @@
 #[allow(missing_debug_implementations, missing_copy_implementations)]
 #[cfg_attr(any(kani, test), derive(Debug, PartialEq, Eq))]
 #[derive(Copy, Clone)]
+#[cfg_attr(kani, derive(kani::Arbitrary))]
 pub struct DstLayout {
     pub(crate) align: NonZeroUsize,
     pub(crate) size_info: SizeInfo,
@@ -42,29 +43,680 @@ pub struct DstLayout {
 
 #[cfg_attr(any(kani, test), derive(Debug, PartialEq, Eq))]
 #[derive(Copy, Clone)]
+#[cfg_attr(kani, derive(kani::Arbitrary))]
 pub(crate) enum SizeInfo<E = usize> {
     Sized { size: usize },
     SliceDst(TrailingSliceLayout<E>),
 }
 
+/// The alignment and phase of a rounded size calculation.
+///
+/// If `encoded` is the stored non-zero integer, then its highest set bit is a
+/// power-of-two alignment `align`, and its remaining lower bits are a `phase`
+/// in `0..align`. Thus every non-zero bit pattern is a valid encoding, and:
+///
+/// ```text
+/// encoded = align + phase
+/// ```
+#[cfg_attr(any(kani, test), derive(Debug, PartialEq, Eq))]
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+#[cfg_attr(kani, derive(kani::Arbitrary))]
+pub(crate) struct RoundingAlignAndPhase(NonZeroUsize);
+
+impl RoundingAlignAndPhase {
+    /// Encodes `align` and `phase`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `align` is not a power of two and `phase` is not less than
+    /// `align`.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::requires(align.is_power_of_two() && phase < align.get()))]
+    #[cfg_attr(kani, kani::ensures(|result| result.0.get() == align.get() + phase))]
+    pub(crate) const fn new(align: NonZeroUsize, phase: usize) -> Self {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(RoundingAlignAndPhase::new)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            RoundingAlignAndPhase::new(kani::any(), kani::any());
+        }
+
+        const_assert!(align.get().is_power_of_two());
+        const_assert!(phase < align.get());
+
+        // Since `align` is a power of two and `phase < align`, their set bits
+        // are disjoint. The result is therefore non-zero and losslessly stores
+        // both components.
+        let encoded = align.get() | phase;
+        match NonZeroUsize::new(encoded) {
+            Some(encoded) => Self(encoded),
+            None => const_unreachable!(),
+        }
+    }
+
+    /// Decodes the alignment and phase.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&(align, phase)| {
+        align.is_power_of_two() && phase < align.get()
+            && align.get().checked_add(phase) == Some(self.0.get())
+    }))]
+    pub(crate) const fn components(self) -> (NonZeroUsize, usize) {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(RoundingAlignAndPhase::components)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<RoundingAlignAndPhase>().components();
+        }
+        // `leading_zeros <= POINTER_WIDTH_BITS - 1` because the encoded value
+        // is non-zero. Converting `leading_zeros` to `usize` cannot truncate
+        // because it is at most the number of bits in a `usize`.
+        #[allow(
+            clippy::arithmetic_side_effects,
+            clippy::as_conversions,
+            clippy::needless_nonzero_get
+        )]
+        let shift = (POINTER_WIDTH_BITS - 1) - (self.0.get().leading_zeros() as usize);
+        #[allow(clippy::arithmetic_side_effects)]
+        let align = 1usize << shift;
+        let align = match NonZeroUsize::new(align) {
+            Some(align) => align,
+            None => const_unreachable!(),
+        };
+        // `align` is the highest set bit, so XOR removes exactly that bit and
+        // leaves a value in `0..align`.
+        let phase = self.0.get() ^ align.get();
+        (align, phase)
+    }
+
+    /// Decodes the alignment, which is the highest set bit of `self`.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|align| {
+        align.is_power_of_two() && align.get() <= self.0.get()
+            && self.0.get() - align.get() < align.get()
+    }))]
+    pub(crate) const fn align(self) -> NonZeroUsize {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(RoundingAlignAndPhase::align)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<RoundingAlignAndPhase>().align();
+        }
+
+        self.components().0
+    }
+}
+
 #[cfg_attr(any(kani, test), derive(Debug, PartialEq, Eq))]
 #[derive(Copy, Clone)]
+#[cfg_attr(kani, derive(kani::Arbitrary))]
 pub(crate) struct TrailingSliceLayout<E = usize> {
-    // The offset of the first byte of the trailing slice field. Note that this
-    // is NOT the same as the minimum size of the type. For example, consider
-    // the following type:
-    //
-    //   struct Foo {
-    //       a: u16,
-    //       b: u8,
-    //       c: [u8],
-    //   }
-    //
-    // In `Foo`, `c` is at byte offset 3. When `c.len() == 0`, `c` is followed
-    // by a padding byte.
+    /// The offset of the first byte of the trailing slice field. Note that this
+    /// is NOT the same as the minimum size of the type. For example, consider
+    /// the following type:
+    ///
+    /// ```ignore
+    /// #[repr(C, align(2))]
+    /// struct Foo {
+    ///     header: u16,
+    ///     tag: u8,
+    ///     tail: [u8],
+    /// }
+    /// ```
+    ///
+    /// In `Foo`, `tail` is at byte offset 3. When `tail.len() == 0`, `tail` is
+    /// followed by a padding byte.
     pub(crate) offset: usize,
-    // The size of the element type of the trailing slice field.
+    /// The size of the element type of the trailing slice field.
     pub(crate) elem_size: E,
+    /// The trailing slice's byte offset plus fixed trailing padding, minus the
+    /// rounding phase.
+    ///
+    /// Fixed trailing padding excludes padding added by the final alignment
+    /// rounding. The rounding alignment and phase are stored in
+    /// `size_rounding_align_and_phase`. This value is independent of the slice
+    /// length and can be smaller than, equal to, or larger than `offset`.
+    ///
+    /// For a completed layout, this value is a multiple of `DstLayout::align`.
+    /// The minimum object size equals this value when the phase is zero;
+    /// otherwise, it exceeds this value by one rounding-alignment unit.
+    pub(crate) size_base: usize,
+    /// The alignment and byte phase of the rounding applied to the trailing
+    /// slice's contribution to object size.
+    ///
+    /// The alignment `size_align` is a nonzero power of two. The phase
+    /// `size_phase` is the fixed byte contribution inside that rounding, in
+    /// `0..size_align`. Both are independent of the trailing slice's length.
+    /// For `elems` trailing elements, the enclosing object's size is:
+    ///
+    /// ```text
+    /// size_base + round_up(size_phase + elems * elem_size, size_align)
+    /// ```
+    ///
+    /// For a completed layout, `size_align` is at least `DstLayout::align`.
+    /// Packing can reduce the enclosing type's alignment and the alignment
+    /// used to place its trailing field without removing padding required by
+    /// a nested DST's own layout. For example, a `repr(packed(2))` wrapper
+    /// around a DST with alignment 4 can have an object alignment of 2 and a
+    /// rounding alignment of 4.
+    ///
+    /// The rounding parameters account for padding preserved within nested
+    /// fields. Their rounding origin can differ from the physical start of
+    /// the trailing slice, so the phase need not equal `offset % size_align`.
+    pub(crate) size_rounding_align_and_phase: RoundingAlignAndPhase,
+}
+
+impl<E> TrailingSliceLayout<E> {
+    /// Produces `self.size_base` rounded down to a multiple of `size_align`,
+    /// plus `size_phase`, where both components come from
+    /// `self.size_rounding_align_and_phase`.
+    ///
+    /// This value need not equal `self.offset`, the trailing slice's byte
+    /// offset.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&offset| {
+        let (align, phase) = self.size_rounding_align_and_phase.components();
+        offset == util::round_down_to_next_multiple_of_alignment(self.size_base, align) + phase
+    }))]
+    const fn size_offset(&self) -> usize {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::<usize>::size_offset)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<TrailingSliceLayout>().size_offset();
+        }
+
+        let (size_align, size_phase) = self.size_rounding_align_and_phase.components();
+        let aligned_base =
+            util::round_down_to_next_multiple_of_alignment(self.size_base, size_align);
+        // The aligned base and phase have disjoint set bits.
+        aligned_base | size_phase
+    }
+
+    /// Produces the largest trailing-slice byte capacity whose complete, padded
+    /// object fits in `available_bytes`, or `None` if the object does not fit
+    /// even with an empty trailing slice.
+    ///
+    /// This capacity is independent of `elem_size`: it need not represent a
+    /// whole number of elements, even for a valid Rust layout. For example, a
+    /// slice of `[u8; 3]` elements has three-byte elements and alignment 1.
+    /// With `available_bytes = 4`, this method produces `Some(4)`, although
+    /// only one whole element, occupying three bytes, fits.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&result| {
+        let (align, phase) = self.size_rounding_align_and_phase.components();
+        result == available_bytes.checked_sub(self.size_base)
+            .map(|bytes| util::round_down_to_next_multiple_of_alignment(bytes, align))
+            .and_then(|rounded| rounded.checked_sub(phase))
+    }))]
+    const fn max_trailing_bytes(&self, available_bytes: usize) -> Option<usize> {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::<usize>::max_trailing_bytes)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<TrailingSliceLayout>().max_trailing_bytes(kani::any());
+        }
+
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::<NonZeroUsize>::max_trailing_bytes)]
+        #[kani::solver(kissat)]
+        fn proof_nonzero() {
+            kani::any::<TrailingSliceLayout<NonZeroUsize>>().max_trailing_bytes(kani::any());
+        }
+
+        let (size_align, size_phase) = self.size_rounding_align_and_phase.components();
+
+        // Interpret the normalized size formula over the nonnegative integers:
+        //
+        //   object_size(trailing_bytes)
+        //       = self.size_base
+        //           + round_up(size_phase + trailing_bytes, size_align).
+        //
+        // We seek the largest byte count with
+        // `object_size(trailing_bytes) <= available_bytes`.
+        //
+        // At zero trailing bytes, the input to rounding is just `size_phase`.
+        // Since `0 <= size_phase < size_align`, the least alignment multiple at
+        // or above it is zero for a zero phase, and `size_align` otherwise.
+        // Thus `rounded_phase = round_up(size_phase, size_align)` is exactly
+        // the rounded contribution of an empty tail.
+        let rounded_phase = if size_phase == 0 { 0 } else { size_align.get() };
+
+        // Adding the fixed base gives `minimum_size = object_size(0)`. The size
+        // formula is nondecreasing in the trailing byte count, so this is the
+        // minimum object size. If this sum exceeds `usize::MAX`, it also
+        // exceeds `available_bytes`, and no tail can fit.
+        let minimum_size = match self.size_base.checked_add(rounded_phase) {
+            Some(size) => size,
+            None => return None,
+        };
+
+        // Subtracting the minimum size gives the budget for increasing the
+        // rounded contribution. Failure means even the minimum size exceeds the
+        // available space. Success establishes `minimum_size + extra_bytes =
+        // available_bytes`.
+        let extra_bytes = match available_bytes.checked_sub(minimum_size) {
+            Some(bytes) => bytes,
+            None => return None,
+        };
+
+        // The rounded contribution can increase only by multiples of
+        // `size_align`. Its largest permitted increase is therefore
+        // `aligned_bytes = round_down(extra_bytes, size_align)`, with:
+        //
+        //   aligned_bytes <= extra_bytes < aligned_bytes + size_align.
+        //
+        // Hence `rounded_phase + aligned_bytes` is the largest alignment
+        // multiple that fits after the base: adding the base gives at most
+        // `minimum_size + extra_bytes = available_bytes`, while the next
+        // alignment multiple would exceed that budget.
+        let aligned_bytes = util::round_down_to_next_multiple_of_alignment(extra_bytes, size_align);
+
+        // Rounding an empty tail adds `rounded_phase - size_phase` bytes. This
+        // is `initial_padding`: the tail can use these bytes without increasing
+        // the rounded contribution. The two cases for `rounded_phase` give `0
+        // <= initial_padding < size_align`, so the subtraction is
+        // representable.
+        #[allow(clippy::arithmetic_side_effects)]
+        let initial_padding = rounded_phase - size_phase;
+
+        // For any nonnegative candidate byte count, the aligned limit above
+        // gives the following equivalences:
+        //
+        //   object_size(candidate_bytes) <= available_bytes
+        //       iff round_up(size_phase + candidate_bytes, size_align)
+        //           <= rounded_phase + aligned_bytes
+        //       iff size_phase + candidate_bytes
+        //           <= rounded_phase + aligned_bytes
+        //       iff candidate_bytes <= aligned_bytes + initial_padding.
+        //
+        // Removing `round_up` is valid because its upper bound is an alignment
+        // multiple. Thus `aligned_bytes + initial_padding` is exactly the
+        // largest tail that fits. Since `aligned_bytes` is a multiple of the
+        // power-of-two `size_align` and `initial_padding < size_align`, their
+        // set bits are disjoint. Bitwise OR therefore equals their sum, with no
+        // carry or overflow.
+        let trailing_bytes = aligned_bytes | initial_padding;
+        Some(trailing_bytes)
+    }
+}
+
+impl TrailingSliceLayout {
+    /// Returns the difference between the complete object size and the
+    /// trailing-slice end for `elems` elements, modulo `usize::MAX + 1`.
+    ///
+    /// If the object size fits in `usize` and contains the trailing slice,
+    /// this is the exact trailing padding. Other inputs need not describe a
+    /// Rust type; their result is still the modular difference.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&padding| {
+        let (align, phase) = self.size_rounding_align_and_phase.components();
+        let trailing_bytes = elems.wrapping_mul(self.elem_size);
+        let mask = align.get() - 1;
+        let rounded = phase.wrapping_add(trailing_bytes).wrapping_add(mask) & !mask;
+        let object_size = self.size_base.wrapping_add(rounded);
+        padding == object_size.wrapping_sub(self.offset.wrapping_add(trailing_bytes))
+    }))]
+    pub(crate) const fn padding_for_elems(self, elems: usize) -> usize {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::padding_for_elems)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<TrailingSliceLayout>().padding_for_elems(kani::any());
+        }
+
+        let (size_align, size_phase) = self.size_rounding_align_and_phase.components();
+
+        // Since `size_align` is a nonzero power of two, subtracting one gives
+        // a mask selecting precisely the remainder modulo `size_align`.
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_mask = size_align.get() - 1;
+
+        // Removing whole alignment multiples from each element's size
+        // preserves the trailing-byte count modulo `size_align`. If elements
+        // occupy whole alignment units, this is zero, making the padding's
+        // independence from the element count explicit to the optimizer.
+        let elem_remainder = self.elem_size & size_mask;
+
+        // The product is congruent to `elems * self.elem_size` modulo
+        // `size_align`. Wrapping preserves that congruence because every
+        // power-of-two `size_align` divides `usize::MAX + 1`. Masking then
+        // gives the exact trailing-byte remainder in `0..size_align`.
+        let trailing_remainder = elems.wrapping_mul(elem_remainder) & size_mask;
+
+        // Adding `size_phase` gives the same remainder as the mathematical
+        // `size_phase + elems * self.elem_size`. Reducing before adding the
+        // phase also exposes this periodicity to the optimizer.
+        let rounding_input = size_phase.wrapping_add(trailing_remainder);
+
+        // `rounding_padding` is the unique value in `0..size_align` that
+        // rounds `rounding_input` up to an alignment multiple. Since only
+        // the remainder determines this value, it is also the padding added
+        // by `round_up(size_phase + elems * self.elem_size, size_align)`.
+        let rounding_padding = util::padding_needed_for(rounding_input, size_align);
+
+        // Write `trailing_bytes = elems * self.elem_size` over mathematical
+        // integers. Subtracting the trailing-slice end from the complete
+        // object size cancels `trailing_bytes`:
+        //
+        //   size_base + round_up(size_phase + trailing_bytes, size_align)
+        //       - (offset + trailing_bytes)
+        //       = size_base + size_phase - offset + rounding_padding.
+        //
+        // Wrapping computes this difference modulo `usize::MAX + 1`, even
+        // if an intermediate value or the difference is unrepresentable.
+        // If the object size fits in `usize` and contains the trailing slice,
+        // the difference is in `0..=usize::MAX`; its residue is then the
+        // exact number of padding bytes after the trailing slice.
+        self.size_base
+            .wrapping_add(size_phase)
+            .wrapping_sub(self.offset)
+            .wrapping_add(rounding_padding)
+    }
+
+    /// Computes the size described by this layout for `elems` trailing slice
+    /// elements.
+    ///
+    /// Returns `None` if the element-byte count or complete rounded size
+    /// cannot be represented as a `usize`.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&size| {
+        size == elems.checked_mul(self.elem_size)
+            .and_then(|bytes| proofs::slice_dst_size_for_trailing_bytes(self, bytes))
+    }))]
+    pub(crate) const fn size_for_elems(self, elems: usize) -> Option<usize> {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::size_for_elems)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<TrailingSliceLayout>().size_for_elems(kani::any());
+        }
+
+        // Let `size_align` and `size_phase` denote the components stored in
+        // `size_rounding_align_and_phase`. The normalized layout formula,
+        // evaluated over the nonnegative integers, is:
+        //
+        //   object_size(trailing_bytes)
+        //       = self.size_base
+        //           + round_up(size_phase + trailing_bytes, size_align)
+        //
+        // Here, `round_up` gives the least multiple of `size_align` greater
+        // than or equal to its input. Thus `object_size` is nondecreasing.
+        // By the capacity helper's contract, `max_trailing_bytes` is the
+        // largest byte count for which `object_size` fits in a `usize`.
+        // Monotonicity then gives the equivalence:
+        //
+        //   object_size(trailing_bytes) <= usize::MAX
+        //       iff trailing_bytes <= max_trailing_bytes.
+        //
+        // If the helper returns `None`, even `object_size(0)` exceeds the
+        // limit, so no element count can produce a representable size.
+        let max_trailing_bytes = match self.max_trailing_bytes(usize::MAX) {
+            Some(bytes) => bytes,
+            None => return None,
+        };
+
+        // Each of the `elems` elements contributes `self.elem_size` bytes,
+        // so substitution into the formula requires their product. Checked
+        // multiplication yields that exact product, including zero for
+        // zero-sized elements. If it overflows, the complete size cannot fit
+        // either: `object_size(trailing_bytes) >= trailing_bytes` because
+        // the base, phase, and rounding increment are all nonnegative.
+        let trailing_size = match self.elem_size.checked_mul(elems) {
+            Some(bytes) => bytes,
+            None => return None,
+        };
+
+        // The equivalence above rejects exactly the remaining cases whose
+        // complete size exceeds `usize::MAX`. After this check we have
+        // `object_size(trailing_size) <= usize::MAX`.
+        if trailing_size > max_trailing_bytes {
+            return None;
+        }
+
+        // The trailing slice starts at `self.offset` and occupies
+        // `trailing_size` bytes. Thus `trailing_end` is its end offset modulo
+        // `usize::MAX + 1`. This sum need not fit: a raw layout need not
+        // describe a Rust type, so its trailing slice need not lie within
+        // the complete object size bounded above.
+        let trailing_end = self.offset.wrapping_add(trailing_size);
+
+        // `padding_for_elems` returns `object_size(trailing_size)` minus the
+        // trailing-slice end, modulo `usize::MAX + 1`. Adding the end back
+        // therefore gives `object_size(trailing_size)` modulo the same
+        // modulus. The bound above establishes that this size fits in
+        // `usize`, so its residue is the exact size specified by the layout.
+        let size = trailing_end.wrapping_add(self.padding_for_elems(elems));
+        Some(size)
+    }
+
+    /// Returns `true` only when `self` and `other` describe the same size for
+    /// every trailing slice length.
+    ///
+    /// This recognizes sufficient conditions for equality. A `false` result
+    /// also includes equivalent size sequences that this test cannot recognize.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&same| {
+        let (self_align, self_phase) = self.size_rounding_align_and_phase.components();
+        let (other_align, other_phase) = other.size_rounding_align_and_phase.components();
+        let initial_size = proofs::slice_dst_size_for_trailing_bytes(self, 0);
+        same == (self.elem_size == other.elem_size
+            && initial_size.is_some()
+            && initial_size == proofs::slice_dst_size_for_trailing_bytes(other, 0)
+            && ((self.elem_size % self_align.get() == 0
+                && self.elem_size % other_align.get() == 0)
+                || (self_align == other_align && self_phase == other_phase)))
+    }))]
+    pub(crate) const fn has_same_size_sequence(self, other: Self) -> bool {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::has_same_size_sequence)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<TrailingSliceLayout>().has_same_size_sequence(kani::any());
+        }
+
+        // For either layout, interpret its normalized size formula over the
+        // nonnegative integers:
+        //
+        //   object_size(elems)
+        //       = size_base
+        //           + round_up(size_phase + elems * elem_size, size_align).
+        //
+        // In two cases below, we establish equality of these mathematical sizes
+        // for every `elems`. Equal sizes also have the same `usize`
+        // representability bound.
+        //
+        // Both cases require a common byte contribution at each element count.
+        // Equal element sizes give that shared term, `elems * elem_size`.
+        if self.elem_size != other.elem_size {
+            return false;
+        }
+
+        // At `elems == 0`, the element contribution vanishes. Require equal,
+        // representable initial sizes; each case below then shows that
+        // increasing `elems` adds the same amount to both initial sizes.
+        match (self.size_for_elems(0), other.size_for_elems(0)) {
+            (Some(self_size), Some(other_size)) if self_size == other_size => {}
+            _ => return false,
+        }
+
+        let (self_align, self_phase) = self.size_rounding_align_and_phase.components();
+        let (other_align, other_phase) = other.size_rounding_align_and_phase.components();
+        let self_align = self_align.get();
+        let other_align = other_align.get();
+
+        // Case 1: The element size is a multiple of both alignments.
+        //
+        // For two power-of-two alignments, the larger is divisible by the
+        // smaller. Thus `max_align` is their least common multiple, and a byte
+        // count is divisible by both alignments exactly when it is divisible by
+        // `max_align`.
+        let max_align = if self_align > other_align { self_align } else { other_align };
+
+        // If the element size is divisible by both alignments, so is `elems *
+        // elem_size`. Adding an alignment multiple commutes with rounding,
+        // giving the following identity for each layout:
+        //
+        //   round_up(size_phase + elems * elem_size, size_align)
+        //       = round_up(size_phase, size_align) + elems * elem_size.
+        //
+        // Consequently, `object_size(elems) = object_size(0) + elems *
+        // elem_size`. The initial sizes and element sizes already agree, so the
+        // complete size sequences agree. This also covers zero-sized elements,
+        // whose contribution is zero for every element count.
+        #[allow(clippy::arithmetic_side_effects)]
+        if self.elem_size % max_align == 0 {
+            return true;
+        }
+
+        // Case 2: The rounding alignments and phases match.
+        //
+        // Require a common rounding alignment before comparing phases. If the
+        // alignments differ, neither case establishes equality.
+        if self_align != other_align {
+            return false;
+        }
+
+        // If the phases also agree, both `round_up` operations have the same
+        // input and alignment at every element count. In particular, their
+        // rounded terms agree at zero. Subtracting that common term from the
+        // equal initial sizes proves `self.size_base == other.size_base`. Both
+        // the fixed and rounded contributions therefore agree for every
+        // `elems`, which establishes equality of the complete size formulas.
+        self_phase == other_phase
+    }
+
+    /// Advances the size formula by `bytes` while replacing its element size.
+    ///
+    /// Let `(size_align, size_phase)` be decoded from
+    /// `self.size_rounding_align_and_phase`. For a trailing slice length
+    /// `elems`, the returned layout describes:
+    ///
+    /// ```text
+    /// self.size_base
+    ///     + round_up(size_phase + bytes + elems * elem_size, size_align)
+    /// ```
+    ///
+    /// Here, `elem_size` is the replacement element size passed to this
+    /// method. The returned layout preserves the physical slice offset
+    /// `self.offset` and the rounding alignment; advancing changes the size
+    /// calculation.
+    ///
+    /// Returns `None` if advancing cannot produce representable normalized
+    /// components. Even when those components fit, evaluating the rounded
+    /// object size may overflow for some or all trailing slice lengths.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|result| {
+        let expected_offset = self.size_offset().checked_add(bytes);
+        match result {
+            Some(advanced) => {
+                let align = self.size_rounding_align_and_phase.align();
+                expected_offset == Some(advanced.size_offset())
+                    && advanced.offset == self.offset
+                    && advanced.elem_size == elem_size
+                    && advanced.size_rounding_align_and_phase.align() == align
+                    && (advanced.size_base & (align.get() - 1)) == (self.size_base & (align.get() - 1))
+            }
+            None => expected_offset.is_none(),
+        }
+    }))]
+    const fn advance(self, bytes: usize, elem_size: usize) -> Option<Self> {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(TrailingSliceLayout::advance)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<TrailingSliceLayout>().advance(kani::any(), kani::any());
+        }
+
+        let (size_align, size_phase) = self.size_rounding_align_and_phase.components();
+
+        // Advancing replaces the phase inside `round_up` with `size_phase +
+        // bytes`. To normalize this sum, separate it into whole alignment units
+        // and a remainder. The whole units can move outside `round_up` into the
+        // base; the remainder becomes the new phase.
+        //
+        // Since `size_align` is a nonzero power of two, `align_mask` selects
+        // exactly the bits representing a remainder modulo `size_align`.
+        // Nonzero `size_align` also makes this subtraction representable.
+        #[allow(clippy::arithmetic_side_effects)]
+        let align_mask = size_align.get() - 1;
+
+        // The base can increase by at most `usize::MAX - self.size_base`. Since
+        // only whole alignment units move into the base, the largest
+        // transferable contribution is:
+        //
+        //   whole_capacity
+        //       = round_down(usize::MAX - self.size_base, size_align).
+        //
+        // A remainder up to `align_mask` stays in the phase and consumes no
+        // base capacity. Thus the largest advanced phase that can be split into
+        // representable normalized components is `phase_capacity =
+        // whole_capacity + align_mask`. Setting the low bits of the remaining
+        // base capacity computes exactly that sum. Its two terms have disjoint
+        // set bits, so it cannot overflow. Any larger sum would transfer more
+        // whole units than the base can hold.
+        #[allow(clippy::arithmetic_side_effects)]
+        let phase_capacity = (usize::MAX - self.size_base) | align_mask;
+
+        // The existing phase already occupies `size_phase` bytes of this
+        // capacity. Subtracting it gives the greatest permitted increment:
+        //
+        //   bytes <= max_advance
+        //       iff size_phase + bytes <= phase_capacity.
+        //
+        // Since `phase_capacity >= align_mask >= size_phase`, the subtraction
+        // cannot underflow.
+        #[allow(clippy::arithmetic_side_effects)]
+        let max_advance = phase_capacity - size_phase;
+        if bytes > max_advance {
+            return None;
+        }
+
+        // This is the fixed term inside rounding after the requested
+        // advancement, before normalization. The check above proves `size_phase
+        // + bytes <= phase_capacity <= usize::MAX`, so the addition is
+        // representable.
+        #[allow(clippy::arithmetic_side_effects)]
+        let advanced_phase = size_phase + bytes;
+
+        // Taking the remainder retains precisely the part that cannot move
+        // outside rounding as whole alignment units. In particular, `0 <=
+        // normalized_phase < size_align`, as required for the new rounding
+        // parameters.
+        let normalized_phase = advanced_phase & align_mask;
+
+        // Rounding down removes precisely the remainder retained in the
+        // phase, so `whole_bytes = advanced_phase - normalized_phase`.
+        let whole_bytes =
+            util::round_down_to_next_multiple_of_alignment(advanced_phase, size_align);
+
+        // Because `advanced_phase <= phase_capacity`, we have
+        // `whole_bytes <= whole_capacity <= usize::MAX - self.size_base`.
+        // Adding this transferred contribution to the base therefore fits.
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_base = self.size_base + whole_bytes;
+
+        // To verify the returned formula, let `trailing_size = elems *
+        // elem_size` and evaluate the following over the nonnegative integers.
+        // Since `whole_bytes` is a multiple of `size_align`, it can move back
+        // inside `round_up` without changing the result:
+        //
+        //   size_base + round_up(normalized_phase + trailing_size, size_align)
+        //       = self.size_base
+        //           + round_up(whole_bytes + normalized_phase + trailing_size, size_align)
+        //       = self.size_base
+        //           + round_up(size_phase + bytes + trailing_size, size_align).
+        //
+        // This is the requested advanced formula. The replacement element size
+        // supplies its new coefficient of `elems`; `offset` retains the
+        // caller's field-placement description.
+        Some(Self {
+            offset: self.offset,
+            elem_size,
+            size_base,
+            size_rounding_align_and_phase: RoundingAlignAndPhase::new(size_align, normalized_phase),
+        })
+    }
 }
 
 impl SizeInfo {
@@ -73,12 +725,42 @@ impl SizeInfo {
     #[allow(unused)]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
+    #[cfg_attr(kani, kani::ensures(|result| match (*self, *result) {
+        (SizeInfo::Sized { size }, Some(SizeInfo::Sized { size: converted })) => {
+            size == converted
+        }
+        (SizeInfo::SliceDst(original), Some(SizeInfo::SliceDst(converted))) => {
+            converted.elem_size.get() == original.elem_size
+                && converted.offset == original.offset
+                && converted.size_base == original.size_base
+                && converted.size_rounding_align_and_phase == original.size_rounding_align_and_phase
+        }
+        (SizeInfo::SliceDst(original), None) => original.elem_size == 0,
+        _ => false,
+    }))]
     const fn try_to_nonzero_elem_size(&self) -> Option<SizeInfo<NonZeroUsize>> {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(SizeInfo::try_to_nonzero_elem_size)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<SizeInfo>().try_to_nonzero_elem_size();
+        }
+
         Some(match *self {
             SizeInfo::Sized { size } => SizeInfo::Sized { size },
-            SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }) => {
+            SizeInfo::SliceDst(TrailingSliceLayout {
+                offset,
+                elem_size,
+                size_base,
+                size_rounding_align_and_phase,
+            }) => {
                 if let Some(elem_size) = NonZeroUsize::new(elem_size) {
-                    SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size })
+                    SizeInfo::SliceDst(TrailingSliceLayout {
+                        offset,
+                        elem_size,
+                        size_base,
+                        size_rounding_align_and_phase,
+                    })
                 } else {
                     return None;
                 }
@@ -87,6 +769,40 @@ const fn try_to_nonzero_elem_size(&self) -> Option<SizeInfo<NonZeroUsize>> {
     }
 }
 
+/// Returns the largest number of `elem_size`-byte elements which fit in
+/// `bytes`, along with the number of bytes those elements occupy.
+#[cfg_attr(
+    kani,
+    kani::ensures(|&(elems, used)| {
+        (match elems.checked_mul(elem_size.get()) {
+            Some(product) => {
+                product == used && used <= bytes && bytes - used < elem_size.get()
+            }
+            None => false,
+        }) && used
+            .checked_add(elem_size.get())
+            .map(|next_used| next_used > bytes)
+            .unwrap_or(true)
+    })
+)]
+#[inline(always)]
+const fn max_elems_for_bytes(bytes: usize, elem_size: NonZeroUsize) -> (usize, usize) {
+    #[cfg(kani)]
+    #[kani::proof_for_contract(max_elems_for_bytes)]
+    #[kani::solver(kissat)]
+    fn proof() {
+        max_elems_for_bytes(kani::any(), kani::any());
+    }
+
+    #[allow(clippy::arithmetic_side_effects)]
+    let elems = bytes / elem_size.get();
+    let used = match elems.checked_mul(elem_size.get()) {
+        Some(used) => used,
+        None => const_unreachable!(),
+    };
+    (elems, used)
+}
+
 #[doc(hidden)]
 #[derive(Copy, Clone)]
 #[cfg_attr(test, derive(Debug))]
@@ -97,6 +813,7 @@ pub enum CastType {
 }
 
 #[cfg_attr(test, derive(Debug))]
+#[cfg_attr(kani, derive(kani::Arbitrary))]
 pub(crate) enum MetadataCastError {
     Alignment,
     Size,
@@ -128,7 +845,7 @@ impl DstLayout {
     ///   2<sup>29</sup>.
     #[cfg(not(kani))]
     #[cfg(not(target_pointer_width = "16"))]
-    pub(crate) const CURRENT_MAX_ALIGN: NonZeroUsize = match NonZeroUsize::new(1 << 28) {
+    pub(crate) const CURRENT_MAX_ALIGN: NonZeroUsize = match NonZeroUsize::new(1 << 29) {
         Some(max_align) => max_align,
         None => const_unreachable!(),
     };
@@ -164,7 +881,18 @@ impl DstLayout {
     /// shallow padding, unsafe code may assume that the result of this method
     /// accurately reflects the size, alignment, and lack of static shallow
     /// padding of that type.
+    #[cfg_attr(kani, kani::ensures(|result| {
+        result.align == self.align && result.size_info == self.size_info
+            && result.statically_shallow_unpadded
+    }))]
     const fn assume_shallow_unpadded(self) -> Self {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::assume_shallow_unpadded)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<DstLayout>().assume_shallow_unpadded();
+        }
+
         Self { statically_shallow_unpadded: true, ..self }
     }
 
@@ -182,7 +910,20 @@ const fn assume_shallow_unpadded(self) -> Self {
     #[doc(hidden)]
     #[must_use]
     #[inline]
+    #[cfg_attr(kani, kani::requires(repr_align.map_or(true, |align| align.is_power_of_two())))]
+    #[cfg_attr(kani, kani::ensures(|result| {
+        result.align == repr_align.unwrap_or(Self::MIN_ALIGN)
+            && result.size_info == SizeInfo::Sized { size: 0 }
+            && result.statically_shallow_unpadded
+    }))]
     pub const fn new_zst(repr_align: Option<NonZeroUsize>) -> DstLayout {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::new_zst)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            let _ = DstLayout::new_zst(kani::any());
+        }
+
         let align = match repr_align {
             Some(align) => align,
             None => Self::MIN_ALIGN,
@@ -206,7 +947,24 @@ pub const fn new_zst(repr_align: Option<NonZeroUsize>) -> DstLayout {
     #[doc(hidden)]
     #[must_use]
     #[inline]
+    #[cfg_attr(kani, kani::ensures(|result| {
+        result.align.get() == mem::align_of::<T>()
+            && result.size_info == SizeInfo::Sized { size: mem::size_of::<T>() }
+            && result.statically_shallow_unpadded == false
+    }))]
     pub const fn for_type<T>() -> DstLayout {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::for_type::<()>)]
+        fn proof_zst() {
+            let _ = DstLayout::for_type::<()>();
+        }
+
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::for_type::<(u8, u64)>)]
+        fn proof_padded() {
+            let _ = DstLayout::for_type::<(u8, u64)>();
+        }
+
         // SAFETY: `align` is correct by construction. `T: Sized`, and so it is
         // sound to initialize `size_info` to `SizeInfo::Sized { size }`; the
         // `size` field is also correct by construction. `unpadded` can safely
@@ -221,16 +979,39 @@ pub const fn for_type<T>() -> DstLayout {
         }
     }
 
-    /// Constructs a `DstLayout` which describes a `T` that does not contain
-    /// padding.
+    /// Produces `T`'s size and alignment with static shallow padding assumed
+    /// absent.
+    ///
+    /// This method records the assumption without checking `T` for padding.
+    /// It can be used to ignore padding within a field when computing padding
+    /// introduced by its enclosing struct.
     ///
     /// # Safety
     ///
-    /// Unsafe code may assume that `DstLayout` is the correct layout for `T`.
+    /// Unsafe code may rely on the result's size and alignment being correct
+    /// for `T`. Relying on its recorded absence of static shallow padding
+    /// requires an independent justification that `T` lacks such padding.
     #[doc(hidden)]
     #[must_use]
     #[inline]
+    #[cfg_attr(kani, kani::ensures(|result| {
+        result.align.get() == mem::align_of::<T>()
+            && result.size_info == SizeInfo::Sized { size: mem::size_of::<T>() }
+            && result.statically_shallow_unpadded == true
+    }))]
     pub const fn for_unpadded_type<T>() -> DstLayout {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::for_unpadded_type::<()>)]
+        fn proof_zst() {
+            let _ = DstLayout::for_unpadded_type::<()>();
+        }
+
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::for_unpadded_type::<(u8, u64)>)]
+        fn proof_padded() {
+            let _ = DstLayout::for_unpadded_type::<(u8, u64)>();
+        }
+
         Self::for_type::<T>().assume_shallow_unpadded()
     }
 
@@ -239,7 +1020,31 @@ pub const fn for_unpadded_type<T>() -> DstLayout {
     /// # Safety
     ///
     /// Unsafe code may assume that `DstLayout` is the correct layout for `[T]`.
+    #[cfg_attr(kani, kani::ensures(|result| {
+        result.align.get() == mem::align_of::<T>() && result.statically_shallow_unpadded
+            && matches!(result.size_info, SizeInfo::SliceDst(trailing)
+                if trailing.offset == 0 && trailing.size_base == 0
+                    && trailing.elem_size == mem::size_of::<T>()
+                    && trailing.size_rounding_align_and_phase.components() == (result.align, 0))
+    }))]
     pub(crate) const fn for_slice<T>() -> DstLayout {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::for_slice::<()>)]
+        fn proof_zst() {
+            let _ = DstLayout::for_slice::<()>();
+        }
+
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::for_slice::<(u8, u64)>)]
+        fn proof_padded() {
+            let _ = DstLayout::for_slice::<(u8, u64)>();
+        }
+
+        let align = match NonZeroUsize::new(mem::align_of::<T>()) {
+            Some(align) => align,
+            None => const_unreachable!(),
+        };
+
         // SAFETY: The alignment of a slice is equal to the alignment of its
         // element type, and so `align` is initialized correctly.
         //
@@ -249,13 +1054,12 @@ pub(crate) const fn for_slice<T>() -> DstLayout {
         // construction. Since `[T]` is a (degenerate case of a) slice DST, it
         // is correct to initialize `size_info` to `SizeInfo::SliceDst`.
         DstLayout {
-            align: match NonZeroUsize::new(mem::align_of::<T>()) {
-                Some(align) => align,
-                None => const_unreachable!(),
-            },
+            align,
             size_info: SizeInfo::SliceDst(TrailingSliceLayout {
                 offset: 0,
                 elem_size: mem::size_of::<T>(),
+                size_base: 0,
+                size_rounding_align_and_phase: RoundingAlignAndPhase::new(align, 0),
             }),
             statically_shallow_unpadded: true,
         }
@@ -273,15 +1077,42 @@ pub(crate) const fn for_slice<T>() -> DstLayout {
     /// alignment modifiers and fields corresponding to that definition, the
     /// resulting `DstLayout` will correctly encode the layout of that struct.
     ///
+    /// This guarantee uses one explicit compatibility premise for generic
+    /// indirection: while Rust accepts an instantiation which transitively
+    /// places a `repr(align)` type inside a `repr(packed)` type, that
+    /// instantiation follows the otherwise-applicable `repr(C)`,
+    /// `repr(packed)`, and inner-type layout rules. The Reference prohibits the
+    /// direct form, and Rust's continued acceptance and layout behavior are
+    /// outside the algebra proved by this implementation. Re-audit if the
+    /// compiler rejects such an instantiation or assigns it a different
+    /// layout.
+    ///
     /// We make no guarantees to the behavior of this method when it is invoked
     /// with arguments that cannot correspond to a valid `repr(C)` struct.
     #[must_use]
     #[inline]
+    #[cfg_attr(kani, kani::requires(proofs::repr_c_layout(repr_align, repr_packed, fields).is_some()))]
+    #[cfg_attr(kani, kani::ensures(|&result| {
+        Some(result) == proofs::repr_c_layout(repr_align, repr_packed, fields)
+    }))]
     pub const fn for_repr_c_struct(
         repr_align: Option<NonZeroUsize>,
         repr_packed: Option<NonZeroUsize>,
         fields: &[DstLayout],
     ) -> DstLayout {
+        // This harness covers up to three fields, including an optional final
+        // DST. Arbitrary-length composition is not established by this bound.
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(DstLayout::for_repr_c_struct)]
+        #[kani::solver(kissat)]
+        #[kani::unwind(4)]
+        fn proof() {
+            let fields: [DstLayout; 3] = kani::any();
+            let len: usize = kani::any();
+            kani::assume(len <= fields.len());
+            let _ = DstLayout::for_repr_c_struct(kani::any(), kani::any(), &fields[..len]);
+        }
+
         let mut layout = DstLayout::new_zst(repr_align);
 
         let mut i = 0;
@@ -338,7 +1169,18 @@ pub const fn for_repr_c_struct(
     #[doc(hidden)]
     #[must_use]
     #[inline]
+    #[cfg_attr(kani, kani::requires(proofs::extended_layout(self, field, repr_packed).is_some()))]
+    #[cfg_attr(kani, kani::ensures(|&result| {
+        Some(result) == proofs::extended_layout(self, field, repr_packed)
+    }))]
     pub const fn extend(self, field: DstLayout, repr_packed: Option<NonZeroUsize>) -> Self {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::extend)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            let _ = kani::any::<DstLayout>().extend(kani::any(), kani::any());
+        }
+
         use util::{max, min, padding_needed_for};
 
         // If `repr_packed` is `None`, there are no alignment constraints, and
@@ -427,6 +1269,8 @@ pub const fn extend(self, field: DstLayout, repr_packed: Option<NonZeroUsize>) -
                         SizeInfo::SliceDst(TrailingSliceLayout {
                             offset: trailing_offset,
                             elem_size,
+                            size_base,
+                            size_rounding_align_and_phase,
                         }) => {
                             // If the trailing field is dynamically sized, so too
                             // will the resulting layout. The offset of the trailing
@@ -440,11 +1284,30 @@ pub const fn extend(self, field: DstLayout, repr_packed: Option<NonZeroUsize>) -
                             // panic otherwise (e.g., combining or aligning the
                             // components would create a size exceeding
                             // `usize::MAX`).
-                            let offset = match offset.checked_add(trailing_offset) {
+                            let trailing_offset = match offset.checked_add(trailing_offset) {
                                 Some(offset) => offset,
                                 None => const_panic!("`field` cannot be appended without the total size overflowing `usize`"),
                             };
-                            SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size })
+
+                            // Before normalization, the composite's size is:
+                            //
+                            //   offset + size_base
+                            //       + round_up(size_phase + elems * elem_size, size_align)
+                            //
+                            // `offset` does not participate in the rounding,
+                            // so it can be added directly to the normalized
+                            // base.
+                            let size_base = match offset.checked_add(size_base) {
+                                Some(base) => base,
+                                None => const_panic!("`field` cannot be appended without the total size overflowing `usize`"),
+                            };
+
+                            SizeInfo::SliceDst(TrailingSliceLayout {
+                                offset: trailing_offset,
+                                elem_size,
+                                size_base,
+                                size_rounding_align_and_phase,
+                            })
                         }
                     },
                 )
@@ -459,18 +1322,11 @@ pub const fn extend(self, field: DstLayout, repr_packed: Option<NonZeroUsize>) -
     }
 
     /// Like `Layout::pad_to_align`, this routine rounds the size of this layout
-    /// up to the nearest multiple of this type's alignment or `repr_packed`
-    /// (whichever is less). This method leaves DST layouts unchanged, since the
-    /// trailing padding of DSTs is computed at runtime.
-    ///
-    /// The accompanying boolean is `true` if the resulting composition of
-    /// fields necessitated static (as opposed to dynamic) padding; otherwise
-    /// `false`.
+    /// up to the nearest multiple of this type's alignment. For DST layouts,
+    /// this updates the runtime size formula to account for trailing padding.
     ///
     /// In order to match the layout of a `#[repr(C)]` struct, this method
-    /// should be invoked after the invocations of [`DstLayout::extend`]. If
-    /// `self` corresponds to a type marked with `repr(packed(N))`, then
-    /// `repr_packed` should be set to `Some(N)`, otherwise `None`.
+    /// should be invoked after the invocations of [`DstLayout::extend`].
     ///
     /// This method cannot be used to match the layout of a record with the
     /// default representation, as that representation is mostly unspecified.
@@ -480,7 +1336,7 @@ pub const fn extend(self, field: DstLayout, repr_packed: Option<NonZeroUsize>) -
     /// If a (potentially hypothetical) valid `repr(C)` type begins with fields
     /// whose layout are `self` followed only by zero or more bytes of trailing
     /// padding (not included in `self`), then unsafe code may rely on
-    /// `self.pad_to_align(repr_packed)` producing a layout that correctly
+    /// `self.pad_to_align()` producing a layout that correctly
     /// encapsulates the layout of that type.
     ///
     /// We make no guarantees to the behavior of this method if `self` cannot
@@ -489,7 +1345,16 @@ pub const fn extend(self, field: DstLayout, repr_packed: Option<NonZeroUsize>) -
     #[doc(hidden)]
     #[must_use]
     #[inline]
+    #[cfg_attr(kani, kani::requires(proofs::padded_layout(self).is_some()))]
+    #[cfg_attr(kani, kani::ensures(|&result| Some(result) == proofs::padded_layout(self)))]
     pub const fn pad_to_align(self) -> Self {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(DstLayout::pad_to_align)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            let _ = kani::any::<DstLayout>().pad_to_align();
+        }
+
         use util::padding_needed_for;
 
         let (static_padding, size_info) = match self.size_info {
@@ -504,10 +1369,69 @@ pub const fn pad_to_align(self) -> Self {
                 (padding, SizeInfo::Sized { size })
             }
             // For DST layouts, trailing padding depends on the length of the
-            // trailing DST and is computed at runtime. This does not alter the
-            // offset or element size of the layout, so we leave `size_info`
-            // unchanged.
-            size_info @ SizeInfo::SliceDst(_) => (0, size_info),
+            // trailing DST and is computed at runtime. Normalize the composed
+            // rounding operation back into the representation documented on
+            // `TrailingSliceLayout`.
+            SizeInfo::SliceDst(mut trailing) => {
+                let (size_align, size_phase) = trailing.size_rounding_align_and_phase.components();
+                if size_align.get() < self.align.get() {
+                    // For a trailing-slice byte count `trailing_size`, the
+                    // input layout describes:
+                    //
+                    //   trailing.size_base
+                    //       + round_up(size_phase + trailing_size, size_align)
+                    //
+                    // Here, `size_align < self.align`. Both alignments are
+                    // powers of two, so rounding the complete input size to
+                    // `self.align` is equivalent to:
+                    //
+                    //   rounded_base = round_up(trailing.size_base, size_align)
+                    //   fixed_contribution = rounded_base + size_phase
+                    //   new_phase = fixed_contribution % self.align
+                    //   new_base = fixed_contribution - new_phase
+                    //   new_base + round_up(new_phase + trailing_size, self.align)
+                    //
+                    // `prove_dst_layout_pad_to_align_dst_outer_alignment_transition`
+                    // checks the exact field transition and preserved
+                    // invariants. Its `_formula` companion proves this
+                    // identity for every representable trailing byte count.
+                    let base_padding = padding_needed_for(trailing.size_base, size_align);
+                    let rounded_base = match trailing.size_base.checked_add(base_padding) {
+                        Some(base) => base,
+                        None => const_panic!("Adding padding caused size to overflow `usize`."),
+                    };
+                    let fixed_contribution = match rounded_base.checked_add(size_phase) {
+                        Some(bytes) => bytes,
+                        None => const_panic!("Adding padding caused size to overflow `usize`."),
+                    };
+                    #[allow(clippy::arithmetic_side_effects)]
+                    let phase = fixed_contribution & (self.align.get() - 1);
+                    // Rounding down removes `phase`, the fixed contribution
+                    // modulo `self.align`, leaving the new base.
+                    let size_base = util::round_down_to_next_multiple_of_alignment(
+                        fixed_contribution,
+                        self.align,
+                    );
+                    trailing.size_base = size_base;
+                    trailing.size_rounding_align_and_phase =
+                        RoundingAlignAndPhase::new(self.align, phase);
+                } else {
+                    // `size_align` is a multiple of `self.align`, so
+                    // the inner rounded size is already aligned to
+                    // `self.align`. Only `size_base` needs to be rounded.
+                    // `prove_dst_layout_pad_to_align_dst_inner_rounding_transition`
+                    // checks the exact field transition and preserved
+                    // invariants. Its `_formula` companion proves size
+                    // equivalence for every representable trailing byte count.
+                    let padding = padding_needed_for(trailing.size_base, self.align);
+                    trailing.size_base = match trailing.size_base.checked_add(padding) {
+                        Some(base) => base,
+                        None => const_panic!("Adding padding caused size to overflow `usize`."),
+                    };
+                }
+
+                (0, SizeInfo::SliceDst(trailing))
+            }
         };
 
         let statically_shallow_unpadded = self.statically_shallow_unpadded && static_padding == 0;
@@ -515,48 +1439,127 @@ pub const fn pad_to_align(self) -> Self {
         DstLayout { align: self.align, size_info, statically_shallow_unpadded }
     }
 
-    /// Produces `true` if `self` requires static padding; otherwise `false`.
+    /// Produces `false` when this layout is marked as having no static shallow
+    /// padding, and `true` otherwise.
+    ///
+    /// A `true` result is conservative: it does not establish that the type
+    /// contains padding. For example, this method produces `true` for
+    /// `DstLayout::for_type::<u8>()`, since `for_type` does not record whether
+    /// static shallow padding is absent.
     #[must_use]
     #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&padding| padding == !self.statically_shallow_unpadded))]
     pub const fn requires_static_padding(self) -> bool {
+        #[cfg(kani)]
+        #[kani::proof_for_contract(DstLayout::requires_static_padding)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            let _ = kani::any::<DstLayout>().requires_static_padding();
+        }
+
         !self.statically_shallow_unpadded
     }
 
-    /// Produces `true` if there exists any metadata for which a type of layout
-    /// `self` would require dynamic trailing padding; otherwise `false`.
+    /// Produces `false` only if every valid metadata describes an instance
+    /// which requires no dynamic trailing padding.
+    ///
+    /// A `true` result conservatively selects the dynamic-padding path; it does
+    /// not guarantee that any valid metadata actually requires padding.
     #[must_use]
     #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&padding| match self.size_info {
+        SizeInfo::Sized { .. } => !padding,
+        SizeInfo::SliceDst(trailing) => padding == (
+            proofs::slice_dst_size_for_trailing_bytes(trailing, 0) != Some(trailing.offset)
+                || trailing.elem_size % trailing.size_rounding_align_and_phase.align().get() != 0
+        ),
+    }))]
     pub const fn requires_dynamic_padding(self) -> bool {
-        // A `% self.align.get()` cannot panic, since `align` is non-zero.
-        #[allow(clippy::arithmetic_side_effects)]
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(DstLayout::requires_dynamic_padding)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            let _ = kani::any::<DstLayout>().requires_dynamic_padding();
+        }
+
         match self.size_info {
             SizeInfo::Sized { .. } => false,
             SizeInfo::SliceDst(trailing_slice_layout) => {
-                // SAFETY: This predicate is formally proved sound by
-                // `proofs::prove_requires_dynamic_padding`.
-                trailing_slice_layout.offset % self.align.get() != 0
-                    || trailing_slice_layout.elem_size % self.align.get() != 0
+                // SAFETY: `proofs::prove_requires_dynamic_padding` formally
+                // proves the safety-critical direction: when this predicate
+                // returns false, no valid metadata requires dynamic padding.
+                match trailing_slice_layout.size_for_elems(0) {
+                    Some(initial_size) => {
+                        #[allow(clippy::arithmetic_side_effects)]
+                        let has_static_stride = trailing_slice_layout.elem_size
+                            % trailing_slice_layout.size_rounding_align_and_phase.align().get()
+                            == 0;
+                        initial_size != trailing_slice_layout.offset || !has_static_stride
+                    }
+                    None => true,
+                }
+            }
+        }
+    }
+
+    /// Returns the largest trailing slice length whose object size is exactly
+    /// `size`.
+    ///
+    /// Returns `None` if there is no such length, if this describes a sized
+    /// type, or if the trailing slice element is zero-sized.
+    #[inline(always)]
+    #[cfg_attr(kani, kani::ensures(|&result| {
+        result == match self.size_info {
+            SizeInfo::SliceDst(trailing) if trailing.elem_size != 0 => {
+                proofs::max_trailing_bytes(trailing, size)
+                    .map(|bytes| bytes / trailing.elem_size)
+                    .filter(|&elems| trailing.size_for_elems(elems) == Some(size))
+            }
+            _ => None,
+        }
+    }))]
+    const fn metadata_for_exact_size(&self, size: usize) -> Option<usize> {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(DstLayout::metadata_for_exact_size)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            kani::any::<DstLayout>().metadata_for_exact_size(kani::any());
+        }
+
+        match self.size_info {
+            SizeInfo::Sized { .. }
+            | SizeInfo::SliceDst(TrailingSliceLayout { elem_size: 0, .. }) => None,
+            SizeInfo::SliceDst(_) => {
+                // Address zero is aligned to every supported alignment, and
+                // `0 + size` cannot overflow. The validator returns the
+                // largest metadata whose object fits in `size`; accepting it
+                // only when the resulting object consumes all `size` bytes
+                // turns that bounded query into an exact-size query.
+                match self.validate_cast_and_convert_metadata(0, size, CastType::Prefix) {
+                    Ok((elems, object_size)) if object_size == size => Some(elems),
+                    _ => None,
+                }
             }
         }
     }
 
-    /// Validates that a cast is sound from a layout perspective.
+    /// Given a completed type layout, produces metadata and a split index for
+    /// a prefix or suffix cast that satisfies the type's size and alignment
+    /// requirements.
     ///
-    /// Validates that the size and alignment requirements of a type with the
-    /// layout described in `self` would not be violated by performing a
-    /// `cast_type` cast from a pointer with address `addr` which refers to a
-    /// memory region of size `bytes_len`.
+    /// `addr` and `bytes_len` describe the address and size of the source
+    /// memory region, and `cast_type` selects its prefix or suffix.
     ///
     /// If the cast is valid, `validate_cast_and_convert_metadata` returns
-    /// `(elems, split_at)`. If `self` describes a dynamically-sized type, then
-    /// `elems` is the maximum number of trailing slice elements for which a
-    /// cast would be valid (for sized types, `elem` is meaningless and should
-    /// be ignored). `split_at` is the index at which to split the memory region
-    /// in order for the prefix (suffix) to contain the result of the cast, and
-    /// in order for the remaining suffix (prefix) to contain the leftover
-    /// bytes.
+    /// `Ok((elems, split_at))`. For a dynamically-sized type, `elems` is the
+    /// maximum number of trailing slice elements for which the cast is valid.
+    /// For sized types, `elems` is meaningless and should be ignored.
+    /// `split_at` is the index at which to split the memory region so that the
+    /// prefix (suffix) contains the result of the cast and the remaining
+    /// suffix (prefix) contains the leftover bytes.
     ///
     /// There are three conditions under which a cast can fail:
+    ///
     /// - The smallest possible value for the type is larger than the provided
     ///   memory region
     /// - A prefix cast is requested, and `addr` does not satisfy `self`'s
@@ -568,10 +1571,10 @@ pub const fn requires_dynamic_padding(self) -> bool {
     ///
     /// # Safety
     ///
-    /// The caller may assume that this implementation is correct, and may rely
-    /// on that assumption for the soundness of their code. In particular, the
-    /// caller may assume that, if `validate_cast_and_convert_metadata` returns
-    /// `Some((elems, split_at))`, then:
+    /// When `self` accurately describes a completed type layout, including
+    /// trailing padding, and `addr + bytes_len` fits in `usize`, callers may
+    /// rely on the following guarantees for `Ok((elems, split_at))`:
+    ///
     /// - A pointer to the type (for dynamically sized types, this includes
     ///   `elems` as its pointer metadata) describes an object of size `size <=
     ///   bytes_len`
@@ -582,6 +1585,11 @@ pub const fn requires_dynamic_padding(self) -> bool {
     ///   - `split_at == bytes_len - size`
     ///   - `addr + split_at` satisfies `self`'s alignment
     ///
+    /// These guarantees require the completed-layout premise; `DstLayout`
+    /// also permits unfinished layout fragments and arbitrary field values.
+    /// In particular, suffix alignment relies on every object size being a
+    /// multiple of the type's alignment.
+    ///
     /// Note that this method does *not* ensure that a pointer constructed from
     /// its return values will be a valid pointer. In particular, this method
     /// does not reason about `isize` overflow, which is a requirement of many
@@ -606,12 +1614,57 @@ pub const fn requires_dynamic_padding(self) -> bool {
     /// condition, even if `debug_assertions` are enabled.
     #[allow(unused)]
     #[inline(always)]
+    #[cfg_attr(kani, kani::requires(addr.checked_add(bytes_len).is_some()))]
+    #[cfg_attr(kani, kani::requires(!matches!(self.size_info,
+        SizeInfo::SliceDst(TrailingSliceLayout { elem_size: 0, .. }))))]
+    #[cfg_attr(kani, kani::ensures(|result| {
+        let endpoint = match cast_type {
+            CastType::Prefix => addr,
+            CastType::Suffix => addr + bytes_len,
+        };
+        if endpoint % self.align.get() != 0 {
+            return matches!(result, Err(MetadataCastError::Alignment));
+        }
+        let candidate = match self.size_info {
+            SizeInfo::Sized { size } => {
+                if size <= bytes_len { Some((0, size)) } else { None }
+            }
+            SizeInfo::SliceDst(trailing) => {
+                proofs::max_trailing_bytes(trailing, bytes_len).and_then(|bytes| {
+                    let elems = bytes / trailing.elem_size;
+                    trailing.size_for_elems(elems).map(|size| (elems, size))
+                })
+            }
+        };
+        match (result, candidate) {
+            (Ok((elems, split_at)), Some((expected_elems, size))) => {
+                *elems == expected_elems && *split_at == match cast_type {
+                    CastType::Prefix => size,
+                    CastType::Suffix => bytes_len - size,
+                }
+            }
+            (Err(MetadataCastError::Size), None) => true,
+            _ => false,
+        }
+    }))]
     pub(crate) const fn validate_cast_and_convert_metadata(
         &self,
         addr: usize,
         bytes_len: usize,
         cast_type: CastType,
     ) -> Result<(usize, usize), MetadataCastError> {
+        #[cfg(all(kani, kani_slow))]
+        #[kani::proof_for_contract(DstLayout::validate_cast_and_convert_metadata)]
+        #[kani::solver(kissat)]
+        fn proof() {
+            let cast_type = if kani::any() { CastType::Prefix } else { CastType::Suffix };
+            let _ = kani::any::<DstLayout>().validate_cast_and_convert_metadata(
+                kani::any(),
+                kani::any(),
+                cast_type,
+            );
+        }
+
         // `debug_assert!`, but with `#[allow(clippy::arithmetic_side_effects)]`.
         macro_rules! __const_debug_assert {
             ($e:expr $(, $msg:expr)?) => {
@@ -651,9 +1704,8 @@ macro_rules! __const_debug_assert {
             // of this check is trivial - `addr` is the address the object will
             // live at.
             //
-            // For a suffix cast, we know that all valid sizes for the type are
-            // a multiple of the alignment (and by safety precondition, we know
-            // `DstLayout` may only describe valid Rust types). Thus, a
+            // Under the documented completed-layout premise, all valid sizes
+            // for the type are multiples of its alignment. Thus, a
             // validly-sized instance which lives at a validly-aligned address
             // must also end at a validly-aligned address. Thus, if the end
             // address for a suffix cast (`addr + bytes_len`) is not aligned,
@@ -666,7 +1718,7 @@ macro_rules! __const_debug_assert {
             // Addition is guaranteed not to overflow because `offset <=
             // bytes_len`, and `addr + bytes_len <= usize::MAX` is a
             // precondition of this method. Modulus is guaranteed not to divide
-            // by 0 because `align` is non-zero.
+            // by zero because `self.align` is non-zero.
             #[allow(clippy::arithmetic_side_effects)]
             if (addr + offset) % self.align.get() != 0 {
                 return Err(MetadataCastError::Alignment);
@@ -680,59 +1732,50 @@ macro_rules! __const_debug_assert {
                 }
                 (0, size)
             }
-            SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }) => {
-                // Calculate the maximum number of bytes that could be consumed
-                // - any number of bytes larger than this will either not be a
-                // multiple of the alignment, or will be larger than
-                // `bytes_len`.
-                let max_total_bytes =
-                    util::round_down_to_next_multiple_of_alignment(bytes_len, self.align);
-                // Calculate the maximum number of bytes that could be consumed
-                // by the trailing slice.
-                //
-                // FIXME(#67): Once our MSRV is 1.65, use let-else:
-                // https://blog.rust-lang.org/2022/11/03/Rust-1.65.0.html#let-else-statements
-                let max_slice_and_padding_bytes = match max_total_bytes.checked_sub(offset) {
-                    Some(max) => max,
-                    // `bytes_len` too small even for 0 trailing slice elements.
+            SizeInfo::SliceDst(trailing) => {
+                let max_slice_bytes = match trailing.max_trailing_bytes(bytes_len) {
+                    Some(bytes) => bytes,
                     None => return Err(MetadataCastError::Size),
                 };
-
                 // Calculate the number of elements that fit in
-                // `max_slice_and_padding_bytes`; any remaining bytes will be
-                // considered padding.
+                // `max_slice_bytes`. Any remaining input bytes stay outside
+                // the selected object unless the object's own rounding
+                // operation consumes them as padding.
                 //
                 // Guaranteed not to divide by zero: `elem_size` is non-zero.
-                #[allow(clippy::arithmetic_side_effects)]
-                let elems = max_slice_and_padding_bytes / elem_size.get();
-                // Guaranteed not to overflow on multiplication: `usize::MAX >=
-                // max_slice_and_padding_bytes >= (max_slice_and_padding_bytes /
-                // elem_size) * elem_size`.
+                let (elems, _) = max_elems_for_bytes(max_slice_bytes, trailing.elem_size);
+                // The remainder is `max_slice_bytes - elems * elem_size`.
+                // Writing it as a remainder exposes its bound to the
+                // optimizer: when `elem_size <= size_align`, rounding the
+                // remainder down to `size_align` always gives zero.
+                let size_align = trailing.size_rounding_align_and_phase.align();
+                // `size_phase + max_slice_bytes == max_rounded_bytes`, an
+                // alignment multiple. The selected tail removes `unused_bytes`
+                // from this boundary; rounding back up removes only whole
+                // alignment units. Thus its normalized rounded size is:
                 //
-                // Guaranteed not to overflow on addition:
-                // - max_slice_and_padding_bytes == max_total_bytes - offset
-                // - elems * elem_size <= max_slice_and_padding_bytes == max_total_bytes - offset
-                // - elems * elem_size + offset <= max_total_bytes <= usize::MAX
-                #[allow(clippy::arithmetic_side_effects)]
-                let without_padding = offset + elems * elem_size.get();
-                // `self_bytes` is equal to the offset bytes plus the bytes
-                // consumed by the trailing slice plus any padding bytes
-                // required to satisfy the alignment. Note that we have computed
-                // the maximum number of trailing slice elements that could fit
-                // in `self_bytes`, so any padding is guaranteed to be less than
-                // the size of an extra element.
+                //   round_up(size_phase + elems * elem_size, size_align)
+                //       = max_rounded_bytes - round_down(unused_bytes, size_align)
                 //
-                // Guaranteed not to overflow:
-                // - By previous comment: without_padding == elems * elem_size +
-                //   offset <= max_total_bytes
-                // - By construction, `max_total_bytes` is a multiple of
-                //   `self.align`.
-                // - At most, adding padding needed to round `without_padding`
-                //   up to the next multiple of the alignment will bring
-                //   `self_bytes` up to `max_total_bytes`.
+                // `prove_slice_dst_validator_selected_size_fits` checks this
+                // identity and its intermediate bounds, using the relations
+                // in `prove_max_trailing_bytes_components`. The capacity is
+                // exact by `prove_max_trailing_bytes`; the element helper's
+                // contract establishes the largest whole-element count.
                 #[allow(clippy::arithmetic_side_effects)]
-                let self_bytes =
-                    without_padding + util::padding_needed_for(without_padding, self.align);
+                let unused_bytes = max_slice_bytes % trailing.elem_size.get();
+                let unused_aligned_bytes =
+                    util::round_down_to_next_multiple_of_alignment(unused_bytes, size_align);
+                #[allow(clippy::arithmetic_side_effects)]
+                let max_rounded_bytes = util::round_down_to_next_multiple_of_alignment(
+                    bytes_len - trailing.size_base,
+                    size_align,
+                );
+                // `unused_aligned_bytes <= unused_bytes <= max_slice_bytes
+                // <= max_rounded_bytes`, and `size_base + max_rounded_bytes
+                // <= bytes_len`, so neither operation can overflow.
+                #[allow(clippy::arithmetic_side_effects)]
+                let self_bytes = trailing.size_base + (max_rounded_bytes - unused_aligned_bytes);
                 (elems, self_bytes)
             }
         };
@@ -745,7 +1788,7 @@ macro_rules! __const_debug_assert {
             // - In the `Sized` branch, only returns `size` if `size <=
             //   bytes_len`.
             // - In the `SliceDst` branch, calculates `self_bytes <=
-            //   max_toatl_bytes`, which is upper-bounded by `bytes_len`.
+            //   bytes_len`.
             #[allow(clippy::arithmetic_side_effects)]
             CastType::Suffix => bytes_len - self_bytes,
         };
@@ -754,6 +1797,95 @@ macro_rules! __const_debug_assert {
     }
 }
 
+/// Computes the affine destination-metadata map.
+///
+/// # Safety
+///
+/// `base + metadata * multiple`, evaluated over the mathematical nonnegative
+/// integers, must not exceed `usize::MAX`.
+#[inline(always)]
+#[allow(unstable_name_collisions)]
+#[cfg_attr(kani, kani::requires(metadata.checked_mul(multiple)
+    .and_then(|scaled| base.checked_add(scaled)).is_some()))]
+#[cfg_attr(kani, kani::ensures(|&result| {
+    metadata.checked_mul(multiple).and_then(|scaled| base.checked_add(scaled)) == Some(result)
+}))]
+unsafe fn add_scaled_metadata(base: usize, metadata: usize, multiple: usize) -> usize {
+    // The call-site safety argument establishes that both operations are
+    // representable for valid source metadata. This harness verifies the
+    // production implementation selected by Kani's modern rustc against
+    // checked arithmetic under precisely that precondition. The distributive
+    // natural-number argument which establishes the precondition is kept
+    // beside the unsafe pointer projection where it can be reviewed with the
+    // layout premises that it consumes.
+    #[cfg(kani)]
+    #[kani::proof_for_contract(add_scaled_metadata)]
+    #[kani::solver(kissat)]
+    fn proof() {
+        let base: usize = kani::any();
+        let metadata: usize = kani::any();
+        let multiple: usize = kani::any();
+        let Some(scaled) = metadata.checked_mul(multiple) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(expected) = base.checked_add(scaled) else {
+            kani::assume(false);
+            loop {}
+        };
+
+        // SAFETY: The checked operations above returned `Some`, so the
+        // operation is representable in `usize`. The standard-library
+        // contracts say that this rules out undefined behavior for both
+        // unchecked operations [1][2].
+        //
+        // [1] Per https://doc.rust-lang.org/1.93.1/std/primitive.usize.html#method.unchecked_mul:
+        //
+        //   This results in undefined behavior [..] when `checked_mul` would
+        //   return `None`.
+        //
+        // [2] Per https://doc.rust-lang.org/1.93.1/std/primitive.usize.html#method.unchecked_add:
+        //
+        //   This results in undefined behavior [..] when `checked_add` would
+        //   return `None`.
+        assert_eq!(unsafe { add_scaled_metadata(base, metadata, multiple) }, expected);
+    }
+
+    #[allow(unused_imports)]
+    use crate::util::polyfills::*;
+
+    // SAFETY: The caller promises that `base + metadata * multiple` is
+    // representable over the nonnegative integers. Thus `metadata * multiple`
+    // is representable too. On toolchains with inherent unchecked arithmetic,
+    // this is exactly the condition under which `usize::unchecked_mul` does
+    // not have undefined behavior [1]. On older supported toolchains, method
+    // resolution selects `polyfills::NumExt::unchecked_mul`, whose safety
+    // contract requires the same no-overflow condition. Kani checks the two
+    // implementations in separate harnesses.
+    //
+    // [1] Per https://doc.rust-lang.org/1.93.1/std/primitive.usize.html#method.unchecked_mul:
+    //
+    //   This results in undefined behavior when `self * rhs > usize::MAX` or
+    //   `self * rhs < usize::MIN`, i.e. when `checked_mul` would return `None`.
+    //
+    let scaled = unsafe { metadata.unchecked_mul(multiple) };
+
+    // SAFETY: The caller promises that `base + metadata * multiple` is
+    // representable in `usize`, and `scaled == metadata * multiple`. On
+    // toolchains with inherent unchecked arithmetic, that is exactly the
+    // condition under which `usize::unchecked_add` does not have undefined
+    // behavior [1]. On older supported toolchains, method resolution selects
+    // `polyfills::NumExt::unchecked_add`, whose safety contract requires the
+    // same no-overflow condition. Kani checks the two implementations in
+    // separate harnesses.
+    //
+    // [1] Per https://doc.rust-lang.org/1.93.1/std/primitive.usize.html#method.unchecked_add:
+    //
+    //   This results in undefined behavior when `self + rhs > usize::MAX` or
+    //   `self + rhs < usize::MIN`, i.e. when `checked_add` would return `None`.
+    unsafe { base.unchecked_add(scaled) }
+}
+
 pub(crate) use cast_from::CastFrom;
 mod cast_from {
     use crate::*;
@@ -823,52 +1955,19 @@ enum CastParamsInner {
                 // - If this is possible, any information necessary to perform
                 //   the `Src`->`Dst` metadata conversion at runtime.
                 //
-                // Assume that `Src` and `Dst` are slice DSTs, and define:
-                // - `S_OFF = Src::LAYOUT.size_info.offset`
-                // - `S_ELEM = Src::LAYOUT.size_info.elem_size`
-                // - `D_OFF = Dst::LAYOUT.size_info.offset`
-                // - `D_ELEM = Dst::LAYOUT.size_info.elem_size`
-                //
-                // We are trying to solve the following equation:
-                //
-                //   D_OFF + d_meta * D_ELEM = S_OFF + s_meta * S_ELEM
-                //
-                // At runtime, we will be attempting to compute `d_meta`, given
-                // `s_meta` (a runtime value) and all other parameters (which
-                // are compile-time values). We can solve like so:
-                //
-                //   D_OFF + d_meta * D_ELEM = S_OFF + s_meta * S_ELEM
-                //
-                //   d_meta * D_ELEM = S_OFF - D_OFF + s_meta * S_ELEM
-                //
-                //   d_meta = (S_OFF - D_OFF + s_meta * S_ELEM)/D_ELEM
-                //
-                // Since `d_meta` will be a `usize`, we need the right-hand side
-                // to be an integer, and this needs to hold for *any* value of
-                // `s_meta` (in order for our conversion to be infallible - ie,
-                // to not have to reject certain values of `s_meta` at runtime).
-                // This means that:
-                //
-                // - `s_meta * S_ELEM` must be a multiple of `D_ELEM`
-                // - Since this must hold for any value of `s_meta`, `S_ELEM`
-                //   must be a multiple of `D_ELEM`
-                // - `S_OFF - D_OFF` must be a multiple of `D_ELEM`
-                //
-                // Thus, let `OFFSET_DELTA_ELEMS = (S_OFF - D_OFF)/D_ELEM` and
-                // `ELEM_MULTIPLE = S_ELEM/D_ELEM`. We can rewrite the above
-                // expression as:
-                //
-                //   d_meta = (S_OFF - D_OFF + s_meta * S_ELEM)/D_ELEM
+                // For slice DSTs, destination metadata is an affine function
+                // of source metadata:
                 //
-                //   d_meta = OFFSET_DELTA_ELEMS + s_meta * ELEM_MULTIPLE
+                //   dst_meta = offset_delta_elems + src_meta * elem_multiple
                 //
-                // Thus, we just need to compute the following and confirm that
-                // they have integer solutions in order to both a) determine
-                // whether infallible `Src` -> `Dst` casts are possible and, b)
-                // pre-compute the parameters necessary to perform those casts
-                // at runtime. These parameters are encapsulated in
-                // `CastParams`, which acts as a witness that such infallible
-                // casts are possible.
+                // `elem_multiple` scales the destination's trailing element
+                // size to the source's. `offset_delta_elems` selects a
+                // destination size equal to the source's zero-element size.
+                // We then prove that the two complete rounded size formulas
+                // produce the same sequence for all metadata. This is
+                // necessary because a packed outer DST can retain a nested
+                // field's rounding operation; comparing only physical
+                // trailing-slice offsets is not sufficient.
                 /// The parameters required in order to perform an
                 /// unsized-to-unsized pointer cast from `Src` to `Dst` as
                 /// described above.
@@ -910,15 +2009,60 @@ fn clone(&self) -> Self {
             }
 
             impl<Src: ?Sized, Dst: ?Sized> CastParams<Src, Dst> {
+                /// Given a nonzero `dst.elem_size` that exactly divides
+                /// `src.elem_size`, produces `true` only when the following
+                /// metadata map preserves the complete object size for every
+                /// source element count `src_meta`:
+                ///
+                /// ```text
+                /// dst_meta = dst_base + src_meta * (src.elem_size / dst.elem_size)
+                /// ```
+                ///
+                /// This recognizes sufficient conditions for equality. A
+                /// `false` result also includes equivalent size sequences
+                /// that this test cannot recognize, or an adjustment whose
+                /// normalized components cannot be represented in `usize`.
+                const fn size_sequences_match(
+                    src: TrailingSliceLayout,
+                    dst: TrailingSliceLayout,
+                    dst_base: usize,
+                ) -> bool {
+                    let base_bytes = match dst_base.checked_mul(dst.elem_size) {
+                        Some(bytes) => bytes,
+                        None => return false,
+                    };
+                    let shifted_dst = match dst.advance(base_bytes, src.elem_size) {
+                        Some(layout) => layout,
+                        None => return false,
+                    };
+                    src.has_same_size_sequence(shifted_dst)
+                }
+
+                /// Given the complete layouts of `Src` and `Dst`, produces
+                /// parameters for a cast that preserves object size.
+                ///
+                /// A `Some` result establishes that `Src`'s alignment is at
+                /// least `Dst`'s and that the metadata map preserves size for
+                /// every valid source metadata value.
+                ///
+                /// Supports casts between sized types of equal size, from a
+                /// sized type to a slice DST, and between slice DSTs. A slice
+                /// DST destination must have nonzero-sized elements; between
+                /// slice DSTs, its element size must exactly divide the
+                /// source's nonzero element size.
+                ///
+                /// Produces `None` for unsupported casts or when this method
+                /// cannot establish a size-preserving metadata map. Rejection
+                /// does not establish that no such map exists.
                 const fn try_compute(
-                    src: &DstLayout,
-                    dst: &DstLayout,
+                    src_layout: &DstLayout,
+                    dst_layout: &DstLayout,
                 ) -> Option<CastParams<Src, Dst>> {
-                    if src.align.get() < dst.align.get() {
+                    if src_layout.align.get() < dst_layout.align.get() {
                         return None;
                     }
 
-                    let inner = match (src.size_info, dst.size_info) {
+                    let inner = match (src_layout.size_info, dst_layout.size_info) {
                         (
                             SizeInfo::Sized { size: src_size },
                             SizeInfo::Sized { size: dst_size },
@@ -931,82 +2075,79 @@ const fn try_compute(
                             // dst_size`.
                             CastParamsInner::SizedToSized
                         }
-                        (SizeInfo::Sized { size: src_size }, SizeInfo::SliceDst(dst)) => {
-                            let offset_delta = if let Some(od) = src_size.checked_sub(dst.offset) {
-                                od
-                            } else {
-                                return None;
-                            };
-
-                            let dst_elem_size = if let Some(e) = NonZeroUsize::new(dst.elem_size) {
-                                e
-                            } else {
-                                return None;
+                        (SizeInfo::Sized { size: src_size }, SizeInfo::SliceDst(_)) => {
+                            let dst_meta = match dst_layout.metadata_for_exact_size(src_size) {
+                                Some(meta) => meta,
+                                None => return None,
                             };
 
-                            // PANICS: `dst_elem_size: NonZeroUsize`, so this won't
-                            // divide by zero.
-                            #[allow(clippy::arithmetic_side_effects)]
-                            let delta_mod_other_elem = offset_delta % dst_elem_size.get();
-
-                            if delta_mod_other_elem != 0 {
-                                return None;
-                            }
-
-                            // PANICS: `dst_elem_size: NonZeroUsize`, so this won't
-                            // divide by zero.
-                            #[allow(clippy::arithmetic_side_effects)]
-                            let dst_meta = offset_delta / dst_elem_size.get();
-
                             // SAFETY: The preceding math ensures that a `Dst`
                             // with `dst_meta` addresses `src_size` bytes.
                             CastParamsInner::SizedToUnsized { dst_meta }
                         }
                         (SizeInfo::SliceDst(src), SizeInfo::SliceDst(dst)) => {
-                            let offset_delta = if let Some(od) = src.offset.checked_sub(dst.offset)
-                            {
-                                od
-                            } else {
-                                return None;
-                            };
-
                             let dst_elem_size = if let Some(e) = NonZeroUsize::new(dst.elem_size) {
                                 e
                             } else {
                                 return None;
                             };
 
-                            // PANICS: `dst_elem_size: NonZeroUsize`, so this won't
-                            // divide by zero.
-                            #[allow(clippy::arithmetic_side_effects)]
-                            let delta_mod_other_elem = offset_delta % dst_elem_size.get();
-
-                            // PANICS: `dst_elem_size: NonZeroUsize`, so this won't
-                            // divide by zero.
-                            #[allow(clippy::arithmetic_side_effects)]
-                            let elem_remainder = src.elem_size % dst_elem_size.get();
-
-                            if delta_mod_other_elem != 0
-                                || src.elem_size < dst.elem_size
-                                || elem_remainder != 0
-                            {
+                            if src.elem_size < dst.elem_size {
                                 return None;
                             }
 
-                            // PANICS: `dst_elem_size: NonZeroUsize`, so this won't
-                            // divide by zero.
-                            #[allow(clippy::arithmetic_side_effects)]
-                            let offset_delta_elems = offset_delta / dst_elem_size.get();
+                            let (elem_multiple, described_src_elem_size) =
+                                super::max_elems_for_bytes(src.elem_size, dst_elem_size);
+                            if described_src_elem_size != src.elem_size {
+                                return None;
+                            }
 
-                            // PANICS: `dst_elem_size: NonZeroUsize`, so this won't
-                            // divide by zero.
-                            #[allow(clippy::arithmetic_side_effects)]
-                            let elem_multiple = src.elem_size / dst_elem_size.get();
+                            // Prefer an exact destination-element adjustment
+                            // between `src.size_offset()` and
+                            // `dst.size_offset()`. This preserves offset-based
+                            // cast compatibility and metadata selection when
+                            // several lengths have the same rounded size. It
+                            // also avoids choosing a length whose subsequent
+                            // padding sequence differs from the source's.
+                            let exact_offset_delta_elems =
+                                match src.size_offset().checked_sub(dst.size_offset()) {
+                                    Some(delta) => {
+                                        let (elems, described_delta) =
+                                            super::max_elems_for_bytes(delta, dst_elem_size);
+                                        if described_delta == delta {
+                                            Some(elems)
+                                        } else {
+                                            None
+                                        }
+                                    }
+                                    None => None,
+                                };
+
+                            let offset_delta_elems = match exact_offset_delta_elems {
+                                Some(elems) if Self::size_sequences_match(src, dst, elems) => elems,
+                                _ => {
+                                    let src_zero_size = match src.size_for_elems(0) {
+                                        Some(size) => size,
+                                        None => return None,
+                                    };
+                                    let elems =
+                                        match dst_layout.metadata_for_exact_size(src_zero_size) {
+                                            Some(elems) => elems,
+                                            None => return None,
+                                        };
+                                    if !Self::size_sequences_match(src, dst, elems) {
+                                        return None;
+                                    }
+                                    elems
+                                }
+                            };
 
                             CastParamsInner::UnsizedToUnsized {
-                                // SAFETY: We checked above that this is an exact ratio.
+                                // SAFETY: `size_sequences_match` proves that
+                                // this affine metadata map preserves size.
                                 offset_delta_elems,
-                                // SAFETY: We checked above that this is an exact ratio.
+                                // SAFETY: We checked above that this is an exact
+                                // ratio of source to destination element size.
                                 elem_multiple,
                             }
                         }
@@ -1019,40 +2160,77 @@ const fn try_compute(
             }
 
             impl<Src: KnownLayout + ?Sized, Dst: KnownLayout + ?Sized> CastParams<Src, Dst> {
+                /// Produces `Dst` metadata describing an object of the same
+                /// size as the `Src` described by `src_meta`.
+                ///
                 /// # Safety
                 ///
                 /// `src_meta` describes a `Src` whose size is no larger than
                 /// `isize::MAX`.
-                ///
-                /// The returned metadata describes a `Dst` of the same size as
-                /// the original `Src`.
                 #[inline(always)]
                 unsafe fn cast_metadata(
                     self,
                     src_meta: Src::PointerMetadata,
                 ) -> Dst::PointerMetadata {
-                    #[allow(unused)]
-                    use crate::util::polyfills::*;
-
                     let dst_meta = match self.inner {
                         CastParamsInner::UnsizedToUnsized { offset_delta_elems, elem_multiple } => {
                             let src_meta = src_meta.to_elem_count();
-                            #[allow(
-                                unstable_name_collisions,
-                                clippy::multiple_unsafe_ops_per_block
-                            )]
-                            // SAFETY: `self` is a witness that the following
-                            // equation holds:
+                            // SAFETY: `self` witnesses that this affine map
+                            // makes `Src` and `Dst`'s complete rounded size
+                            // formulas equal for every source metadata value.
+                            // Interpret the arithmetic in this proof over the
+                            // mathematical nonnegative integers. Since the
+                            // caller promises that `src_meta` is valid `Src`
+                            // metadata, the source object size `src_size` it
+                            // describes is at most `isize::MAX`. Let
+                            // `src_elem_size` and `dst_elem_size` be the
+                            // respective trailing-slice element sizes. Then:
+                            //
+                            //   src_meta * src_elem_size
+                            //       <= src_size <= isize::MAX.
+                            //
+                            // Since `elem_multiple` is the exact ratio
+                            // `src_elem_size / dst_elem_size` and
+                            // `dst_elem_size >= 1`,
                             //
-                            //   D_OFF + d_meta * D_ELEM = S_OFF + s_meta * S_ELEM
+                            //   src_meta * elem_multiple
+                            //       <= src_meta * src_elem_size
+                            //       <= isize::MAX <= usize::MAX.
                             //
-                            // Since the caller promises that `src_meta` is
-                            // valid `Src` metadata, this math will not
-                            // overflow, and the returned value will describe a
-                            // `Dst` of the same size.
+                            // Thus `scaled_elems = src_meta * elem_multiple`
+                            // is representable, and its byte contribution is
+                            // `scaled_elems * dst_elem_size = src_meta *
+                            // src_elem_size`. Let `base_bytes =
+                            // offset_delta_elems * dst_elem_size`.
+                            // `size_sequences_match` compares the source
+                            // formula with the destination formula advanced by
+                            // `base_bytes`. The latter's unrounded term
+                            // contains `base_bytes + src_meta * src_elem_size`,
+                            // and its complete size is at least that large
+                            // (formally checked by Kani in
+                            // `prove_size_formula_bounds_size_offset`).
+                            // Sequence equality therefore gives, over the
+                            // mathematical nonnegative integers,
+                            //
+                            //   base_bytes + src_meta * src_elem_size
+                            //       = (offset_delta_elems + scaled_elems)
+                            //           * dst_elem_size
+                            //       <= src_size.
+                            //
+                            // Since `dst_elem_size >= 1`, the metadata sum
+                            // `offset_delta_elems + scaled_elems` is also at
+                            // most `src_size`, and thus at most `isize::MAX <=
+                            // usize::MAX`. The sum is therefore representable,
+                            // and the returned metadata describes a `Dst` of
+                            // the same size.
+                            // SAFETY: The bounds above establish the helper's
+                            // complete no-overflow precondition.
                             unsafe {
-                                offset_delta_elems
-                                    .unchecked_add(src_meta.unchecked_mul(elem_multiple))
+                                super::add_scaled_metadata(
+                                    offset_delta_elems,
+                                    src_meta,
+                                    elem_multiple,
+                                )
                             }
                         }
                         CastParamsInner::SizedToUnsized { dst_meta } => dst_meta,
@@ -1095,6 +2273,55 @@ impl<Src, Dst> Params<Src> for Dst
     }
 }
 
+#[cfg(any(test, all(kani, feature = "derive")))]
+mod padding_testutil {
+    use crate::KnownLayout;
+
+    #[derive(KnownLayout)]
+    #[repr(C, align(4))]
+    pub(super) struct Aligned<Prefix, Tail: ?Sized> {
+        pub(super) prefix: Prefix,
+        pub(super) tail: Tail,
+    }
+
+    /// Compare direct padding with the complete size minus the slice end.
+    /// Counts whose complete object size exceeds `usize::MAX` are omitted.
+    pub(super) fn check_padding_for_elems<Target>(elems: usize) -> Option<usize>
+    where
+        Target: ?Sized + KnownLayout<PointerMetadata = usize>,
+    {
+        let layout = crate::trailing_slice_layout::<Target>();
+        let trailing_size = elems.checked_mul(layout.elem_size)?;
+
+        // Evaluate the complete rounded size independently of both helpers:
+        // `size_for_elems` delegates to the padding method being tested.
+        let (alignment, phase) = layout.size_rounding_align_and_phase.components();
+        #[allow(clippy::arithmetic_side_effects)]
+        let mask = alignment.get() - 1;
+        let unrounded = phase.checked_add(trailing_size)?;
+        let rounded = unrounded.checked_add(mask)? & !mask;
+        let object_size = layout.size_base.checked_add(rounded)?;
+        let trailing_end = layout.offset.checked_add(trailing_size).unwrap();
+        let expected = object_size.checked_sub(trailing_end).unwrap();
+
+        let padding = layout.padding_for_elems(elems);
+        assert_eq!(padding, expected);
+        Some(padding)
+    }
+
+    pub(super) fn check_layouts(elems: usize) {
+        // Slices have no trailing padding. The aligned fixtures cover
+        // zero and nonzero phases, a three-byte element whose padding
+        // cycles with the element count, and zero-sized elements.
+        let _ = check_padding_for_elems::<[u8]>(elems);
+        let _ = check_padding_for_elems::<[()]>(elems);
+        let _ = check_padding_for_elems::<Aligned<[u8; 8], [u8]>>(elems);
+        let _ = check_padding_for_elems::<Aligned<[u8; 9], [u8]>>(elems);
+        let _ = check_padding_for_elems::<Aligned<[u8; 9], [[u8; 3]]>>(elems);
+        let _ = check_padding_for_elems::<Aligned<[u8; 9], [()]>>(elems);
+    }
+}
+
 // FIXME(#67): For some reason, on our MSRV toolchain, this `allow` isn't
 // enforced despite having `#![allow(unknown_lints)]` at the crate root, but
 // putting it here works. Once our MSRV is high enough that this bug has been
@@ -1103,12 +2330,560 @@ impl<Src, Dst> Params<Src> for Dst
 #[cfg(test)]
 mod tests {
     use super::*;
+    use crate::PointerMetadata as _;
+
+    /// Models the size of nested `repr(C)` structs ending in a slice.
+    ///
+    /// `leading` lists structs from outermost to innermost. Each tuple gives
+    /// the packing factor, minimum alignment, and prefix size before padding
+    /// for the final field. `trailing_elem_size` and `trailing_alignment` give
+    /// the slice element size and alignment. An empty `leading` describes the
+    /// slice itself.
+    ///
+    /// The returned closure maps a slice length to the complete size, including
+    /// padding at every nesting level. It returns `None` only on `usize`
+    /// overflow; sizes above `isize::MAX` are permitted by this arithmetic model.
+    /// Packing affects field placement, preserving each field's internal
+    /// padding, even for descriptors that Rust would reject as types.
+    ///
+    /// # Panics
+    ///
+    /// Panics if any alignment or packing factor is not a power of two, a
+    /// minimum alignment exceeds its packing factor, or the element size is
+    /// not a multiple of the slice alignment.
+    fn size_for_metadata_model(
+        leading: &[(NonZeroUsize, NonZeroUsize, usize)],
+        trailing_elem_size: usize,
+        trailing_alignment: NonZeroUsize,
+    ) -> impl Fn(usize) -> Option<usize> + '_ {
+        // Rust requires power-of-two alignments and sizes divisible by their
+        // alignment [1]; alignment modifiers also take powers of two [2].
+        //
+        // [1] https://doc.rust-lang.org/1.93.0/reference/type-layout.html#size-and-alignment
+        // [2] https://doc.rust-lang.org/1.93.0/reference/type-layout.html#the-alignment-modifiers
+        assert!(trailing_alignment.get().is_power_of_two());
+        assert_eq!(trailing_elem_size % trailing_alignment, 0);
+        for &(packed, align, _) in leading {
+            assert!(packed.get().is_power_of_two());
+            assert!(align.get().is_power_of_two());
+            // The descriptor requires its minimum to fit under the packing
+            // cap. It also models combinations that Rust forbids, including
+            // simultaneous `align` and `packed` modifiers [2].
+            assert!(align <= packed);
+        }
+
+        move |elems| {
+            // A slice shares its array section's layout [3]. Array size is
+            // element size times length, with the element's alignment [4].
+            //
+            // [3] https://doc.rust-lang.org/1.93.0/reference/type-layout.html#slice-layout
+            // [4] https://doc.rust-lang.org/1.93.0/reference/type-layout.html#array-layout
+            let mut size = trailing_elem_size.checked_mul(elems)?;
+            let mut alignment = trailing_alignment;
+
+            // Work outward with each field's complete size, including its
+            // trailing padding: an enclosing representation "does not change
+            // the layout of the fields themselves" [5]. Thus packing a nested
+            // field preserves the padding already included in `size`.
+            //
+            // [5] https://doc.rust-lang.org/1.93.0/reference/type-layout.html#representations
+            for &(packed, align, prefix) in leading.iter().rev() {
+                // Packing caps the field's alignment for placement [2].
+                let field_align = alignment.min(packed);
+
+                // `repr(C)` places the next field at an aligned offset [6];
+                // packing requires the least sufficient inter-field padding
+                // [2]. Here `prefix` is the end of the preceding fields.
+                //
+                // [6] https://doc.rust-lang.org/1.93.0/reference/type-layout.html#reprc-structs
+                let offset = prefix.checked_add(util::padding_needed_for(prefix, field_align))?;
+
+                // `repr(C)` uses the greatest field alignment [6], and an
+                // explicit alignment can only raise it [2]. Here `align`
+                // summarizes the minimum from the prefix and any explicit
+                // alignment. Both operands are <= `packed`, so their maximum
+                // also respects the packing cap.
+                alignment = align.max(field_align);
+
+                // Advance past the complete field, then round to the struct's
+                // alignment, following `repr(C)`'s final sizing steps [6].
+                size = offset.checked_add(size)?;
+                size = size.checked_add(util::padding_needed_for(size, alignment))?;
+            }
+            // Each enclosing size is at least its field's size. Thus any
+            // checked multiplication or addition that overflowed above would
+            // also make the final size unrepresentable in `usize`.
+            Some(size)
+        }
+    }
+
+    /// Computes [`size_for_metadata_model`]'s size function using `DstLayout`.
+    ///
+    /// Layout construction uses [`DstLayout::for_repr_c_struct`], and the
+    /// returned closure uses [`crate::PointerMetadata::size_for_metadata`].
+    ///
+    /// # Panics
+    ///
+    /// Panics for invalid descriptors as in [`size_for_metadata_model`], or if
+    /// `DstLayout` cannot construct the layout. This includes static size
+    /// overflow and, in debug builds, alignments or packing factors above
+    /// [`DstLayout::CURRENT_MAX_ALIGN`].
+    fn size_for_metadata_via_dst_layout(
+        leading: &[(NonZeroUsize, NonZeroUsize, usize)],
+        trailing_elem_size: usize,
+        trailing_alignment: NonZeroUsize,
+    ) -> impl Fn(usize) -> Option<usize> + '_ {
+        assert_eq!(trailing_elem_size % trailing_alignment, 0);
+        let mut layout = DstLayout {
+            align: trailing_alignment,
+            size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                offset: 0,
+                elem_size: trailing_elem_size,
+                size_base: 0,
+                size_rounding_align_and_phase: RoundingAlignAndPhase::new(trailing_alignment, 0),
+            }),
+            statically_shallow_unpadded: true,
+        };
+        for &(packed, align, prefix) in leading.iter().rev() {
+            assert!(align <= packed);
+            let prefix = DstLayout {
+                align: DstLayout::MIN_ALIGN,
+                size_info: SizeInfo::Sized { size: prefix },
+                statically_shallow_unpadded: true,
+            };
+            layout = DstLayout::for_repr_c_struct(Some(align), Some(packed), &[prefix, layout]);
+        }
+        move |elems: usize| elems.size_for_metadata(layout)
+    }
+
+    #[test]
+    fn test_model_via_dst_layout() {
+        let nz = |n| NonZeroUsize::new(n).unwrap();
+        let cases: &[&[_]] = &[
+            &[],
+            &[(nz(8), nz(1), 3)],
+            &[(nz(8), nz(8), 3)],
+            &[(nz(2), nz(1), 1), (nz(8), nz(8), 3)],
+            &[(nz(8), nz(8), 1), (nz(2), nz(1), 3), (nz(8), nz(8), 5)],
+            &[(nz(1), nz(1), 1), (nz(2), nz(2), 3), (nz(8), nz(8), 5)],
+        ];
+        for &leading in cases {
+            for &(elem_size, alignment) in &[(0, 1), (0, 8), (1, 1), (2, 2), (3, 1), (8, 8)] {
+                let alignment = nz(alignment);
+                let expected = size_for_metadata_model(leading, elem_size, alignment);
+                let actual = size_for_metadata_via_dst_layout(leading, elem_size, alignment);
+                let max_elems = usize::MAX / elem_size.max(1);
+                for elems in (0..32).chain([
+                    max_elems - 1,
+                    max_elems,
+                    max_elems.saturating_add(1),
+                    usize::MAX,
+                ]) {
+                    assert_eq!(
+                        actual(elems),
+                        expected(elems),
+                        "leading: {:?}, trailing: {:?}, elems: {}",
+                        leading,
+                        (elem_size, alignment),
+                        elems,
+                    );
+                }
+            }
+        }
+
+        for prefix in [usize::MAX - 1, usize::MAX] {
+            let leading = [(nz(1), nz(1), prefix)];
+            let expected = size_for_metadata_model(&leading, 1, nz(1));
+            let actual = size_for_metadata_via_dst_layout(&leading, 1, nz(1));
+            for elems in [0, 1, 2] {
+                assert_eq!(actual(elems), expected(elems));
+            }
+        }
+    }
+
+    // This exercises arithmetic rather than unsafe operations; keep the
+    // smaller comparison test enabled under Miri instead of this large search.
+    #[test]
+    #[cfg_attr(miri, ignore)]
+    fn test_model_via_dst_layout_combinations() {
+        use rand::{rngs::SmallRng, Rng as _, SeedableRng as _};
+
+        fn check(
+            leading: &[(NonZeroUsize, NonZeroUsize, usize)],
+            trailing_elem_size: usize,
+            trailing_alignment: NonZeroUsize,
+        ) {
+            let expected = size_for_metadata_model(leading, trailing_elem_size, trailing_alignment);
+            assert!(
+                expected(0).is_some(),
+                "unrepresentable test layout: {:?}, {:?}",
+                leading,
+                (trailing_elem_size, trailing_alignment)
+            );
+            let actual = std::panic::catch_unwind(|| {
+                size_for_metadata_via_dst_layout(leading, trailing_elem_size, trailing_alignment)
+            })
+            .unwrap_or_else(|_| {
+                panic!(
+                    "DstLayout rejected leading: {:?}, trailing: {:?}",
+                    leading,
+                    (trailing_elem_size, trailing_alignment)
+                )
+            });
+            let compare = |elems| {
+                let expected = expected(elems);
+                assert_eq!(
+                    actual(elems),
+                    expected,
+                    "leading: {:?}, trailing: {:?}, elems: {}",
+                    leading,
+                    (trailing_elem_size, trailing_alignment),
+                    elems,
+                );
+                expected
+            };
+
+            let first_sixteen = 0..=16;
+            let pointer_width = (0..POINTER_WIDTH_BITS).step_by(4).flat_map(|shift| {
+                let elems = 1usize << shift;
+                [elems - 1, elems, elems + 1]
+            });
+            let last_two = (usize::MAX - 1)..=usize::MAX;
+            let elemses = first_sixteen.chain(pointer_width).chain(last_two);
+            for elems in elemses {
+                let _ = compare(elems);
+            }
+
+            // The modeled size is nondecreasing. Find the last fitting length,
+            // comparing every probe, then check both sides of that boundary.
+            // Zero-sized elements can remain representable at usize::MAX.
+            let (mut low, mut high) = (0, usize::MAX);
+            while low < high {
+                let distance = high - low;
+                let mid = low + distance / 2 + distance % 2;
+                if compare(mid).is_some() {
+                    low = mid;
+                } else {
+                    high = mid - 1;
+                }
+            }
+            assert!(compare(low).is_some());
+            if let Some(previous) = low.checked_sub(1) {
+                assert!(compare(previous).is_some());
+            }
+            if let Some(next) = low.checked_add(1) {
+                assert_eq!(compare(next), None);
+            }
+        }
+
+        let nz = |n| NonZeroUsize::new(n).unwrap();
+        let check_small_tails = |leading: &[_]| {
+            for alignment in [1, 2, 4, 8] {
+                for multiple in [0, 1, 2, 3, 7] {
+                    check(leading, multiple * alignment, nz(alignment));
+                }
+            }
+        };
+        let mut fragments = Vec::new();
+        for packed in [1, 2, 4] {
+            for align in [1, 2, 4].iter().copied().filter(|&align| align <= packed) {
+                for prefix in 0..=4 {
+                    fragments.push((nz(packed), nz(align), prefix));
+                }
+            }
+        }
+
+        // Exhaust every combination in this small domain at depths 0, 1, 2.
+        check_small_tails(&[]);
+        for &outer in &fragments {
+            check_small_tails(&[outer]);
+            for &inner in &fragments {
+                check_small_tails(&[outer, inner]);
+            }
+        }
+
+        let mut rng = SmallRng::seed_from_u64(0);
+        for depth in (0usize..=128).chain([256, 512, 1024]) {
+            // A small prefix adds at most 4 * max_align bytes per layer.
+            // Reserve half of usize::MAX for a large outermost prefix so
+            // construction remains representable even at the largest depth.
+            let align_limit =
+                DstLayout::CURRENT_MAX_ALIGN.get().min(usize::MAX / (8 * depth.max(1)));
+            let alignments: Vec<_> = (0..POINTER_WIDTH_BITS)
+                .map(|shift| 1usize << shift)
+                .take_while(|&align| align <= align_limit)
+                .collect();
+            let last = alignments.len() - 1;
+            let max_align = alignments[last];
+            for case in 0..40 {
+                let mut leading = Vec::with_capacity(depth);
+                for level in 0..depth {
+                    // Mix arbitrary modifiers, increasing and decreasing
+                    // alignments, alternating packing, and fully packed trees.
+                    let (packed, align) = match case / 8 {
+                        0 => {
+                            let packed = rng.gen_range(0..=last);
+                            (packed, rng.gen_range(0..=packed))
+                        }
+                        1 => (last, level % alignments.len()),
+                        2 => (last, last - level % alignments.len()),
+                        3 => {
+                            let index = if level % 2 == 0 { 0 } else { last };
+                            (index, index)
+                        }
+                        _ => (0, 0),
+                    };
+                    let (packed, align) = (alignments[packed], alignments[align]);
+                    let prefix = if level == 0 && case % 4 == 3 {
+                        usize::MAX / 2 + rng.gen_range(0..=2) - 1
+                    } else {
+                        match rng.gen_range(0..8) {
+                            0 => 0,
+                            1 => 1,
+                            2 => align - 1,
+                            3 => align,
+                            4 => align + 1,
+                            5 => packed - 1,
+                            6 => packed + 1,
+                            _ => rng.gen_range(0..=2 * max_align),
+                        }
+                    };
+                    leading.push((nz(packed), nz(align), prefix));
+                }
+                let alignment = alignments[rng.gen_range(0..=last)];
+                let elem_size = match case % 8 {
+                    0 => 0,
+                    1 => alignment,
+                    2 => 2 * alignment,
+                    3 => 3 * alignment,
+                    4 => 7 * alignment,
+                    5 => 15 * alignment,
+                    6 => (usize::MAX / 2 / alignment) * alignment,
+                    _ => (usize::MAX / alignment) * alignment,
+                };
+                check(&leading, elem_size, nz(alignment));
+            }
+        }
+    }
+
+    const TEST_SIZE_ROUNDING_ALIGN_AND_PHASE_ALIGN: NonZeroUsize = match NonZeroUsize::new(8) {
+        Some(align) => align,
+        None => const_unreachable!(),
+    };
+    const TEST_SIZE_ROUNDING_ALIGN_AND_PHASE: RoundingAlignAndPhase =
+        RoundingAlignAndPhase::new(TEST_SIZE_ROUNDING_ALIGN_AND_PHASE_ALIGN, 3);
+    const TEST_SIZE_ROUNDING_ALIGN_AND_PHASE_DECODED_ALIGN: usize =
+        TEST_SIZE_ROUNDING_ALIGN_AND_PHASE.align().get();
+    const TEST_SIZE_ROUNDING_ALIGN_AND_PHASE_DECODED_PHASE: usize =
+        TEST_SIZE_ROUNDING_ALIGN_AND_PHASE.components().1;
+
+    #[test]
+    #[allow(clippy::arithmetic_side_effects)]
+    fn test_size_rounding_align_and_phase_encoding() {
+        // These constants ensure that encoding and decoding remain evaluable
+        // on every supported compiler, including the MSRV.
+        assert_eq!(TEST_SIZE_ROUNDING_ALIGN_AND_PHASE_DECODED_ALIGN, 8);
+        assert_eq!(TEST_SIZE_ROUNDING_ALIGN_AND_PHASE_DECODED_PHASE, 3);
+
+        for shift in 0..POINTER_WIDTH_BITS {
+            #[allow(clippy::arithmetic_side_effects)]
+            let align = NonZeroUsize::new(1usize << shift).unwrap();
+            for phase in [0, align.get() / 2, align.get() - 1] {
+                let rounding = RoundingAlignAndPhase::new(align, phase);
+                assert_eq!(rounding.align(), align);
+                assert_eq!(rounding.components().1, phase);
+                assert_eq!(rounding.0.get(), align.get() | phase);
+            }
+        }
+
+        let max_align = DstLayout::THEORETICAL_MAX_ALIGN;
+        let max_phase = max_align.get() - 1;
+        let max = RoundingAlignAndPhase::new(max_align, max_phase);
+        assert_eq!(max.0.get(), usize::MAX);
+        assert_eq!(max.align(), max_align);
+        assert_eq!(max.components().1, max_phase);
+
+        assert_eq!(mem::size_of::<TrailingSliceLayout>(), 4 * mem::size_of::<usize>());
+    }
+
+    #[test]
+    #[allow(clippy::arithmetic_side_effects)]
+    fn test_trailing_slice_layout_normal_form() {
+        // Compare the stored base-and-phase formula with
+        // `prefix + round_up(offset + elems * elem_size, align)`, where
+        // `prefix < align`. Move whole alignment-sized chunks of `offset`
+        // into `size_base` and retain the remainder as the phase. Also verify
+        // that `size_offset()` recovers the exact `offset` used by casts to
+        // choose between metadata values with the same rounded object size.
+        for align in [1, 2, 4, 8, 16] {
+            let align = NonZeroUsize::new(align).unwrap();
+            for prefix in 0..align.get() {
+                for offset in 0..32 {
+                    let phase = offset % align;
+                    let size_base = (offset - phase) | prefix;
+                    let layout = TrailingSliceLayout {
+                        offset: 0,
+                        elem_size: 3,
+                        size_base,
+                        size_rounding_align_and_phase: RoundingAlignAndPhase::new(align, phase),
+                    };
+                    assert_eq!(layout.size_offset(), offset);
+
+                    for elems in 0..32 {
+                        let unrounded = offset + elems * layout.elem_size;
+                        let old_size =
+                            prefix + unrounded + util::padding_needed_for(unrounded, align);
+                        assert_eq!(layout.size_for_elems(elems), Some(old_size));
+                    }
+                }
+            }
+        }
+    }
+
+    #[test]
+    #[allow(clippy::arithmetic_side_effects)]
+    fn test_normalized_size_bounds() {
+        // Use checked evaluation as an independent oracle, including layouts
+        // whose empty object is already too large to represent.
+        let checked_size = |layout: TrailingSliceLayout, trailing_bytes: usize| {
+            let (alignment, phase) = layout.size_rounding_align_and_phase.components();
+            let unrounded = phase.checked_add(trailing_bytes)?;
+            let rounded = unrounded.checked_add(util::padding_needed_for(unrounded, alignment))?;
+            layout.size_base.checked_add(rounded)
+        };
+        for exponent in 0..POINTER_WIDTH_BITS {
+            let alignment = NonZeroUsize::new(1usize << exponent).unwrap();
+            for phase in [0, alignment.get() / 2, alignment.get() - 1] {
+                for base in [0, 1, alignment.get() - 1, alignment.get(), usize::MAX - 1, usize::MAX]
+                {
+                    let mut layout = TrailingSliceLayout {
+                        offset: 0,
+                        elem_size: 1,
+                        size_base: base,
+                        size_rounding_align_and_phase: RoundingAlignAndPhase::new(alignment, phase),
+                    };
+                    for available in [0, 1, alignment.get() - 1, alignment.get(), usize::MAX] {
+                        match layout.max_trailing_bytes(available) {
+                            Some(max_bytes) => {
+                                assert!(checked_size(layout, max_bytes).unwrap() <= available);
+                                if let Some(next_bytes) = max_bytes.checked_add(1) {
+                                    assert!(checked_size(layout, next_bytes)
+                                        .map(|size| size > available)
+                                        .unwrap_or(true));
+                                }
+                            }
+                            None => {
+                                assert!(checked_size(layout, 0)
+                                    .map(|size| size > available)
+                                    .unwrap_or(true));
+                            }
+                        }
+                    }
+
+                    for elem_size in [0, 1, 3, alignment.get(), usize::MAX] {
+                        layout.elem_size = elem_size;
+                        let max_elems = layout
+                            .max_trailing_bytes(usize::MAX)
+                            .and_then(|bytes| bytes.checked_div(elem_size))
+                            .unwrap_or(usize::MAX);
+                        for elems in [
+                            0,
+                            1,
+                            max_elems.saturating_sub(1),
+                            max_elems,
+                            max_elems.saturating_add(1),
+                            usize::MAX,
+                        ] {
+                            let expected = elems
+                                .checked_mul(elem_size)
+                                .and_then(|bytes| checked_size(layout, bytes));
+                            // The physical slice offset does not affect
+                            // the size formula. Raw layouts may place the
+                            // slice beyond the object, and adding its byte
+                            // count to the offset may overflow.
+                            for offset in [0, usize::MAX] {
+                                layout.offset = offset;
+                                assert_eq!(layout.size_for_elems(elems), expected);
+                            }
+                        }
+                    }
+                }
+            }
+        }
+    }
+
+    #[test]
+    fn test_padding_for_elems_for_rust_layouts() {
+        use super::padding_testutil::{check_layouts, check_padding_for_elems, Aligned};
+
+        for elems in 0..256 {
+            check_layouts(elems);
+        }
+        let size_limit = usize::MAX;
+        for remaining in 0..16 {
+            check_layouts(size_limit - remaining);
+            check_layouts(size_limit / 3 - remaining);
+        }
+        check_layouts(usize::MAX);
+
+        for (elems, expected) in [(0, 3), (1, 0), (2, 1), (3, 2)] {
+            assert_eq!(
+                check_padding_for_elems::<Aligned<[u8; 9], [[u8; 3]]>>(elems),
+                Some(expected)
+            );
+        }
+        // Every count is valid for zero-sized trailing elements.
+        assert_eq!(check_padding_for_elems::<Aligned<[u8; 9], [()]>>(usize::MAX), Some(3));
+    }
+
+    #[test]
+    fn test_padding_for_elems() {
+        for exponent in 0..POINTER_WIDTH_BITS {
+            let alignment = NonZeroUsize::new(1usize << exponent).unwrap();
+            let mask = alignment.get() - 1;
+            for phase in [0, alignment.get() / 2, mask] {
+                // Include zero-sized elements, a negative fixed term, fixed
+                // padding larger than the alignment, and overflowing sums
+                // and products. Raw layouts need not describe Rust types.
+                for (offset, elem_size, size_base) in [
+                    (0, 0, 0),
+                    (0, 1, 1),
+                    (9, 3, 8),
+                    (3, 3, 0),
+                    (9, 3, 12),
+                    (usize::MAX, usize::MAX, usize::MAX),
+                    (usize::MAX, 0, usize::MAX),
+                ] {
+                    let layout = TrailingSliceLayout {
+                        offset,
+                        elem_size,
+                        size_base,
+                        size_rounding_align_and_phase: RoundingAlignAndPhase::new(alignment, phase),
+                    };
+                    for elems in [0, 1, 2, 3, alignment.get(), usize::MAX] {
+                        // Independently reconstruct the complete rounded
+                        // size and slice end, then subtract. Round up by
+                        // adding the mask and clearing the low bits.
+                        let trailing_bytes = elems.wrapping_mul(elem_size);
+                        let unrounded = phase.wrapping_add(trailing_bytes);
+                        let rounded = unrounded.wrapping_add(mask) & !mask;
+                        let object_size = size_base.wrapping_add(rounded);
+                        let trailing_end = offset.wrapping_add(trailing_bytes);
+                        assert_eq!(
+                            layout.padding_for_elems(elems),
+                            object_size.wrapping_sub(trailing_end),
+                        );
+                    }
+                }
+            }
+        }
+    }
 
     #[test]
     fn test_dst_layout_for_slice() {
         let layout = DstLayout::for_slice::<u32>();
         match layout.size_info {
-            SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }) => {
+            SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size, .. }) => {
                 assert_eq!(offset, 0);
                 assert_eq!(elem_size, 4);
             }
@@ -1121,17 +2896,18 @@ fn test_dst_layout_for_slice() {
     #[allow(clippy::decimal_literal_representation)]
     #[test]
     fn test_dst_layout_extend_sized_with_sized() {
-        // This macro constructs a layout corresponding to a `u8` and extends it
-        // with a zero-sized trailing field of given alignment `n`. The macro
-        // tests that the resulting layout has both size and alignment `min(n,
-        // P)` for all valid values of `repr(packed(P))`.
+        // This macro constructs a layout corresponding to a `u8` and extends
+        // it with a zero-sized trailing field of the specified alignment. The
+        // resulting size and alignment must both be the field's alignment
+        // capped by the packing limit. Exercise every supported packing limit
+        // as well as the absence of a packing limit.
         macro_rules! test_align_is_size {
             ($n:expr) => {
                 let base = DstLayout::for_type::<u8>();
                 let trailing_field = DstLayout::for_type::<elain::Align<$n>>();
 
-                let packs =
-                    core::iter::once(None).chain((0..29).map(|p| NonZeroUsize::new(2usize.pow(p))));
+                let packs = core::iter::once(None)
+                    .chain((0..=29).map(|p| NonZeroUsize::new(2usize.pow(p))));
 
                 for pack in packs {
                     let composite = base.extend(trailing_field, pack);
@@ -1179,6 +2955,7 @@ macro_rules! test_align_is_size {
         test_align_is_size!(33554432);
         test_align_is_size!(134217728);
         test_align_is_size!(268435456);
+        test_align_is_size!(536870912);
     }
 
     /// Tests of when a sized `DstLayout` is extended with a DST field.
@@ -1192,15 +2969,29 @@ fn test_dst_layout_extend_sized_with_dst() {
         let aligns = (0..29).map(|p| NonZeroUsize::new(2usize.pow(p)).unwrap());
         let packs = core::iter::once(None).chain(aligns.clone().map(Some));
 
-        for align in aligns {
+        for field_type_align in aligns {
             for pack in packs.clone() {
                 let base = DstLayout::for_type::<u8>();
                 let elem_size = 42;
                 let trailing_field_offset = 11;
+                #[allow(clippy::arithmetic_side_effects)]
+                let trailing_phase = trailing_field_offset % field_type_align;
+                let trailing_base = util::round_down_to_next_multiple_of_alignment(
+                    trailing_field_offset,
+                    field_type_align,
+                );
 
                 let trailing_field = DstLayout {
-                    align,
-                    size_info: SizeInfo::SliceDst(TrailingSliceLayout { elem_size, offset: 11 }),
+                    align: field_type_align,
+                    size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                        elem_size,
+                        offset: trailing_field_offset,
+                        size_base: trailing_base,
+                        size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                            field_type_align,
+                            trailing_phase,
+                        ),
+                    }),
                     statically_shallow_unpadded: false,
                 };
 
@@ -1208,7 +2999,9 @@ fn test_dst_layout_extend_sized_with_dst() {
 
                 let max_align = pack.unwrap_or(DstLayout::CURRENT_MAX_ALIGN).get();
 
-                let align = align.get().min(max_align);
+                let align = field_type_align.get().min(max_align);
+                let field_offset = align;
+                let size_base = field_offset + trailing_base;
 
                 assert_eq!(
                     composite,
@@ -1216,7 +3009,12 @@ fn test_dst_layout_extend_sized_with_dst() {
                         align: NonZeroUsize::new(align).unwrap(),
                         size_info: SizeInfo::SliceDst(TrailingSliceLayout {
                             elem_size,
-                            offset: align + trailing_field_offset,
+                            offset: field_offset + trailing_field_offset,
+                            size_base,
+                            size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                                field_type_align,
+                                trailing_phase,
+                            ),
                         }),
                         statically_shallow_unpadded: false,
                     }
@@ -1292,7 +3090,8 @@ macro_rules! test {
                 => padded { size: current_max_align * 2, align: current_max_align });
     }
 
-    /// Tests that calling `pad_to_align` on a DST `DstLayout` is a no-op.
+    /// Tests that calling `pad_to_align` on a DST `DstLayout` incorporates the
+    /// type's trailing-padding operation into its runtime size formula.
     #[test]
     fn test_dst_layout_pad_to_align_with_dst() {
         for align in (0..29).map(|p| NonZeroUsize::new(2usize.pow(p)).unwrap()) {
@@ -1300,42 +3099,183 @@ fn test_dst_layout_pad_to_align_with_dst() {
                 for elem_size in 0..10 {
                     let layout = DstLayout {
                         align,
-                        size_info: SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }),
+                        size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                            offset,
+                            elem_size,
+                            size_base: offset,
+                            size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                                DstLayout::MIN_ALIGN,
+                                0,
+                            ),
+                        }),
                         statically_shallow_unpadded: false,
                     };
-                    assert_eq!(layout.pad_to_align(), layout);
+                    assert_eq!(
+                        layout.pad_to_align(),
+                        DstLayout {
+                            align,
+                            size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                                offset,
+                                elem_size,
+                                size_base: offset - offset % align,
+                                size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                                    align,
+                                    offset % align
+                                ),
+                            }),
+                            statically_shallow_unpadded: false,
+                        }
+                    );
                 }
             }
         }
-    }
-
-    // This test takes a long time when running under Miri, so we skip it in
-    // that case. This is acceptable because this is a logic test that doesn't
-    // attempt to expose UB.
-    #[test]
-    #[cfg_attr(miri, ignore)]
-    fn test_validate_cast_and_convert_metadata() {
-        #[allow(non_local_definitions)]
-        impl From<usize> for SizeInfo {
-            fn from(size: usize) -> SizeInfo {
-                SizeInfo::Sized { size }
-            }
-        }
-
-        #[allow(non_local_definitions)]
-        impl From<(usize, usize)> for SizeInfo {
-            fn from((offset, elem_size): (usize, usize)) -> SizeInfo {
-                SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size })
-            }
-        }
 
-        fn layout<S: Into<SizeInfo>>(s: S, align: usize) -> DstLayout {
+        // Exercise the branch where the existing inner rounding alignment is
+        // at least the enclosing alignment. The inner rounded term is already
+        // aligned to two, so padding only advances `size_base` from three to
+        // four.
+        let inner_rounding_dominates = DstLayout {
+            align: NonZeroUsize::new(2).unwrap(),
+            size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                offset: 3,
+                elem_size: 1,
+                size_base: 3,
+                size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                    NonZeroUsize::new(4).unwrap(),
+                    1,
+                ),
+            }),
+            statically_shallow_unpadded: false,
+        };
+        assert_eq!(
+            inner_rounding_dominates.pad_to_align(),
             DstLayout {
-                size_info: s.into(),
-                align: NonZeroUsize::new(align).unwrap(),
+                align: NonZeroUsize::new(2).unwrap(),
+                size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                    offset: 3,
+                    elem_size: 1,
+                    size_base: 4,
+                    size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                        NonZeroUsize::new(4).unwrap(),
+                        1
+                    ),
+                }),
                 statically_shallow_unpadded: false,
             }
-        }
+        );
+
+        // Exercise the branch where the enclosing alignment is larger. For
+        // a trailing-slice byte count `trailing_size`, rounding
+        // `6 + round_up(1 + trailing_size, 4)` to eight gives the equivalent
+        // formula `8 + round_up(1 + trailing_size, 8)`.
+        let outer_rounding_dominates = DstLayout {
+            align: NonZeroUsize::new(8).unwrap(),
+            size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                offset: 7,
+                elem_size: 1,
+                size_base: 6,
+                size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                    NonZeroUsize::new(4).unwrap(),
+                    1,
+                ),
+            }),
+            statically_shallow_unpadded: false,
+        };
+        assert_eq!(
+            outer_rounding_dominates.pad_to_align(),
+            DstLayout {
+                align: NonZeroUsize::new(8).unwrap(),
+                size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                    offset: 7,
+                    elem_size: 1,
+                    size_base: 8,
+                    size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                        NonZeroUsize::new(8).unwrap(),
+                        1
+                    ),
+                }),
+                statically_shallow_unpadded: false,
+            }
+        );
+    }
+
+    #[test]
+    fn test_trailing_slice_layout_size_sequence_equivalence() {
+        // These are the two normalized descriptions produced by a
+        // `repr(C, packed(2))` wrapper around slice DSTs whose element types
+        // both have size four but alignments four and two respectively. Their
+        // formulas differ structurally, but both simplify to `2 + 4 * elems`.
+        let align4 = TrailingSliceLayout {
+            offset: 2,
+            elem_size: 4,
+            size_base: 2,
+            size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                NonZeroUsize::new(4).unwrap(),
+                0,
+            ),
+        };
+        let align2 = TrailingSliceLayout {
+            offset: 2,
+            elem_size: 4,
+            size_base: 2,
+            size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                NonZeroUsize::new(2).unwrap(),
+                0,
+            ),
+        };
+        assert!(align4.has_same_size_sequence(align2));
+        for elems in 0..8 {
+            assert_eq!(align4.size_for_elems(elems), Some(2 + 4 * elems));
+            assert_eq!(align4.size_for_elems(elems), align2.size_for_elems(elems));
+        }
+
+        let dynamically_padded = TrailingSliceLayout { elem_size: 1, ..align4 };
+        assert!(!dynamically_padded.has_same_size_sequence(align2));
+    }
+
+    // This test takes a long time when running under Miri, so we skip it in
+    // that case. This is acceptable because this is a logic test that doesn't
+    // attempt to expose UB.
+    #[test]
+    #[cfg_attr(miri, ignore)]
+    fn test_validate_cast_and_convert_metadata() {
+        #[allow(non_local_definitions)]
+        impl From<usize> for SizeInfo {
+            fn from(size: usize) -> SizeInfo {
+                SizeInfo::Sized { size }
+            }
+        }
+
+        #[allow(non_local_definitions)]
+        impl From<(usize, usize)> for SizeInfo {
+            fn from((offset, elem_size): (usize, usize)) -> SizeInfo {
+                SizeInfo::SliceDst(TrailingSliceLayout {
+                    offset,
+                    elem_size,
+                    size_base: offset,
+                    size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                        DstLayout::MIN_ALIGN,
+                        0,
+                    ),
+                })
+            }
+        }
+
+        fn layout<S: Into<SizeInfo>>(s: S, align: usize) -> DstLayout {
+            let align = NonZeroUsize::new(align).unwrap();
+            let size_info = match s.into() {
+                SizeInfo::SliceDst(mut trailing) => {
+                    let phase = trailing.size_base % align;
+                    trailing.size_base =
+                        util::round_down_to_next_multiple_of_alignment(trailing.size_base, align);
+                    trailing.size_rounding_align_and_phase =
+                        RoundingAlignAndPhase::new(align, phase);
+                    SizeInfo::SliceDst(trailing)
+                }
+                size_info => size_info,
+            };
+            DstLayout { size_info, align, statically_shallow_unpadded: false }
+        }
 
         /// This macro accepts arguments in the form of:
         ///
@@ -1531,10 +3471,18 @@ fn validate_behavior(
 
                 let resulting_size = match layout.size_info {
                     SizeInfo::Sized { size } => size,
-                    SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }) => {
+                    SizeInfo::SliceDst(TrailingSliceLayout {
+                        elem_size,
+                        size_base,
+                        size_rounding_align_and_phase,
+                        ..
+                    }) => {
+                        let (size_align, size_phase) = size_rounding_align_and_phase.components();
                         let padded_size = |elems| {
-                            let without_padding = offset + elems * elem_size;
-                            without_padding + util::padding_needed_for(without_padding, align)
+                            let without_padding = size_phase + elems * elem_size;
+                            size_base
+                                + without_padding
+                                + util::padding_needed_for(without_padding, size_align)
                         };
 
                         let resulting_size = padded_size(elems);
@@ -1562,8 +3510,13 @@ fn validate_behavior(
             } else {
                 let min_size = match layout.size_info {
                     SizeInfo::Sized { size } => size,
-                    SizeInfo::SliceDst(TrailingSliceLayout { offset, .. }) => {
-                        offset + util::padding_needed_for(offset, layout.align)
+                    SizeInfo::SliceDst(TrailingSliceLayout {
+                        size_base,
+                        size_rounding_align_and_phase,
+                        ..
+                    }) => {
+                        let (size_align, size_phase) = size_rounding_align_and_phase.components();
+                        size_base + size_phase + util::padding_needed_for(size_phase, size_align)
                     }
                 };
 
@@ -1592,6 +3545,35 @@ fn validate_behavior(
                 .map(|(size_info, align)| layout(size_info, align));
         itertools::iproduct!(layouts, 0..8, 0..8, [CastType::Prefix, CastType::Suffix])
             .for_each(validate_behavior);
+
+        // Exercise a normalized formula which cannot be represented as
+        // `round_up(offset + elems * elem_size, align)`: the physical trailing
+        // slice begins at offset 7, while an inner aligned DST contributes the
+        // size formula `2 + round_up(5 + elems, 4)` to a packed outer type.
+        let nested_packed = DstLayout {
+            align: NonZeroUsize::new(2).unwrap(),
+            size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                offset: 7,
+                elem_size: 1,
+                size_base: 6,
+                size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                    NonZeroUsize::new(4).unwrap(),
+                    1,
+                ),
+            }),
+            statically_shallow_unpadded: false,
+        };
+        itertools::iproduct!([nested_packed], 0..8, 0..24, [CastType::Prefix, CastType::Suffix])
+            .for_each(validate_behavior);
+
+        assert!(matches!(
+            nested_packed.validate_cast_and_convert_metadata(0, 8, CastType::Prefix),
+            Err(MetadataCastError::Size)
+        ));
+        assert!(matches!(
+            nested_packed.validate_cast_and_convert_metadata(0, 10, CastType::Prefix),
+            Ok((3, 10))
+        ));
     }
 
     #[test]
@@ -1631,9 +3613,18 @@ fn test<T: ?Sized, W: Fn(usize) -> NonNull<T>>(
             let dst = args.elem_size.is_some();
             let layout = {
                 let size_info = match args.elem_size {
-                    Some(elem_size) => {
-                        SizeInfo::SliceDst(TrailingSliceLayout { offset: args.offset, elem_size })
-                    }
+                    Some(elem_size) => SizeInfo::SliceDst(TrailingSliceLayout {
+                        offset: args.offset,
+                        elem_size,
+                        size_base: util::round_down_to_next_multiple_of_alignment(
+                            args.offset,
+                            args.align,
+                        ),
+                        size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                            args.align,
+                            args.offset % args.align,
+                        ),
+                    }),
                     None => SizeInfo::Sized {
                         // Rust only supports types whose sizes are a multiple
                         // of their alignment. If the macro created a type like
@@ -1951,70 +3942,748 @@ macro_rules! validate_against_rust {
 
 #[cfg(kani)]
 mod proofs {
+    //! Arithmetic models and input generators for the layout proofs.
+    //!
+    //! The contract models specify expected results without calling the
+    //! operation being checked. The composition models (`extended_layout`,
+    //! `padded_layout`, and `repr_c_layout`) also define the contracts' input
+    //! domains: `Some` supplies an expected layout, while `None` excludes an
+    //! input from the corresponding non-panicking contract. These models check
+    //! representability in `usize`, without imposing Rust's `isize::MAX` bound.
+
     use core::alloc::Layout;
 
     use super::*;
 
-    impl kani::Arbitrary for DstLayout {
-        fn any() -> Self {
-            let align: NonZeroUsize = kani::any();
-            let size_info: SizeInfo = kani::any();
-
-            kani::assume(align.is_power_of_two());
-            kani::assume(align < DstLayout::THEORETICAL_MAX_ALIGN);
-
-            // For testing purposes, we most care about instantiations of
-            // `DstLayout` that can correspond to actual Rust types. We use
-            // `Layout` to verify that our `DstLayout` satisfies the validity
-            // conditions of Rust layouts.
-            kani::assume(
-                match size_info {
-                    SizeInfo::Sized { size } => Layout::from_size_align(size, align.get()),
-                    SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size: _ }) => {
-                        // `SliceDst` cannot encode an exact size, but we know
-                        // it is at least `offset` bytes.
-                        Layout::from_size_align(offset, align.get())
+    /// Evaluates the normalized object size for a trailing slice of
+    /// `trailing_size` bytes:
+    ///
+    /// ```text
+    /// size_base + round_up(size_phase + trailing_size, size_align)
+    /// ```
+    ///
+    /// Here, `size_align` and `size_phase` come from `layout.size_rounding_align_and_phase`.
+    /// `round_up` rounds its input up to a multiple of its alignment. Returns
+    /// `None` if the size is not representable in `usize`.
+    ///
+    /// Using byte counts separates rounding from element-count multiplication
+    /// and permits proofs over byte counts that are not whole elements.
+    pub(super) fn slice_dst_size_for_trailing_bytes<ElementSize>(
+        layout: TrailingSliceLayout<ElementSize>,
+        trailing_size: usize,
+    ) -> Option<usize> {
+        let without_padding =
+            layout.size_rounding_align_and_phase.components().1.checked_add(trailing_size)?;
+        let padding =
+            util::padding_needed_for(without_padding, layout.size_rounding_align_and_phase.align());
+        let rounded = without_padding.checked_add(padding)?;
+        layout.size_base.checked_add(rounded)
+    }
+
+    /// Returns the least multiple of `align` greater than or equal to `bytes`,
+    /// or `None` if that multiple exceeds `usize::MAX`.
+    ///
+    /// Requires a power-of-two `align`. Composition models use this checked
+    /// operation to identify inputs for which adding padding would overflow.
+    fn round_up(bytes: usize, align: NonZeroUsize) -> Option<usize> {
+        bytes.checked_add(util::padding_needed_for(bytes, align))
+    }
+
+    /// Models the largest trailing-slice byte count whose object size fits in
+    /// `available` bytes. Returns `None` if even an empty trailing slice cannot
+    /// fit. The result need not be a multiple of the element size.
+    ///
+    /// Subtracting `size_base` leaves the budget for the rounded contribution.
+    /// Rounding that budget down to `size_align` and subtracting `size_phase`
+    /// gives the largest byte count whose `slice_dst_size_for_trailing_bytes`
+    /// result is at most `available`. Metadata and casting contracts use
+    /// this bound without calling the production capacity calculation.
+    pub(super) fn max_trailing_bytes(
+        trailing: TrailingSliceLayout,
+        available: usize,
+    ) -> Option<usize> {
+        let (align, phase) = trailing.size_rounding_align_and_phase.components();
+        let capacity = available.checked_sub(trailing.size_base)?;
+        util::round_down_to_next_multiple_of_alignment(capacity, align).checked_sub(phase)
+    }
+
+    /// Models appending `field` to a sized `prefix` for `DstLayout::extend`.
+    ///
+    /// Places the field at the first offset after the prefix that satisfies the
+    /// field's alignment, capped by `packed` when present. The resulting
+    /// alignment is the maximum of the prefix's alignment and this effective
+    /// field alignment. A DST field retains its inner rounding operation, with
+    /// its slice offset and size base shifted by the field's placement.
+    /// Trailing padding for the enclosing layout is left to `padded_layout`.
+    ///
+    /// Returns `None` for a non-power-of-two alignment, an unsized prefix, or
+    /// arithmetic overflow. The `statically_shallow_unpadded` flag is true only
+    /// if both inputs have it set and field placement introduces no gap.
+    pub(super) fn extended_layout(
+        prefix: DstLayout,
+        field: DstLayout,
+        packed: Option<NonZeroUsize>,
+    ) -> Option<DstLayout> {
+        if !prefix.align.is_power_of_two()
+            || !field.align.is_power_of_two()
+            || packed.map_or(false, |align| !align.is_power_of_two())
+        {
+            return None;
+        }
+        let SizeInfo::Sized { size: prefix_size } = prefix.size_info else { return None };
+        let field_align = field.align.min(packed.unwrap_or(DstLayout::THEORETICAL_MAX_ALIGN));
+        let field_offset = round_up(prefix_size, field_align)?;
+        let size_info = match field.size_info {
+            SizeInfo::Sized { size } => SizeInfo::Sized { size: field_offset.checked_add(size)? },
+            SizeInfo::SliceDst(trailing) => SizeInfo::SliceDst(TrailingSliceLayout {
+                offset: field_offset.checked_add(trailing.offset)?,
+                size_base: field_offset.checked_add(trailing.size_base)?,
+                ..trailing
+            }),
+        };
+        Some(DstLayout {
+            align: prefix.align.max(field_align),
+            size_info,
+            statically_shallow_unpadded: prefix.statically_shallow_unpadded
+                && field.statically_shallow_unpadded
+                && field_offset == prefix_size,
+        })
+    }
+
+    /// Models adding trailing padding for `DstLayout::pad_to_align`.
+    ///
+    /// A sized layout rounds its size up to a multiple of `layout.align`. A DST
+    /// instead composes that rounding with its existing size expression:
+    ///
+    /// ```text
+    /// round_up(size_base + round_up(size_phase + trailing_size, size_align),
+    ///          layout.align)
+    /// ```
+    ///
+    /// Here, `size_align` and `size_phase` come from the DST's
+    /// `size_rounding_align_and_phase`. The result encodes this expression with
+    /// one base, phase, and rounding alignment, preserving the physical slice
+    /// offset and element size. The `statically_shallow_unpadded` flag is
+    /// cleared only when a sized layout gains padding; DST padding is accounted
+    /// for by the size expression.
+    ///
+    /// Returns `None` if `layout.align` is not a power of two or a checked
+    /// intermediate overflows. The contract compares this expected encoding
+    /// with the production result; the separate padding formula proofs check
+    /// that the encoding preserves the rounded size.
+    pub(super) fn padded_layout(layout: DstLayout) -> Option<DstLayout> {
+        if !layout.align.is_power_of_two() {
+            return None;
+        }
+        let (size_info, no_static_padding) = match layout.size_info {
+            SizeInfo::Sized { size } => {
+                let rounded = round_up(size, layout.align)?;
+                (SizeInfo::Sized { size: rounded }, rounded == size)
+            }
+            SizeInfo::SliceDst(trailing) => {
+                let (inner_align, phase) = trailing.size_rounding_align_and_phase.components();
+                let (size_base, size_rounding_align_and_phase) = if inner_align >= layout.align {
+                    (
+                        round_up(trailing.size_base, layout.align)?,
+                        trailing.size_rounding_align_and_phase,
+                    )
+                } else {
+                    let fixed = round_up(trailing.size_base, inner_align)?.checked_add(phase)?;
+                    let new_phase = fixed & (layout.align.get() - 1);
+                    (fixed - new_phase, RoundingAlignAndPhase::new(layout.align, new_phase))
+                };
+                (
+                    SizeInfo::SliceDst(TrailingSliceLayout {
+                        size_base,
+                        size_rounding_align_and_phase,
+                        ..trailing
+                    }),
+                    true,
+                )
+            }
+        };
+        Some(DstLayout {
+            size_info,
+            statically_shallow_unpadded: layout.statically_shallow_unpadded && no_static_padding,
+            ..layout
+        })
+    }
+
+    /// Models a complete layout for `DstLayout::for_repr_c_struct` by composing
+    /// the field-placement and trailing-padding specifications.
+    ///
+    /// Starts with an empty prefix of alignment `align`, or one if absent.
+    /// Appends fields in order, with `packed` as an optional cap on field
+    /// alignment; the final layout is padded to its resulting alignment. Only
+    /// the last field may be unsized, since field extension requires a sized
+    /// prefix.
+    ///
+    /// Returns `None` if the initial alignment is not a power of two or any
+    /// field extension or final padding step returns `None`.
+    pub(super) fn repr_c_layout(
+        align: Option<NonZeroUsize>,
+        packed: Option<NonZeroUsize>,
+        fields: &[DstLayout],
+    ) -> Option<DstLayout> {
+        let align = align.unwrap_or(DstLayout::MIN_ALIGN);
+        if !align.is_power_of_two() {
+            return None;
+        }
+        let mut layout = DstLayout {
+            align,
+            size_info: SizeInfo::Sized { size: 0 },
+            statically_shallow_unpadded: true,
+        };
+        for &field in fields {
+            layout = extended_layout(layout, field, packed)?;
+        }
+        padded_layout(layout)
+    }
+
+    // The inline contract harnesses use unrestricted `Arbitrary` values.
+    // These generators retain the narrower domains of the Rust-layout proofs.
+
+    /// Generates any power-of-two alignment representable in `usize`, including
+    /// `DstLayout::THEORETICAL_MAX_ALIGN`. This restricts the alignment alone;
+    /// callers must impose any constraints relating it to a layout's size.
+    fn any_layout_align() -> NonZeroUsize {
+        let exponent: u8 = kani::any();
+        kani::assume(usize::from(exponent) < POINTER_WIDTH_BITS);
+
+        // `exponent < POINTER_WIDTH_BITS`, so the shift is in range and its
+        // result is non-zero. This construction is surjective over every
+        // power-of-two alignment up to and including
+        // `THEORETICAL_MAX_ALIGN`. `Layout` admits that maximum alignment for
+        // zero-sized layouts, so the validity assumptions below—not this
+        // generator—filter combinations that cannot describe Rust types.
+        NonZeroUsize::new(1usize << exponent).unwrap()
+    }
+
+    /// Generates layouts satisfying the arithmetic restrictions used by the
+    /// standalone Rust-layout proofs.
+    ///
+    /// The fixed size, or the zero-element DST size, must be accepted by
+    /// `Layout::from_size_align`. For a DST, `size_base + size_phase` must also
+    /// be representable and at least the physical slice offset. Component
+    /// bounds come from `any_bounded_size_info`; `statically_shallow_unpadded`
+    /// remains arbitrary. These conditions do not establish that a Rust type
+    /// with this layout exists.
+    fn any_valid_dst_layout() -> DstLayout {
+        let align = any_layout_align();
+        let size_info = any_bounded_size_info();
+
+        kani::assume(
+            match size_info {
+                SizeInfo::Sized { size } => Layout::from_size_align(size, align.get()),
+                SizeInfo::SliceDst(trailing) => {
+                    // `SliceDst` cannot encode one exact size. Validate its
+                    // minimum size and the invariants required of the size
+                    // formula for layouts of real Rust types.
+                    let min_size = trailing.size_for_elems(0);
+                    let unrounded_min_size = trailing
+                        .size_base
+                        .checked_add(trailing.size_rounding_align_and_phase.components().1);
+
+                    kani::assume(matches!(
+                        unrounded_min_size,
+                        Some(size) if size >= trailing.offset
+                    ));
+
+                    match min_size {
+                        Some(min_size) => Layout::from_size_align(min_size, align.get()),
+                        None => Layout::from_size_align(usize::MAX, align.get()),
                     }
                 }
-                .is_ok(),
-            );
+            }
+            .is_ok(),
+        );
+
+        DstLayout { align: align, size_info: size_info, statically_shallow_unpadded: kani::any() }
+    }
+
+    /// Generates either a fixed size at most `DstLayout::MAX_SIZE`, or a DST
+    /// description from `any_bounded_trailing_layout`.
+    ///
+    /// Supplies bounded size components to `any_valid_dst_layout`, which adds
+    /// constraints involving the enclosing layout's alignment.
+    fn any_bounded_size_info() -> SizeInfo {
+        let is_sized: bool = kani::any();
+
+        match is_sized {
+            true => {
+                let size: usize = kani::any();
+
+                kani::assume(size <= DstLayout::MAX_SIZE);
+
+                SizeInfo::Sized { size }
+            }
+            false => SizeInfo::SliceDst(any_bounded_trailing_layout()),
+        }
+    }
+
+    /// Generates a trailing-slice description whose element size, slice offset,
+    /// and size base are each at most `DstLayout::MAX_SIZE` (`isize::MAX`).
+    ///
+    /// The rounding alignment spans all representable powers of two, and the
+    /// phase spans all values below that alignment. No further relationships
+    /// between these components are imposed: their combined size may overflow
+    /// or fail to contain the slice. Standalone proofs add the relationships
+    /// they require; contract harnesses use unrestricted `Arbitrary` values
+    /// instead.
+    fn any_bounded_trailing_layout() -> TrailingSliceLayout {
+        let elem_size: usize = kani::any();
+        let offset: usize = kani::any();
+        let size_base: usize = kani::any();
+        let size_align = any_layout_align();
+        let raw_size_phase: usize = kani::any();
+        // Since `size_align` is a power of two, masking is surjective over
+        // precisely the values in `0..size_align`.
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_phase = raw_size_phase & (size_align.get() - 1);
+
+        kani::assume(elem_size <= DstLayout::MAX_SIZE);
+        kani::assume(offset <= DstLayout::MAX_SIZE);
+        kani::assume(size_base <= DstLayout::MAX_SIZE);
+
+        TrailingSliceLayout {
+            elem_size,
+            offset,
+            size_base,
+            size_rounding_align_and_phase: RoundingAlignAndPhase::new(size_align, size_phase),
+        }
+    }
+
+    #[cfg(feature = "derive")]
+    #[kani::proof]
+    fn prove_padding_for_elems_for_rust_layouts() {
+        // For each fixture, check every element count whose complete size
+        // fits in `usize`, including all counts for zero-sized elements.
+        padding_testutil::check_layouts(kani::any());
+    }
+
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_padding_for_elems() {
+        // Check the modular result for every field value and element count,
+        // including layouts that cannot describe a Rust type.
+        let layout = TrailingSliceLayout {
+            offset: kani::any(),
+            elem_size: kani::any(),
+            size_base: kani::any(),
+            size_rounding_align_and_phase: RoundingAlignAndPhase(kani::any()),
+        };
+        let elems: usize = kani::any();
+        let (size_align, size_phase) = layout.size_rounding_align_and_phase.components();
+        let mask = size_align.get() - 1;
+
+        // Evaluate the complete size and trailing-slice end separately in
+        // modular arithmetic, without reducing the trailing bytes first or
+        // canceling them from the difference.
+        let trailing_bytes = elems.wrapping_mul(layout.elem_size);
+        let unrounded = size_phase.wrapping_add(trailing_bytes);
+        let rounded = unrounded.wrapping_add(mask) & !mask;
+        let object_size = layout.size_base.wrapping_add(rounded);
+        let trailing_end = layout.offset.wrapping_add(trailing_bytes);
+        assert_eq!(layout.padding_for_elems(elems), object_size.wrapping_sub(trailing_end));
+    }
+
+    #[kani::proof]
+    fn prove_size_rounding_align_and_phase_encoding() {
+        let encoded: usize = kani::any();
+        kani::assume(encoded != 0);
+        let encoded = NonZeroUsize::new(encoded).unwrap();
+        let rounding = RoundingAlignAndPhase(encoded);
+
+        let align = rounding.align();
+        let phase = rounding.components().1;
+        assert!(align.is_power_of_two());
+        assert!(phase < align.get());
+        assert_eq!(RoundingAlignAndPhase::new(align, phase), rounding);
+    }
+
+    #[kani::proof]
+    fn prove_size_rounding_align_and_phase_decoding() {
+        let align: NonZeroUsize = kani::any();
+        let phase: usize = kani::any();
+        kani::assume(align.is_power_of_two());
+        kani::assume(phase < align.get());
+
+        let rounding = RoundingAlignAndPhase::new(align, phase);
+        assert_eq!(rounding.components(), (align, phase));
+    }
+
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    fn prove_trailing_slice_layout_normal_form() {
+        let rounding_word: usize = kani::any();
+        kani::assume(rounding_word != 0);
+        let align = RoundingAlignAndPhase(NonZeroUsize::new(rounding_word).unwrap()).align();
+
+        let raw_prefix: usize = kani::any();
+        let offset: usize = kani::any();
+        let trailing_size: usize = kani::any();
+        #[allow(clippy::arithmetic_side_effects)]
+        let prefix = raw_prefix & (align.get() - 1);
+        #[allow(clippy::arithmetic_side_effects)]
+        let phase = offset & (align.get() - 1);
+        #[allow(clippy::arithmetic_side_effects)]
+        let aligned_offset = offset - phase;
+        let layout = TrailingSliceLayout {
+            offset: 0,
+            elem_size: 1,
+            size_base: aligned_offset | prefix,
+            size_rounding_align_and_phase: RoundingAlignAndPhase::new(align, phase),
+        };
+
+        assert_eq!(layout.size_offset(), offset);
+
+        let old_size = offset
+            .checked_add(trailing_size)
+            .and_then(|without_padding| {
+                without_padding.checked_add(util::padding_needed_for(without_padding, align))
+            })
+            .and_then(|rounded| prefix.checked_add(rounded));
+        assert_eq!(layout.size_for_elems(trailing_size), old_size);
+        assert_eq!(slice_dst_size_for_trailing_bytes(layout, trailing_size), old_size);
+    }
+
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_element_product_preserves_alignment() {
+        let elem_size: usize = kani::any();
+        let elems: usize = kani::any();
+        let align = any_layout_align();
+        #[allow(clippy::arithmetic_side_effects)]
+        let align_mask = align.get() - 1;
+
+        kani::assume(elem_size & align_mask == 0);
+        let Some(bytes) = elem_size.checked_mul(elems) else {
+            kani::assume(false);
+            loop {}
+        };
+        assert_eq!(bytes & align_mask, 0);
+    }
+
+    #[kani::proof]
+    fn prove_trailing_slice_layout_advance() {
+        let layout: TrailingSliceLayout = any_bounded_trailing_layout();
+        let bytes: usize = kani::any();
+        let elem_size: usize = kani::any();
+        let trailing_size: usize = kani::any();
+
+        let size_offset = layout.size_offset();
+        let advanced_offset = size_offset.checked_add(bytes);
+        let advanced = layout.advance(bytes, elem_size);
+        assert_eq!(advanced.is_some(), advanced_offset.is_some());
+        let Some(advanced_offset) = advanced_offset else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(advanced) = advanced else { unreachable!() };
+
+        assert_eq!(advanced.offset, layout.offset);
+        assert_eq!(advanced.size_offset(), advanced_offset);
+        assert_eq!(advanced.elem_size, elem_size);
+        assert_eq!(
+            advanced.size_rounding_align_and_phase.align(),
+            layout.size_rounding_align_and_phase.align()
+        );
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_align_mask = advanced.size_rounding_align_and_phase.align().get() - 1;
+        assert_eq!(advanced.size_base & size_align_mask, layout.size_base & size_align_mask);
+
+        let size_align = layout.size_rounding_align_and_phase.align();
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_prefix = layout.size_base & (size_align.get() - 1);
+        let expected_size = advanced_offset
+            .checked_add(trailing_size)
+            .and_then(|without_padding| {
+                without_padding.checked_add(util::padding_needed_for(without_padding, size_align))
+            })
+            .and_then(|rounded| size_prefix.checked_add(rounded));
+        assert_eq!(slice_dst_size_for_trailing_bytes(advanced, trailing_size), expected_size);
+    }
+
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    fn prove_has_same_size_sequence() {
+        let left: TrailingSliceLayout = any_bounded_trailing_layout();
+        let right: TrailingSliceLayout = any_bounded_trailing_layout();
+        let trailing_size: usize = kani::any();
+
+        kani::assume(left.has_same_size_sequence(right));
+        let left_align = left.size_rounding_align_and_phase.align().get();
+        let right_align = right.size_rounding_align_and_phase.align().get();
+        let max_align = if left_align > right_align { left_align } else { right_align };
+        #[allow(clippy::arithmetic_side_effects)]
+        let max_align_mask = max_align - 1;
+        if left.elem_size & max_align_mask == 0 {
+            // In this branch `has_same_size_sequence` relies on every actual
+            // trailing byte count being a multiple of both alignments. Prove
+            // the formula for that entire byte class, which includes every
+            // representable `elems * elem_size`, without introducing a
+            // nonlinear symbolic multiplication into the harness.
+            kani::assume(trailing_size & max_align_mask == 0);
+        }
+        assert_eq!(
+            slice_dst_size_for_trailing_bytes(left, trailing_size),
+            slice_dst_size_for_trailing_bytes(right, trailing_size)
+        );
+    }
+
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_max_trailing_bytes() {
+        let trailing: TrailingSliceLayout = any_bounded_trailing_layout();
+        let available_bytes: usize = kani::any();
+        let trailing_bytes: usize = kani::any();
+        let fits = slice_dst_size_for_trailing_bytes(trailing, trailing_bytes)
+            .map(|size| size <= available_bytes)
+            .unwrap_or(false);
+        match trailing.max_trailing_bytes(available_bytes) {
+            Some(max_bytes) => assert_eq!(trailing_bytes <= max_bytes, fits),
+            None => assert!(!fits),
+        }
+    }
+
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_max_trailing_bytes_components() {
+        let trailing: TrailingSliceLayout = any_bounded_trailing_layout();
+        let bytes_len: usize = kani::any();
+        let Some(max_slice_bytes) = trailing.max_trailing_bytes(bytes_len) else {
+            kani::assume(false);
+            loop {}
+        };
+        let (size_align, size_phase) = trailing.size_rounding_align_and_phase.components();
+        let Some(bytes_after_base) = bytes_len.checked_sub(trailing.size_base) else {
+            unreachable!()
+        };
+        let max_rounded_bytes =
+            util::round_down_to_next_multiple_of_alignment(bytes_after_base, size_align);
+        assert_eq!(size_phase.checked_add(max_slice_bytes), Some(max_rounded_bytes));
+        assert!(trailing.size_base.checked_add(max_rounded_bytes).unwrap() <= bytes_len);
+    }
+
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_slice_dst_validator_selected_size_fits() {
+        let size_align = any_layout_align();
+        #[allow(clippy::arithmetic_side_effects)]
+        let align_mask = size_align.get() - 1;
+        let raw_phase: usize = kani::any();
+        let size_phase = raw_phase & align_mask;
+        let raw_capacity: usize = kani::any();
+        let max_rounded_bytes = raw_capacity & !align_mask;
+        let size_base: usize = kani::any();
+        let bytes_len: usize = kani::any();
+        let trailing_size: usize = kani::any();
+
+        // These are exactly the relations established for every successful
+        // capacity query by `prove_max_trailing_bytes_components`. Isolate
+        // them from the helper's implementation to keep this arithmetic
+        // identity independent of how that helper computes its bound.
+        let Some(max_slice_bytes) = max_rounded_bytes.checked_sub(size_phase) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(max_object_size) = size_base.checked_add(max_rounded_bytes) else {
+            kani::assume(false);
+            loop {}
+        };
+        kani::assume(max_object_size <= bytes_len);
+        kani::assume(trailing_size <= max_slice_bytes);
+
+        // For a whole-element count selected by the validator, this unused
+        // byte count is also `max_slice_bytes % elem_size`. The identity here
+        // holds for every byte count satisfying the capacity bound.
+        #[allow(clippy::arithmetic_side_effects)]
+        let unused_bytes = max_slice_bytes - trailing_size;
+        let unused_aligned_bytes =
+            util::round_down_to_next_multiple_of_alignment(unused_bytes, size_align);
+        #[allow(clippy::arithmetic_side_effects)]
+        let object_size = size_base + (max_rounded_bytes - unused_aligned_bytes);
+
+        let unrounded = size_phase.checked_add(trailing_size).unwrap();
+        let rounded =
+            unrounded.checked_add(util::padding_needed_for(unrounded, size_align)).unwrap();
+        assert_eq!(Some(object_size), size_base.checked_add(rounded));
+        assert!(object_size <= bytes_len);
+    }
 
-            Self { align: align, size_info: size_info, statically_shallow_unpadded: kani::any() }
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_slice_dst_validator_rejects_larger_trailing_size() {
+        let trailing: TrailingSliceLayout = any_bounded_trailing_layout();
+        let bytes_len: usize = kani::any();
+        let larger_trailing_size: usize = kani::any();
+        let Some(max_slice_bytes) = trailing.max_trailing_bytes(bytes_len) else {
+            kani::assume(false);
+            loop {}
+        };
+        kani::assume(larger_trailing_size > max_slice_bytes);
+        if let Some(object_size) = slice_dst_size_for_trailing_bytes(trailing, larger_trailing_size)
+        {
+            assert!(object_size > bytes_len);
         }
     }
 
-    impl kani::Arbitrary for SizeInfo {
-        fn any() -> Self {
-            let is_sized: bool = kani::any();
+    #[kani::proof]
+    fn prove_slice_formula_contains_trailing_slice() {
+        let trailing: TrailingSliceLayout = any_bounded_trailing_layout();
+        let trailing_size: usize = kani::any();
+        let (_, size_phase) = trailing.size_rounding_align_and_phase.components();
+
+        let Some(unrounded_min) = trailing.size_base.checked_add(size_phase) else {
+            kani::assume(false);
+            loop {}
+        };
+        kani::assume(unrounded_min >= trailing.offset);
+        let Some(object_size) = slice_dst_size_for_trailing_bytes(trailing, trailing_size) else {
+            kani::assume(false);
+            loop {}
+        };
+
+        let Some(trailing_end) = trailing.offset.checked_add(trailing_size) else { unreachable!() };
+        assert!(trailing_end <= object_size);
+    }
+
+    #[kani::proof]
+    fn prove_finalized_slice_formula_is_aligned() {
+        let trailing: TrailingSliceLayout = any_bounded_trailing_layout();
+        let outer_align = any_layout_align();
+        let trailing_size: usize = kani::any();
+        kani::assume(trailing.size_rounding_align_and_phase.align() >= outer_align);
+        #[allow(clippy::arithmetic_side_effects)]
+        let outer_align_mask = outer_align.get() - 1;
+        kani::assume(trailing.size_base & outer_align_mask == 0);
+        let Some(object_size) = slice_dst_size_for_trailing_bytes(trailing, trailing_size) else {
+            kani::assume(false);
+            loop {}
+        };
 
-            match is_sized {
-                true => {
-                    let size: usize = kani::any();
+        assert_eq!(object_size & outer_align_mask, 0);
+    }
 
-                    kani::assume(size <= DstLayout::MAX_SIZE);
+    #[kani::proof]
+    fn prove_validator_checks_selected_endpoint_alignment() {
+        let align = any_layout_align();
+        let addr: usize = kani::any();
+        let bytes_len: usize = kani::any();
+        let Some(end) = addr.checked_add(bytes_len) else {
+            kani::assume(false);
+            loop {}
+        };
+        let suffix: bool = kani::any();
+        let cast_type = if suffix { CastType::Suffix } else { CastType::Prefix };
+        let selected_endpoint = if suffix { end } else { addr };
+        #[allow(clippy::arithmetic_side_effects)]
+        let align_mask = align.get() - 1;
 
-                    SizeInfo::Sized { size }
+        // The endpoint check precedes and is independent of the size-info
+        // branch. A zero-sized layout makes every aligned case succeed and
+        // isolates that control flow, including prefix/suffix split selection.
+        let layout = DstLayout {
+            align,
+            size_info: SizeInfo::Sized { size: 0 },
+            statically_shallow_unpadded: false,
+        };
+        match layout.validate_cast_and_convert_metadata(addr, bytes_len, cast_type) {
+            Ok((elems, split_at)) => {
+                assert_eq!(selected_endpoint & align_mask, 0);
+                assert_eq!(elems, 0);
+                if suffix {
+                    assert_eq!(split_at, bytes_len);
+                } else {
+                    assert_eq!(split_at, 0);
                 }
-                false => SizeInfo::SliceDst(kani::any()),
             }
+            Err(MetadataCastError::Alignment) => {
+                assert_ne!(selected_endpoint & align_mask, 0);
+            }
+            Err(MetadataCastError::Size) => unreachable!(),
         }
     }
 
-    impl kani::Arbitrary for TrailingSliceLayout {
-        fn any() -> Self {
-            let elem_size: usize = kani::any();
-            let offset: usize = kani::any();
+    #[kani::proof]
+    fn prove_aligned_suffix_end_and_size_imply_aligned_start() {
+        let align = any_layout_align();
+        #[allow(clippy::arithmetic_side_effects)]
+        let align_mask = align.get() - 1;
+        let addr: usize = kani::any();
+        let bytes_len: usize = kani::any();
+        let object_size: usize = kani::any();
+        let Some(end) = addr.checked_add(bytes_len) else {
+            kani::assume(false);
+            loop {}
+        };
+        kani::assume(end & align_mask == 0);
+        kani::assume(object_size & align_mask == 0);
+        kani::assume(object_size <= bytes_len);
 
-            kani::assume(elem_size < DstLayout::MAX_SIZE);
-            kani::assume(offset < DstLayout::MAX_SIZE);
+        #[allow(clippy::arithmetic_side_effects)]
+        let split_at = bytes_len - object_size;
+        let Some(object_start) = addr.checked_add(split_at) else { unreachable!() };
+        assert_eq!(object_start & align_mask, 0);
+    }
 
-            TrailingSliceLayout { elem_size, offset }
-        }
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_size_formula_bounds_size_offset() {
+        // Prove the bound for arbitrary byte counts, including counts that
+        // are not whole elements. The `size_for_elems` contract relates this
+        // formula to checked element products. This harness checks the
+        // formula's bound independently of that implementation.
+        let trailing: TrailingSliceLayout = kani::any();
+        let trailing_size: usize = kani::any();
+        let Some(object_size) = slice_dst_size_for_trailing_bytes(trailing, trailing_size) else {
+            kani::assume(false);
+            loop {}
+        };
+        let size_offset = trailing.size_offset();
+        let Some(without_padding) = size_offset.checked_add(trailing_size) else { unreachable!() };
+
+        assert!(without_padding <= object_size);
+    }
+
+    // Older supported compilers resolve the unchecked operation syntax in
+    // `add_scaled_metadata` to `polyfills::NumExt`; newer compilers prefer the
+    // inherent methods. Use UFCS to verify the fallback implementation which
+    // Kani's modern rustc cannot select in the production helper.
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_num_ext_affine_fallback_matches_checked_arithmetic() {
+        let base: usize = kani::any();
+        let metadata: usize = kani::any();
+        let multiple: usize = kani::any();
+        let Some(scaled) = metadata.checked_mul(multiple) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(expected) = base.checked_add(scaled) else {
+            kani::assume(false);
+            loop {}
+        };
+
+        // SAFETY: The checked multiplication returned `Some`, satisfying
+        // `NumExt::unchecked_mul`'s no-overflow contract.
+        let scaled =
+            unsafe { <usize as crate::util::polyfills::NumExt>::unchecked_mul(metadata, multiple) };
+        // SAFETY: The checked addition returned `Some`, and `scaled` is the
+        // checked product, satisfying `NumExt::unchecked_add`'s no-overflow
+        // contract.
+        let actual =
+            unsafe { <usize as crate::util::polyfills::NumExt>::unchecked_add(base, scaled) };
+        assert_eq!(actual, expected);
     }
 
+    #[cfg(kani_slow)]
     #[kani::proof]
     fn prove_requires_dynamic_padding() {
-        let layout: DstLayout = kani::any();
+        let layout: DstLayout = any_valid_dst_layout();
 
         let SizeInfo::SliceDst(size_info) = layout.size_info else {
             kani::assume(false);
@@ -2029,31 +4698,35 @@ fn prove_requires_dynamic_padding() {
             loop {}
         };
 
-        let Some(unpadded_size) = size_info.offset.checked_add(trailing_slice_size) else {
-            // The `unpadded_size` exceeds `usize::MAX`; `meta`` is invalid.
+        let Some(trailing_slice_end) = size_info.offset.checked_add(trailing_slice_size) else {
+            // The trailing slice end exceeds `usize::MAX`; `meta` is invalid.
             kani::assume(false);
             loop {}
         };
 
-        if unpadded_size >= DstLayout::MAX_SIZE {
-            // The `unpadded_size` exceeds `isize::MAX`; `meta` is invalid.
+        let Some(size) = slice_dst_size_for_trailing_bytes(size_info, trailing_slice_size) else {
             kani::assume(false);
             loop {}
-        }
+        };
 
-        let trailing_padding = util::padding_needed_for(unpadded_size, layout.align);
+        if size > DstLayout::MAX_SIZE || trailing_slice_end > size {
+            // This metadata cannot describe a valid instance.
+            kani::assume(false);
+            loop {}
+        }
 
         if !layout.requires_dynamic_padding() {
-            assert!(trailing_padding == 0);
+            assert_eq!(trailing_slice_end, size);
         }
     }
 
+    #[cfg(kani_slow)]
     #[kani::proof]
     fn prove_dst_layout_extend() {
         use crate::util::{max, min, padding_needed_for};
 
-        let base: DstLayout = kani::any();
-        let field: DstLayout = kani::any();
+        let base: DstLayout = any_valid_dst_layout();
+        let field: DstLayout = any_valid_dst_layout();
         let packed: Option<NonZeroUsize> = kani::any();
 
         if let Some(max_align) = packed {
@@ -2069,9 +4742,6 @@ fn prove_dst_layout_extend() {
             unreachable!();
         };
 
-        // Under the above conditions, `DstLayout::extend` will not panic.
-        let composite = base.extend(field, packed);
-
         // The field's alignment is clamped by `max_align` (i.e., the
         // `packed` attribute, if any) [1].
         //
@@ -2082,10 +4752,6 @@ fn prove_dst_layout_extend() {
         //   alignment of the field's type.
         let field_align = min(field.align, packed.unwrap_or(DstLayout::THEORETICAL_MAX_ALIGN));
 
-        // The struct's alignment is the maximum of its previous alignment and
-        // `field_align`.
-        assert_eq!(composite.align, max(base.align, field_align));
-
         // Compute the minimum amount of inter-field padding needed to
         // satisfy the field's alignment, and offset of the trailing field.
         // [1]
@@ -2095,7 +4761,38 @@ fn prove_dst_layout_extend() {
         //   Inter-field padding is guaranteed to be the minimum required in
         //   order to satisfy each field's (possibly altered) alignment.
         let padding = padding_needed_for(base_size, field_align);
-        let offset = base_size + padding;
+        let offset = match base_size.checked_add(padding) {
+            Some(offset) => offset,
+            None => {
+                kani::assume(false);
+                loop {}
+            }
+        };
+
+        // Restrict the proof to extensions whose zero-metadata composite size
+        // is representable. This semantic condition implies the
+        // representability of each implementation intermediate below; prove
+        // those implications rather than assuming the intermediates.
+        match field.size_info {
+            SizeInfo::Sized { size } => kani::assume(offset.checked_add(size).is_some()),
+            SizeInfo::SliceDst(trailing) => {
+                let Some(field_min) = trailing.size_for_elems(0) else {
+                    kani::assume(false);
+                    loop {}
+                };
+                kani::assume(offset.checked_add(field_min).is_some());
+
+                assert!(offset.checked_add(trailing.offset).is_some());
+                assert!(offset.checked_add(trailing.size_base).is_some());
+            }
+        }
+
+        // Under the above conditions, `DstLayout::extend` will not panic.
+        let composite = base.extend(field, packed);
+
+        // The struct's alignment is the maximum of its previous alignment and
+        // `field_align`.
+        assert_eq!(composite.align, max(base.align, field_align));
 
         // For testing purposes, we'll also construct `alloc::Layout`
         // stand-ins for `DstLayout`, and show that `extend` behaves
@@ -2132,29 +4829,64 @@ fn prove_dst_layout_extend() {
                     panic!("The composite of two sized layouts must be sized.")
                 }
             }
-            SizeInfo::SliceDst(TrailingSliceLayout {
-                offset: field_offset,
-                elem_size: field_elem_size,
-            }) => {
-                if let SizeInfo::SliceDst(TrailingSliceLayout {
-                    offset: composite_offset,
-                    elem_size: composite_elem_size,
-                }) = composite.size_info
-                {
+            SizeInfo::SliceDst(field_trailing) => {
+                if let SizeInfo::SliceDst(composite_trailing) = composite.size_info {
                     // The offset of the trailing slice component is the sum
                     // of the offset of the trailing field and the trailing
                     // slice offset within that field.
-                    assert_eq!(composite_offset, offset + field_offset);
+                    assert_eq!(composite_trailing.offset, offset + field_trailing.offset);
                     // The elem size is unchanged.
-                    assert_eq!(composite_elem_size, field_elem_size);
+                    assert_eq!(composite_trailing.elem_size, field_trailing.elem_size);
+                    // Extension preserves the invariant that the physical
+                    // trailing-slice field fits within the unrounded minimum
+                    // size. This is one of the premises consumed by the
+                    // validator soundness proof.
+                    let composite_phase =
+                        composite_trailing.size_rounding_align_and_phase.components().1;
+                    let Some(composite_unrounded_min) =
+                        composite_trailing.size_base.checked_add(composite_phase)
+                    else {
+                        unreachable!()
+                    };
+                    assert!(composite_unrounded_min >= composite_trailing.offset);
+
+                    // The normalized formula must continue to describe the
+                    // size of the field at every trailing byte contribution
+                    // for which the checked size computation succeeds. This
+                    // is stronger than considering only products of a slice
+                    // length and `elem_size`, and avoids a nonlinear
+                    // multiplication in the verifier.
+                    let trailing_size: usize = kani::any();
+                    let field_size =
+                        match slice_dst_size_for_trailing_bytes(field_trailing, trailing_size) {
+                            Some(size) => size,
+                            None => {
+                                kani::assume(false);
+                                loop {}
+                            }
+                        };
+                    let expected_size = match offset.checked_add(field_size) {
+                        Some(size) => size,
+                        None => {
+                            kani::assume(false);
+                            loop {}
+                        }
+                    };
+                    assert_eq!(
+                        slice_dst_size_for_trailing_bytes(composite_trailing, trailing_size),
+                        Some(expected_size)
+                    );
 
+                    // `alloc::Layout` permits sizes which are not a multiple
+                    // of alignment, so this represents the unpadded prefix of
+                    // the DST through the start of its trailing slice.
                     let field_analog =
-                        Layout::from_size_align(field_offset, field_align.get()).unwrap();
+                        Layout::from_size_align(field_trailing.offset, field_align.get()).unwrap();
 
                     if let Ok((actual_composite, actual_offset)) = base_analog.extend(field_analog)
                     {
                         assert_eq!(actual_offset, offset);
-                        assert_eq!(actual_composite.size(), composite_offset);
+                        assert_eq!(actual_composite.size(), composite_trailing.offset);
                         assert_eq!(actual_composite.align(), composite.align.get());
                     } else {
                         // An error here reflects that composite of `base`
@@ -2175,8 +4907,8 @@ fn prove_dst_layout_extend() {
     #[kani::proof]
     #[kani::should_panic]
     fn prove_dst_layout_extend_dst_panics() {
-        let base: DstLayout = kani::any();
-        let field: DstLayout = kani::any();
+        let base: DstLayout = any_valid_dst_layout();
+        let field: DstLayout = any_valid_dst_layout();
         let packed: Option<NonZeroUsize> = kani::any();
 
         if let Some(max_align) = packed {
@@ -2189,39 +4921,266 @@ fn prove_dst_layout_extend_dst_panics() {
         let _ = base.extend(field, packed);
     }
 
+    #[cfg(kani_slow)]
+    fn prove_dst_layout_pad_to_align_dst_invariants(
+        layout: DstLayout,
+        unpadded_trailing: TrailingSliceLayout,
+        padded: DstLayout,
+    ) {
+        // Calling `pad_to_align` does not alter the `DstLayout`'s alignment.
+        assert_eq!(padded.align, layout.align);
+        assert_eq!(padded.statically_shallow_unpadded, layout.statically_shallow_unpadded);
+
+        let SizeInfo::SliceDst(padded_trailing) = padded.size_info else {
+            panic!("The padding of a DST layout must result in a DST layout.")
+        };
+        assert_eq!(padded_trailing.offset, unpadded_trailing.offset);
+        assert_eq!(padded_trailing.elem_size, unpadded_trailing.elem_size);
+
+        // A finalized DST formula is visibly aligned: the rounding alignment
+        // is at least the outer alignment, and the fixed base is a multiple of
+        // the outer alignment. This is the invariant which lets suffix
+        // validation infer alignment of the object's start from alignment of
+        // its end.
+        assert!(padded_trailing.size_rounding_align_and_phase.align() >= padded.align);
+        #[allow(clippy::arithmetic_side_effects)]
+        let padded_align_mask = padded.align.get() - 1;
+        assert_eq!(padded_trailing.size_base & padded_align_mask, 0);
+        assert_eq!(padded.pad_to_align(), padded);
+        let padded_phase = padded_trailing.size_rounding_align_and_phase.components().1;
+        let Some(padded_unrounded_min) = padded_trailing.size_base.checked_add(padded_phase) else {
+            unreachable!()
+        };
+        assert!(padded_unrounded_min >= padded_trailing.offset);
+    }
+
     #[kani::proof]
-    fn prove_dst_layout_pad_to_align() {
+    fn prove_dst_layout_pad_to_align_sized() {
         use crate::util::padding_needed_for;
 
-        let layout: DstLayout = kani::any();
+        let layout: DstLayout = any_valid_dst_layout();
+        let SizeInfo::Sized { size: unpadded_size } = layout.size_info else {
+            kani::assume(false);
+            loop {}
+        };
 
         let padded = layout.pad_to_align();
-
-        // Calling `pad_to_align` does not alter the `DstLayout`'s alignment.
         assert_eq!(padded.align, layout.align);
+        let SizeInfo::Sized { size: padded_size } = padded.size_info else {
+            panic!("The padding of a sized layout must result in a sized layout.")
+        };
 
-        if let SizeInfo::Sized { size: unpadded_size } = layout.size_info {
-            if let SizeInfo::Sized { size: padded_size } = padded.size_info {
-                // If the layout is sized, it will remain sized after padding is
-                // added. Its sum will be its unpadded size and the size of the
-                // trailing padding needed to satisfy its alignment
-                // requirements.
-                let padding = padding_needed_for(unpadded_size, layout.align);
-                assert_eq!(padded_size, unpadded_size + padding);
-
-                // Prove that calling `DstLayout::pad_to_align` behaves
-                // identically to `Layout::pad_to_align`.
-                let layout_analog =
-                    Layout::from_size_align(unpadded_size, layout.align.get()).unwrap();
-                let padded_analog = layout_analog.pad_to_align();
-                assert_eq!(padded_analog.align(), layout.align.get());
-                assert_eq!(padded_analog.size(), padded_size);
-            } else {
-                panic!("The padding of a sized layout must result in a sized layout.")
-            }
-        } else {
-            // If the layout is a DST, padding cannot be statically added.
-            assert_eq!(padded.size_info, layout.size_info);
-        }
+        // If the layout is sized, it will remain sized after padding is added.
+        // Its sum will be its unpadded size and the size of the trailing
+        // padding needed to satisfy its alignment requirements.
+        let padding = padding_needed_for(unpadded_size, layout.align);
+        assert_eq!(padded_size, unpadded_size + padding);
+        assert_eq!(
+            padded.statically_shallow_unpadded,
+            layout.statically_shallow_unpadded && padding == 0
+        );
+
+        // Prove that calling `DstLayout::pad_to_align` behaves identically to
+        // `Layout::pad_to_align`.
+        let layout_analog = Layout::from_size_align(unpadded_size, layout.align.get()).unwrap();
+        let padded_analog = layout_analog.pad_to_align();
+        assert_eq!(padded_analog.align(), layout.align.get());
+        assert_eq!(padded_analog.size(), padded_size);
+    }
+
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    fn prove_dst_layout_pad_to_align_dst_inner_rounding_transition() {
+        use crate::util::padding_needed_for;
+
+        let layout: DstLayout = any_valid_dst_layout();
+        let SizeInfo::SliceDst(trailing) = layout.size_info else {
+            kani::assume(false);
+            loop {}
+        };
+        kani::assume(trailing.size_rounding_align_and_phase.align() >= layout.align);
+
+        // `any_valid_dst_layout` requires the zero-metadata layout to be valid.
+        // Prove that this semantic condition bounds both the padded minimum
+        // and the implementation intermediate; do not assume the intermediate
+        // merely because the implementation uses it.
+        let Some(min_size) = trailing.size_for_elems(0) else { unreachable!() };
+        let min_padding = padding_needed_for(min_size, layout.align);
+        let Some(padded_min_size) = min_size.checked_add(min_padding) else { unreachable!() };
+        assert!(padded_min_size <= DstLayout::MAX_SIZE);
+
+        let padding = padding_needed_for(trailing.size_base, layout.align);
+        let Some(expected_base) = trailing.size_base.checked_add(padding) else { unreachable!() };
+
+        let padded = layout.pad_to_align();
+        let SizeInfo::SliceDst(padded_trailing) = padded.size_info else { unreachable!() };
+        assert_eq!(padded_trailing.size_base, expected_base);
+        assert_eq!(
+            padded_trailing.size_rounding_align_and_phase,
+            trailing.size_rounding_align_and_phase
+        );
+        prove_dst_layout_pad_to_align_dst_invariants(layout, trailing, padded);
+    }
+
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_dst_layout_pad_to_align_dst_inner_rounding_formula() {
+        use crate::util::padding_needed_for;
+
+        let size_align = any_layout_align();
+        let outer_align = any_layout_align();
+        kani::assume(size_align >= outer_align);
+        let size_base: usize = kani::any();
+        let raw_size_phase: usize = kani::any();
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_phase = raw_size_phase & (size_align.get() - 1);
+        let trailing_size: usize = kani::any();
+
+        // Evaluate `size_base + round_up(size_phase + trailing_size,
+        // size_align)`, then round that complete size to `outer_align`.
+        // Compare with the equivalent expression obtained by rounding only
+        // `size_base` to `outer_align`, since `size_align` is a multiple of
+        // `outer_align`. Valid Rust objects have representable sizes; discard
+        // only trailing byte counts whose input or padded object size is not
+        // representable.
+        let Some(unrounded_inner) = size_phase.checked_add(trailing_size) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(rounded_inner) =
+            unrounded_inner.checked_add(padding_needed_for(unrounded_inner, size_align))
+        else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(unpadded_size) = size_base.checked_add(rounded_inner) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(expected_size) =
+            unpadded_size.checked_add(padding_needed_for(unpadded_size, outer_align))
+        else {
+            kani::assume(false);
+            loop {}
+        };
+
+        let Some(padded_base) = size_base.checked_add(padding_needed_for(size_base, outer_align))
+        else {
+            unreachable!()
+        };
+        let Some(actual_size) = padded_base.checked_add(rounded_inner) else { unreachable!() };
+        assert_eq!(actual_size, expected_size);
+    }
+
+    #[cfg(kani_slow)]
+    #[kani::proof]
+    fn prove_dst_layout_pad_to_align_dst_outer_alignment_transition() {
+        use crate::util::padding_needed_for;
+
+        let layout: DstLayout = any_valid_dst_layout();
+        let SizeInfo::SliceDst(trailing) = layout.size_info else {
+            kani::assume(false);
+            loop {}
+        };
+        let size_align = trailing.size_rounding_align_and_phase.align();
+        kani::assume(size_align < layout.align);
+
+        // `any_valid_dst_layout` requires the zero-metadata layout to be valid.
+        // Prove that this semantic condition bounds both the padded minimum
+        // and every implementation intermediate; do not assume the
+        // intermediates merely because the implementation uses them.
+        let Some(min_size) = trailing.size_for_elems(0) else { unreachable!() };
+        let min_padding = padding_needed_for(min_size, layout.align);
+        let Some(padded_min_size) = min_size.checked_add(min_padding) else { unreachable!() };
+        assert!(padded_min_size <= DstLayout::MAX_SIZE);
+
+        let base_padding = padding_needed_for(trailing.size_base, size_align);
+        let Some(rounded_base) = trailing.size_base.checked_add(base_padding) else {
+            unreachable!()
+        };
+        let Some(t) =
+            rounded_base.checked_add(trailing.size_rounding_align_and_phase.components().1)
+        else {
+            unreachable!()
+        };
+        #[allow(clippy::arithmetic_side_effects)]
+        let expected_phase = t & (layout.align.get() - 1);
+        #[allow(clippy::arithmetic_side_effects)]
+        let expected_base = t - expected_phase;
+
+        let padded = layout.pad_to_align();
+        let SizeInfo::SliceDst(padded_trailing) = padded.size_info else { unreachable!() };
+        assert_eq!(padded_trailing.size_base, expected_base);
+        assert_eq!(
+            padded_trailing.size_rounding_align_and_phase,
+            RoundingAlignAndPhase::new(layout.align, expected_phase)
+        );
+        prove_dst_layout_pad_to_align_dst_invariants(layout, trailing, padded);
+    }
+
+    #[kani::proof]
+    #[kani::solver(kissat)]
+    fn prove_dst_layout_pad_to_align_dst_outer_alignment_formula() {
+        use crate::util::padding_needed_for;
+
+        let size_align = any_layout_align();
+        let outer_align = any_layout_align();
+        kani::assume(size_align < outer_align);
+        let size_base: usize = kani::any();
+        let raw_size_phase: usize = kani::any();
+        #[allow(clippy::arithmetic_side_effects)]
+        let size_phase = raw_size_phase & (size_align.get() - 1);
+        let trailing_size: usize = kani::any();
+
+        // Evaluate `size_base + round_up(size_phase + trailing_size,
+        // size_align)`, then round that complete size to `outer_align`.
+        let Some(unrounded_inner) = size_phase.checked_add(trailing_size) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(rounded_inner) =
+            unrounded_inner.checked_add(padding_needed_for(unrounded_inner, size_align))
+        else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(unpadded_size) = size_base.checked_add(rounded_inner) else {
+            kani::assume(false);
+            loop {}
+        };
+        let Some(expected_size) =
+            unpadded_size.checked_add(padding_needed_for(unpadded_size, outer_align))
+        else {
+            kani::assume(false);
+            loop {}
+        };
+
+        // Since `outer_align` is a larger multiple of `size_align`, absorb
+        // the inner rounding into the outer rounding and split the fixed
+        // contribution into a base and phase:
+        //
+        //   fixed_contribution = round_up(size_base, size_align) + size_phase
+        //   new_phase = fixed_contribution % outer_align
+        //   new_base = fixed_contribution - new_phase
+        //   new_base + round_up(new_phase + trailing_size, outer_align)
+        let Some(rounded_base) = size_base.checked_add(padding_needed_for(size_base, size_align))
+        else {
+            unreachable!()
+        };
+        let Some(t) = rounded_base.checked_add(size_phase) else { unreachable!() };
+        #[allow(clippy::arithmetic_side_effects)]
+        let new_phase = t & (outer_align.get() - 1);
+        #[allow(clippy::arithmetic_side_effects)]
+        let new_base = t - new_phase;
+        let Some(new_unrounded_inner) = new_phase.checked_add(trailing_size) else {
+            unreachable!()
+        };
+        let Some(new_rounded_inner) =
+            new_unrounded_inner.checked_add(padding_needed_for(new_unrounded_inner, outer_align))
+        else {
+            unreachable!()
+        };
+        let Some(actual_size) = new_base.checked_add(new_rounded_inner) else { unreachable!() };
+        assert_eq!(actual_size, expected_size);
     }
 }
diff --git a/rust/zerocopy/src/lib.rs b/rust/zerocopy/src/lib.rs
index 572f0563fe2f..6dbeeb7488be 100644
--- a/rust/zerocopy/src/lib.rs
+++ b/rust/zerocopy/src/lib.rs
@@ -253,7 +253,7 @@
 )]
 #![cfg_attr(
     __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS,
-    deny(fuzzy_provenance_casts, lossy_provenance_casts)
+    deny(implicit_provenance_casts)
 )]
 #![deny(
     clippy::all,
@@ -315,10 +315,6 @@
     clippy::indexing_slicing,
 ))]
 #![cfg_attr(not(any(test, kani, feature = "std")), no_std)]
-#![cfg_attr(
-    all(feature = "simd-nightly", target_arch = "arm"),
-    feature(stdarch_arm_neon_intrinsics)
-)]
 #![cfg_attr(
     all(feature = "simd-nightly", any(target_arch = "powerpc", target_arch = "powerpc64")),
     feature(stdarch_powerpc)
@@ -326,10 +322,6 @@
 #![cfg_attr(feature = "float-nightly", feature(f16, f128))]
 #![cfg_attr(doc_cfg, feature(doc_cfg))]
 #![cfg_attr(__ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS, feature(coverage_attribute))]
-#![cfg_attr(
-    any(__ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS, miri),
-    feature(layout_for_ptr)
-)]
 #![cfg_attr(all(test, __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS), feature(test))]
 
 // This is a hack to allow zerocopy-derive derives to work in this crate. They
@@ -401,7 +393,7 @@
     wrappers::*,
 };
 
-#[cfg(any(feature = "alloc", test, kani))]
+#[cfg(any(feature = "alloc", test))]
 extern crate alloc;
 #[cfg(any(feature = "alloc", test))]
 use alloc::{boxed::Box, vec::Vec};
@@ -411,7 +403,7 @@
 // Used by `KnownLayout`.
 #[doc(hidden)]
 pub use crate::layout::*;
-// Used by `TryFromBytes::is_bit_valid`.
+// Used by `TryFromBytes::is_safe`.
 #[doc(hidden)]
 pub use crate::pointer::{invariant::BecauseImmutable, Maybe, Ptr};
 // For each trait polyfill, as soon as the corresponding feature is stable, the
@@ -786,10 +778,16 @@ fn only_derive_is_allowed_to_implement_this_trait()
     ///   where `size == size_of::<Self>()`
     /// - If `Self` is a slice DST, then `LAYOUT.size_info ==
     ///   SizeInfo::SliceDst(slice_layout)` where:
+    ///   - `slice_layout.size_rounding_align_and_phase` decodes to an alignment
+    ///     that is a power of two and a phase which is less than that alignment
     ///   - The size, `size`, of an instance of `Self` with `elems` trailing
-    ///     slice elements is equal to `slice_layout.offset +
-    ///     slice_layout.elem_size * elems` rounded up to the nearest multiple
-    ///     of `LAYOUT.align`
+    ///     slice elements is equal to `slice_layout.size_base +
+    ///     round_up(size_phase + slice_layout.elem_size * elems, size_align)`,
+    ///     where `(size_align, size_phase)` is decoded from
+    ///     `slice_layout.size_rounding_align_and_phase`
+    ///   - The trailing slice begins at byte offset `slice_layout.offset`
+    ///   - `slice_layout.offset + slice_layout.elem_size * elems` does not
+    ///     overflow and is no greater than `size`
     ///   - For such an instance, any bytes in the range `[slice_layout.offset +
     ///     slice_layout.elem_size * elems, size)` are padding and must not be
     ///     assumed to be initialized
@@ -1004,11 +1002,7 @@ fn to_elem_count(self) -> usize {
     #[inline]
     fn size_for_metadata(self, layout: DstLayout) -> Option<usize> {
         match layout.size_info {
-            SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }) => {
-                let slice_len = elem_size.checked_mul(self)?;
-                let without_padding = offset.checked_add(slice_len)?;
-                without_padding.checked_add(util::padding_needed_for(without_padding, layout.align))
-            }
+            SizeInfo::SliceDst(trailing) => trailing.size_for_elems(self),
             // NOTE: This branch is unreachable, but we return `None` rather
             // than `unreachable!()` to avoid generating panic paths.
             SizeInfo::Sized { .. } => None,
@@ -1073,29 +1067,85 @@ fn raw_from_ptr_len(data: NonNull<u8>, elems: usize) -> NonNull<Self> {
 
     #[inline(always)]
     fn pointer_to_metadata(ptr: *mut [T]) -> usize {
-        #[allow(clippy::as_conversions)]
-        let slc = ptr as *const [()];
+        #[cfg(not(no_zerocopy_slice_ptr_len_1_79_0))]
+        {
+            ptr.len()
+        }
 
-        // SAFETY:
-        // - `()` has alignment 1, so `slc` is trivially aligned.
-        // - `slc` was derived from a non-null pointer.
-        // - The size is 0 regardless of the length, so it is sound to
-        //   materialize a reference regardless of location.
-        // - By invariant, `self.ptr` has valid provenance.
-        let slc = unsafe { &*slc };
-
-        // This is correct because the preceding `as` cast preserves the number
-        // of slice elements. [1]
-        //
-        // [1] Per https://doc.rust-lang.org/reference/expressions/operator-expr.html#pointer-to-pointer-cast:
-        //
-        //   For slice types like `[T]` and `[U]`, the raw pointer types `*const
-        //   [T]`, `*mut [T]`, `*const [U]`, and `*mut [U]` encode the number of
-        //   elements in this slice. Casts between these raw pointer types
-        //   preserve the number of elements. ... The same holds for `str` and
-        //   any compound type whose unsized tail is a slice type, such as
-        //   struct `Foo(i32, [u8])` or `(u64, Foo)`.
-        slc.len()
+        #[cfg(no_zerocopy_slice_ptr_len_1_79_0)]
+        {
+            // `*mut [T]::len` was not stable before Rust 1.79. In every Rust
+            // version from our 1.56 MSRV through 1.78, `Hash for *mut T`
+            // decomposes a raw pointer and passes its address and metadata to
+            // the hasher in that order [1]. `Hash for usize` passes its value
+            // to `Hasher::write_usize` [2]. Capture those two values to obtain
+            // a candidate for the slice length without dereferencing `ptr` or
+            // constructing a reference.
+            //
+            // This historical `Hash` implementation is only used to produce a
+            // candidate. Before returning it, we reconstruct a raw slice and
+            // authenticate the candidate with `ptr::eq`, which compares slice
+            // lengths as well as addresses [3]. Thus, an unexpected `Hash`
+            // implementation cannot cause us to return incorrect metadata; it
+            // can only fail to produce an authenticated candidate.
+            //
+            // [1] Per https://doc.rust-lang.org/1.56.0/src/core/hash/mod.rs.html#776-782:
+            //
+            //   let (address, metadata) = self.to_raw_parts();
+            //   state.write_usize(address as usize);
+            //   metadata.hash(state);
+            //
+            // [2] Per https://doc.rust-lang.org/1.56.0/src/core/hash/mod.rs.html#628-656:
+            //
+            //   fn hash<H: Hasher>(&self, state: &mut H) {
+            //       state.$meth(*self)
+            //   }
+            //   ...
+            //   (usize, write_usize),
+            //
+            // [3] Per https://doc.rust-lang.org/1.56.0/std/ptr/fn.eq.html:
+            //
+            //   Slices are also compared by their length (fat pointers).
+            struct MetadataHasher {
+                values: [usize; 2],
+                writes: usize,
+                valid: bool,
+            }
+
+            impl Hasher for MetadataHasher {
+                #[inline(always)]
+                fn finish(&self) -> u64 {
+                    0
+                }
+
+                #[inline(always)]
+                fn write(&mut self, _bytes: &[u8]) {
+                    self.valid = false;
+                }
+
+                #[inline(always)]
+                fn write_usize(&mut self, value: usize) {
+                    match self.values.get_mut(self.writes) {
+                        Some(slot) => *slot = value,
+                        None => self.valid = false,
+                    }
+                    self.writes = self.writes.saturating_add(1);
+                }
+            }
+
+            let mut hasher = MetadataHasher { values: [0; 2], writes: 0, valid: true };
+            core::hash::Hash::hash(&ptr, &mut hasher);
+            assert!(
+                hasher.valid && hasher.writes == 2,
+                "unexpected raw-pointer Hash implementation"
+            );
+
+            let elems = hasher.values[1];
+            #[allow(clippy::as_conversions)]
+            let reconstructed = ptr::slice_from_raw_parts_mut(ptr as *mut T, elems);
+            assert!(ptr::eq(ptr, reconstructed), "captured value is not raw-slice metadata");
+            elems
+        }
     }
 }
 
@@ -1182,11 +1232,29 @@ fn pointer_to_metadata(ptr: *mut [T]) -> usize {
 #[doc(hidden)]
 pub const REPR_C_UNION_VARIANT_ID: i128 = -3;
 
+/// Marker types used to disambiguate implementations of projection traits that
+/// would otherwise conflict.
+#[doc(hidden)]
+#[allow(missing_copy_implementations, missing_debug_implementations)]
+pub mod project_clients {
+    pub enum TryFromBytesDerive {}
+
+    pub enum ProjectDerive {}
+}
+
+#[cfg(any(feature = "derive", test))]
+#[cfg_attr(doc_cfg, doc(cfg(feature = "derive")))]
+#[doc(hidden)]
+pub use zerocopy_derive::Project;
+
 /// # Safety
 ///
-/// `Self::ProjectToTag` must satisfy its safety invariant.
+/// `<Self as HasTag<Client>>::ProjectToTag` must satisfy its safety invariant.
+///
+/// The `Client` parameter exists solely to disambiguate between implementations
+/// of `HasTag` that would otherwise conflict.
 #[doc(hidden)]
-pub unsafe trait HasTag {
+pub unsafe trait HasTag<Client = project_clients::TryFromBytesDerive> {
     fn only_derive_is_allowed_to_implement_this_trait()
     where
         Self: Sized;
@@ -1198,28 +1266,35 @@ fn only_derive_is_allowed_to_implement_this_trait()
     ///
     /// # Safety
     ///
-    /// It must be the case that, for all `slf: Ptr<'_, Self, I>`, it is sound
-    /// to project from `slf` to `Ptr<'_, Self::Tag, I>` using this projection.
+    /// It must be the case that, for all `slf: Ptr<'_, Self, I>` where
+    /// `I::Aliasing` is `Shared`, it is sound to project it using this
+    /// projection to a `Ptr<'_, Self::Tag, (Shared, I::Alignment,
+    /// I::Validity)>`.
     type ProjectToTag: pointer::cast::Project<Self, Self::Tag>;
 }
 
 /// Projects a given field from `Self`.
 ///
-/// All implementations of `HasField` for a particular field `f` in `Self`
-/// should use the same `Field` type; this ensures that `Field` is inferable
-/// given an explicit `VARIANT_ID` and `FIELD_ID`.
+/// All implementations of `HasField` for a particular `Client` and field `f`
+/// in `Self` should use the same `Field` type; this ensures that `Field` is
+/// inferable given an explicit `Client`, `VARIANT_ID`, and `FIELD_ID`.
+///
+/// The `Client` parameter exists solely to disambiguate between implementations
+/// of `HasField` that would otherwise conflict.
 ///
 /// # Safety
 ///
 /// A field `f` is `HasField` for `Self` if and only if:
 ///
-/// - If `Self` has the layout of a struct or union type, then `VARIANT_ID` is
-///   `STRUCT_VARIANT_ID` or `UNION_VARIANT_ID` respectively; otherwise, if
-///   `Self` has the layout of an enum type, `VARIANT_ID` is the numerical index
-///   of the enum variant in which `f` appears. Note that `Self` does not need
-///   to actually *be* such a type – it just needs to have the same layout as
-///   such a type. For example, a `#[repr(transparent)]` wrapper around an enum
-///   has the same layout as that enum.
+/// - If `Self` has the layout of a struct type, `VARIANT_ID` is
+///   `STRUCT_VARIANT_ID`. If `Self` has the layout of a `repr(C)` union type,
+///   `VARIANT_ID` is `REPR_C_UNION_VARIANT_ID`; for other union layouts, it is
+///   `UNION_VARIANT_ID`. Otherwise, if `Self` has the layout of an enum type and
+///   `f` appears in a variant named `v`, `VARIANT_ID` is
+///   `zerocopy::ident_id!(v)`. Note that `Self` does not need to actually *be*
+///   such a type – it just needs to have the same layout as such a type. For
+///   example, a `#[repr(transparent)]` wrapper around an enum has the same
+///   layout as that enum.
 /// - If `f` has name `n`, `FIELD_ID` is `zerocopy::ident_id!(n)`; otherwise,
 ///   if `f` is at index `i`, `FIELD_ID` is `zerocopy::ident_id!(i)`.
 /// - `Field` is a type with the same visibility as `f`.
@@ -1232,8 +1307,8 @@ fn only_derive_is_allowed_to_implement_this_trait()
 ///
 /// The implementation of `project` must satisfy its safety post-condition.
 #[doc(hidden)]
-pub unsafe trait HasField<Field, const VARIANT_ID: i128, const FIELD_ID: i128>:
-    HasTag
+pub unsafe trait HasField<Client, Field, const VARIANT_ID: i128, const FIELD_ID: i128>:
+    HasTag<Client>
 {
     fn only_derive_is_allowed_to_implement_this_trait()
     where
@@ -1263,15 +1338,20 @@ fn only_derive_is_allowed_to_implement_this_trait()
 /// other words, it is a type-level function over invariants; `I` goes in,
 /// `Self::Invariants` comes out.
 ///
+/// The `Client` parameter exists solely to disambiguate between implementations
+/// of `ProjectField` (and their corresponding `HasField` implementations) that
+/// would otherwise conflict.
+///
 /// # Safety
 ///
-/// `T: ProjectField<Field, I, VARIANT_ID, FIELD_ID>` if, for a
-/// `ptr: Ptr<'_, T, I>` such that `T::is_projectable(ptr).is_ok()`,
-/// `<T as HasField<Field, VARIANT_ID, FIELD_ID>>::project(ptr.as_inner())`
+/// `T: ProjectField<Client, Field, I, VARIANT_ID, FIELD_ID>` if, for a
+/// `ptr: Ptr<'_, T, I>` such that `T::is_projectable` returns `Ok(())`
+/// when passed the tag pointer projected from `ptr`,
+/// `<T as HasField<Client, Field, VARIANT_ID, FIELD_ID>>::project(ptr.as_inner())`
 /// conforms to `T::Invariants`.
 #[doc(hidden)]
-pub unsafe trait ProjectField<Field, I, const VARIANT_ID: i128, const FIELD_ID: i128>:
-    HasField<Field, VARIANT_ID, FIELD_ID>
+pub unsafe trait ProjectField<Client, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128>:
+    HasField<Client, Field, VARIANT_ID, FIELD_ID>
 where
     I: invariant::Invariants,
 {
@@ -1290,29 +1370,35 @@ fn only_derive_is_allowed_to_implement_this_trait()
 
     /// Is the given field projectable from `ptr`?
     ///
-    /// If a field with [`Self::Invariants`] is projectable from the referent,
-    /// this function produces an `Ok(ptr)` from which the projection can be
-    /// made; otherwise `Err`.
+    /// If a field with [`Self::Invariants`] is projectable from the containing
+    /// value whose projected tag is `ptr`, this function produces `Ok(())`;
+    /// otherwise it produces `Err`.
     ///
     /// This method must be overriden if the field's projectability depends on
     /// the value of the bytes in `ptr`.
     #[inline(always)]
-    fn is_projectable<'a>(_ptr: Ptr<'a, Self::Tag, I>) -> Result<(), Self::Error> {
+    fn is_projectable<'a>(
+        _ptr: Ptr<
+            'a,
+            <Self as HasTag<Client>>::Tag,
+            (invariant::Shared, I::Alignment, I::Validity),
+        >,
+    ) -> Result<(), Self::Error> {
         trait IsInfallible {
             const IS_INFALLIBLE: bool;
         }
 
-        struct Projection<T, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128>(
-            PhantomData<(Field, I, T)>,
+        struct Projection<T, Client, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128>(
+            PhantomData<(Client, Field, I, T)>,
         )
         where
-            T: ?Sized + HasField<Field, VARIANT_ID, FIELD_ID>,
+            T: ?Sized + HasField<Client, Field, VARIANT_ID, FIELD_ID>,
             I: invariant::Invariants;
 
-        impl<T, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128> IsInfallible
-            for Projection<T, Field, I, VARIANT_ID, FIELD_ID>
+        impl<T, Client, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128> IsInfallible
+            for Projection<T, Client, Field, I, VARIANT_ID, FIELD_ID>
         where
-            T: ?Sized + HasField<Field, VARIANT_ID, FIELD_ID>,
+            T: ?Sized + HasField<Client, Field, VARIANT_ID, FIELD_ID>,
             I: invariant::Invariants,
         {
             const IS_INFALLIBLE: bool = {
@@ -1323,7 +1409,9 @@ impl<T, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128> IsInfallible
                     // referent. This default implementation of `is_projectable`
                     // is non-destructive, as it does not overwrite any part of
                     // the referent.
-                    crate::STRUCT_VARIANT_ID | crate::UNION_VARIANT_ID => true,
+                    crate::STRUCT_VARIANT_ID
+                    | crate::UNION_VARIANT_ID
+                    | crate::REPR_C_UNION_VARIANT_ID => true,
                     _enum_variant => {
                         use crate::invariant::{Validity, ValidityKind};
                         match I::Validity::KIND {
@@ -1336,9 +1424,9 @@ impl<T, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128> IsInfallible
                             // type – the type itself is irrelevant.
                             ValidityKind::Uninit | ValidityKind::Initialized => true,
                             // The projectability of an enum field from an
-                            // `AsInitialized` or `Valid` state is a dynamic
+                            // `AsInitialized` or `Safe` state is a dynamic
                             // property of its tag.
-                            ValidityKind::AsInitialized | ValidityKind::Valid => false,
+                            ValidityKind::AsInitialized | ValidityKind::Safe => false,
                         }
                     }
                 };
@@ -1348,7 +1436,7 @@ impl<T, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128> IsInfallible
         }
 
         const_assert!(
-            <Projection<Self, Field, I, VARIANT_ID, FIELD_ID> as IsInfallible>::IS_INFALLIBLE
+            <Projection<Self, Client, Field, I, VARIANT_ID, FIELD_ID> as IsInfallible>::IS_INFALLIBLE
         );
 
         Ok(())
@@ -1614,6 +1702,64 @@ fn only_derive_is_allowed_to_implement_this_trait()
 /// }
 /// ```
 ///
+#[cfg_attr(
+    zerocopy_unstable_ptr,
+    doc = r#"
+# Field invariants
+
+This experimental feature requires `--cfg zerocopy_unstable_ptr`.
+
+Named fields of structs, enum variants, and unions can specify additional
+runtime checks using `#[zerocopy(invariant(expression))]`:
+
+```
+# use zerocopy_derive::TryFromBytes;
+#[derive(TryFromBytes)]
+struct Foo {
+    a: u8,
+    #[zerocopy(invariant((*a.read() % 2) == (*b.read() as u8)))]
+    b: bool,
+    #[zerocopy(invariant(*c.read() > 0))]
+    c: i16,
+}
+```
+
+Each expression must return a `bool`. It has access to validated, read-only
+[`Ptr`]s to the current field and all preceding fields of the struct or
+variant, using their field names. A union's invariants have access only to
+the current field. The expression can use the existing [`Ptr`] APIs to
+inspect those fields. In this example, `read()` copies each field without
+requiring alignment, and dereferencing the resulting [`ReadOnly`] accesses
+the copied value.
+
+Rust's usual restrictions on local bindings apply; for example, a field name
+cannot shadow an in-scope constant.
+
+Fields are checked in declaration order. Each field's bit validity is
+checked before its invariants run. Multiple invariants on a field run in
+attribute order. For structs and enums, validation stops at the first invalid
+field or invariant that returns `false`. For unions, a failed bit-validity
+check or invariant causes validation to try the next field; validation
+succeeds as soon as one field and all its invariants pass. Each expression
+runs in its own closure; `return` returns from that expression, and panics
+propagate to the caller. Only the selected enum variant's fields and
+invariants are checked. Expressions may have arbitrary side effects, even
+when the conversion fails or its result is discarded.
+
+These predicates are additional acceptance checks beyond Rust's bit validity;
+bit-valid bytes may still be rejected. See [What is a "valid instance"?] for
+the distinction.
+
+[What is a "valid instance"?]: trait@TryFromBytes#what-is-a-valid-instance
+
+Invariants are not supported on tuple fields. Types with invariants cannot
+derive [`FromZeros`] or [`FromBytes`], whose conversions do not perform runtime
+validation. These checks apply to conversions through [`TryFromBytes`]; they
+do not restrict ordinary construction or mutation of Rust values.
+
+"#
+)]
+///
 /// # Portability
 ///
 /// To ensure consistent endianness for enums with multi-byte representations,
@@ -1708,6 +1854,14 @@ fn only_derive_is_allowed_to_implement_this_trait()
 /// If you are negatively affected by lack of support for a particular type,
 /// we encourage you to let us know by [filing an issue][github-repo].
 ///
+/// In this trait's conversion methods, a "valid instance" must also pass any
+/// configured field invariants, including those on nested fields. Rust bit
+/// validity alone does not guarantee that a conversion succeeds: an invariant
+/// may reject otherwise bit-valid bytes. Such predicates check acceptance at
+/// conversion time; they do not constrain subsequent mutation or ordinary Rust
+/// construction. See the [derive's field invariants][derive] documentation for
+/// the experimental attribute's syntax, evaluation order, and side effects.
+///
 /// # `TryFromBytes` is not symmetrical with [`IntoBytes`]
 ///
 /// There are some types which implement both `TryFromBytes` and [`IntoBytes`],
@@ -1754,25 +1908,25 @@ fn only_derive_is_allowed_to_implement_this_trait()
     ///
     /// # Safety
     ///
-    /// Unsafe code may assume that, if `is_bit_valid(candidate)` returns true,
+    /// Unsafe code may assume that, if `is_safe(candidate)` returns true,
     /// `*candidate` contains a valid `Self`.
     ///
     /// # Panics
     ///
-    /// `is_bit_valid` may panic. Callers are responsible for ensuring that any
-    /// `unsafe` code remains sound even in the face of `is_bit_valid`
-    /// panicking. (We support user-defined validation routines; so long as
-    /// these routines are not required to be `unsafe`, there is no way to
-    /// ensure that these do not generate panics.)
+    /// `is_safe` may panic. Callers are responsible for ensuring that any
+    /// `unsafe` code remains sound even in the face of `is_safe` panicking. (We
+    /// support user-defined validation routines; so long as these routines are
+    /// not required to be `unsafe`, there is no way to ensure that these do not
+    /// generate panics.)
     ///
-    /// Besides user-defined validation routines panicking, `is_bit_valid` will
-    /// either panic or fail to compile if called on a pointer with [`Shared`]
-    /// aliasing when `Self: !Immutable`.
+    /// Besides user-defined validation routines panicking, `is_safe` will either
+    /// panic or fail to compile if called on a pointer with [`Shared`] aliasing
+    /// when `Self: !Immutable`.
     ///
     /// [`UnsafeCell`]: core::cell::UnsafeCell
     /// [`Shared`]: invariant::Shared
     #[doc(hidden)]
-    fn is_bit_valid<A>(candidate: Maybe<'_, Self, A>) -> bool
+    fn is_safe<A>(candidate: Maybe<'_, Self, A>) -> bool
     where
         A: invariant::Alignment;
 
@@ -1872,7 +2026,7 @@ fn is_bit_valid<A>(candidate: Maybe<'_, Self, A>) -> bool
             @variant "dynamic_padding"
         ]
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_ref_from_bytes(source: &[u8]) -> Result<&Self, TryCastError<&[u8], Self>>
@@ -1885,7 +2039,7 @@ fn try_ref_from_bytes(source: &[u8]) -> Result<&Self, TryCastError<&[u8], Self>>
                 // This call may panic. If that happens, it doesn't cause any soundness
                 // issues, as we have not generated any invalid state which we need to
                 // fix before returning.
-                match source.try_into_valid() {
+                match source.try_into_safe() {
                     Ok(valid) => Ok(valid.as_ref()),
                     Err(e) => {
                         Err(e.map_src(|src| src.as_bytes::<BecauseImmutable>().as_ref()).into())
@@ -1995,7 +2149,7 @@ fn try_ref_from_bytes(source: &[u8]) -> Result<&Self, TryCastError<&[u8], Self>>
             @variant "dynamic_padding"
         ]
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_ref_from_prefix(source: &[u8]) -> Result<(&Self, &[u8]), TryCastError<&[u8], Self>>
@@ -2105,7 +2259,7 @@ fn try_ref_from_prefix(source: &[u8]) -> Result<(&Self, &[u8]), TryCastError<&[u
             @variant "dynamic_padding"
         ]
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_ref_from_suffix(source: &[u8]) -> Result<(&[u8], &Self), TryCastError<&[u8], Self>>
@@ -2199,7 +2353,7 @@ fn try_ref_from_suffix(source: &[u8]) -> Result<(&[u8], &Self), TryCastError<&[u
     #[doc = codegen_header!("h5", "try_mut_from_bytes")]
     ///
     /// See [`TryFromBytes::try_ref_from_bytes`](#method.try_ref_from_bytes.codegen).
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_mut_from_bytes(bytes: &mut [u8]) -> Result<&mut Self, TryCastError<&mut [u8], Self>>
@@ -2212,7 +2366,7 @@ fn try_mut_from_bytes(bytes: &mut [u8]) -> Result<&mut Self, TryCastError<&mut [
                 // This call may panic. If that happens, it doesn't cause any soundness
                 // issues, as we have not generated any invalid state which we need to
                 // fix before returning.
-                match source.try_into_valid() {
+                match source.try_into_safe() {
                     Ok(source) => Ok(source.as_mut()),
                     Err(e) => Err(e.map_src(|src| src.as_bytes().as_mut()).into()),
                 }
@@ -2308,7 +2462,7 @@ fn try_mut_from_bytes(bytes: &mut [u8]) -> Result<&mut Self, TryCastError<&mut [
     #[doc = codegen_header!("h5", "try_mut_from_prefix")]
     ///
     /// See [`TryFromBytes::try_ref_from_prefix`](#method.try_ref_from_prefix.codegen).
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_mut_from_prefix(
@@ -2408,7 +2562,7 @@ fn try_mut_from_prefix(
     #[doc = codegen_header!("h5", "try_mut_from_suffix")]
     ///
     /// See [`TryFromBytes::try_ref_from_suffix`](#method.try_ref_from_suffix.codegen).
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_mut_from_suffix(
@@ -2513,7 +2667,7 @@ fn try_mut_from_suffix(
             @variant "dynamic_padding"
         ]
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_ref_from_bytes_with_elems(
@@ -2529,7 +2683,7 @@ fn try_ref_from_bytes_with_elems(
                 // This call may panic. If that happens, it doesn't cause any soundness
                 // issues, as we have not generated any invalid state which we need to
                 // fix before returning.
-                match source.try_into_valid() {
+                match source.try_into_safe() {
                     Ok(source) => Ok(source.as_ref()),
                     Err(e) => {
                         Err(e.map_src(|src| src.as_bytes::<BecauseImmutable>().as_ref()).into())
@@ -2634,7 +2788,7 @@ fn try_ref_from_bytes_with_elems(
             @variant "dynamic_padding"
         ]
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_ref_from_prefix_with_elems(
@@ -2742,7 +2896,7 @@ fn try_ref_from_prefix_with_elems(
             @variant "dynamic_padding"
         ]
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_ref_from_suffix_with_elems(
@@ -2838,7 +2992,7 @@ fn try_ref_from_suffix_with_elems(
     #[doc = codegen_header!("h5", "try_mut_from_bytes_with_elems")]
     ///
     /// See [`TryFromBytes::try_ref_from_bytes_with_elems`](#method.try_ref_from_bytes_with_elems.codegen).
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_mut_from_bytes_with_elems(
@@ -2854,7 +3008,7 @@ fn try_mut_from_bytes_with_elems(
                 // This call may panic. If that happens, it doesn't cause any soundness
                 // issues, as we have not generated any invalid state which we need to
                 // fix before returning.
-                match source.try_into_valid() {
+                match source.try_into_safe() {
                     Ok(source) => Ok(source.as_mut()),
                     Err(e) => Err(e.map_src(|src| src.as_bytes().as_mut()).into()),
                 }
@@ -2949,7 +3103,7 @@ fn try_mut_from_bytes_with_elems(
     #[doc = codegen_header!("h5", "try_mut_from_prefix_with_elems")]
     ///
     /// See [`TryFromBytes::try_ref_from_prefix_with_elems`](#method.try_ref_from_prefix_with_elems.codegen).
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_mut_from_prefix_with_elems(
@@ -3049,7 +3203,7 @@ fn try_mut_from_prefix_with_elems(
     #[doc = codegen_header!("h5", "try_mut_from_suffix_with_elems")]
     ///
     /// See [`TryFromBytes::try_ref_from_suffix_with_elems`](#method.try_ref_from_suffix_with_elems.codegen).
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_mut_from_suffix_with_elems(
@@ -3116,24 +3270,14 @@ fn try_mut_from_suffix_with_elems(
         bench = "try_read_from_bytes",
         format = "coco_static_size",
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_read_from_bytes(source: &[u8]) -> Result<Self, TryReadError<&[u8], Self>>
     where
         Self: Sized,
     {
-        // FIXME(#2981): If `align_of::<Self>() == 1`, validate `source` in-place.
-
-        let candidate = match CoreMaybeUninit::<Self>::read_from_bytes(source) {
-            Ok(candidate) => candidate,
-            Err(e) => {
-                return Err(TryReadError::Size(e.with_dst()));
-            }
-        };
-        // SAFETY: `candidate` was copied from from `source: &[u8]`, so all of
-        // its bytes are initialized.
-        unsafe { try_read_from(source, candidate) }
+        try_read_from(source)
     }
 
     /// Attempts to read a `Self` from the prefix of the given `source`.
@@ -3194,24 +3338,24 @@ fn try_read_from_bytes(source: &[u8]) -> Result<Self, TryReadError<&[u8], Self>>
         bench = "try_read_from_prefix",
         format = "coco_static_size",
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_read_from_prefix(source: &[u8]) -> Result<(Self, &[u8]), TryReadError<&[u8], Self>>
     where
         Self: Sized,
     {
-        // FIXME(#2981): If `align_of::<Self>() == 1`, validate `source` in-place.
-
-        let (candidate, suffix) = match CoreMaybeUninit::<Self>::read_from_prefix(source) {
-            Ok(candidate) => candidate,
-            Err(e) => {
-                return Err(TryReadError::Size(e.with_dst()));
-            }
+        let (prefix, suffix) = match SplitAt::split_at(source, mem::size_of::<Self>()) {
+            Some(split) => split.via_immutable(),
+            None => return Err(SizeError::new(source).into()),
         };
-        // SAFETY: `candidate` was copied from from `source: &[u8]`, so all of
-        // its bytes are initialized.
-        unsafe { try_read_from(source, candidate).map(|slf| (slf, suffix)) }
+        match try_read_from(prefix) {
+            Ok(slf) => Ok((slf, suffix)),
+            Err(e) => Err(e.map_src(
+                #[inline(always)]
+                |_| source,
+            )),
+        }
     }
 
     /// Attempts to read a `Self` from the suffix of the given `source`.
@@ -3273,44 +3417,72 @@ fn try_read_from_prefix(source: &[u8]) -> Result<(Self, &[u8]), TryReadError<&[u
         bench = "try_read_from_suffix",
         format = "coco_static_size",
     )]
-    #[must_use = "has no side effects"]
+    #[must_use = "the conversion result must be checked"]
     #[cfg_attr(zerocopy_inline_always, inline(always))]
     #[cfg_attr(not(zerocopy_inline_always), inline)]
     fn try_read_from_suffix(source: &[u8]) -> Result<(&[u8], Self), TryReadError<&[u8], Self>>
     where
         Self: Sized,
     {
-        // FIXME(#2981): If `align_of::<Self>() == 1`, validate `source` in-place.
-
-        let (prefix, candidate) = match CoreMaybeUninit::<Self>::read_from_suffix(source) {
-            Ok(candidate) => candidate,
-            Err(e) => {
-                return Err(TryReadError::Size(e.with_dst()));
-            }
+        let split_at = match source.len().checked_sub(mem::size_of::<Self>()) {
+            Some(split_at) => split_at,
+            None => return Err(SizeError::new(source).into()),
         };
-        // SAFETY: `candidate` was copied from from `source: &[u8]`, so all of
-        // its bytes are initialized.
-        unsafe { try_read_from(source, candidate).map(|slf| (prefix, slf)) }
+        // SAFETY: `checked_sub` returned the difference without overflow [1],
+        // so `split_at = source.len() - size_of::<Self>() <= source.len()`.
+        // This satisfies `SplitAt::split_at_unchecked`'s precondition.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/std/primitive.usize.html#method.checked_sub:
+        //
+        //   Checked integer subtraction. Computes `self - rhs`, returning
+        //   `None` if overflow occurred.
+        let (prefix, suffix) =
+            unsafe { SplitAt::split_at_unchecked(source, split_at) }.via_immutable();
+        match try_read_from(suffix) {
+            Ok(slf) => Ok((prefix, slf)),
+            Err(e) => Err(e.map_src(
+                #[inline(always)]
+                |_| source,
+            )),
+        }
     }
 }
 
+/// Validates and interprets the given affix of `source`'s bytes as a `&T`.
+///
+/// Returns the destination reference and excess bytes on success. All errors,
+/// including validity errors, contain the original `&S`.
 #[inline(always)]
-fn try_ref_from_prefix_suffix<T: TryFromBytes + KnownLayout + Immutable + ?Sized>(
-    source: &[u8],
+fn try_ref_from_prefix_suffix<S, T>(
+    source: &S,
     cast_type: CastType,
     meta: Option<T::PointerMetadata>,
-) -> Result<(&T, &[u8]), TryCastError<&[u8], T>> {
-    match Ptr::from_ref(source).try_cast_into::<T, BecauseImmutable>(cast_type, meta) {
-        Ok((source, prefix_suffix)) => {
+) -> Result<(&T, &[u8]), TryCastError<&S, T>>
+where
+    S: IntoBytes + Immutable + ?Sized,
+    T: TryFromBytes + KnownLayout + Immutable + ?Sized,
+{
+    match Ptr::from_ref(source.as_bytes()).try_cast_into::<T, BecauseImmutable>(cast_type, meta) {
+        Ok((candidate, prefix_suffix)) => {
             // This call may panic. If that happens, it doesn't cause any soundness
             // issues, as we have not generated any invalid state which we need to
             // fix before returning.
-            match source.try_into_valid() {
+            match candidate.try_into_safe() {
                 Ok(valid) => Ok((valid.as_ref(), prefix_suffix.as_ref())),
-                Err(e) => Err(e.map_src(|src| src.as_bytes::<BecauseImmutable>().as_ref()).into()),
+                Err(e) => Err(e
+                    .map_src(
+                        #[inline(always)]
+                        |_| source,
+                    )
+                    .into()),
             }
         }
-        Err(e) => Err(e.map_src(Ptr::as_ref).into()),
+        Err(e) => Err(e
+            .map_src(
+                #[inline(always)]
+                |_| source,
+            )
+            .into()),
     }
 }
 
@@ -3325,7 +3497,7 @@ fn try_mut_from_prefix_suffix<T: IntoBytes + TryFromBytes + KnownLayout + ?Sized
             // This call may panic. If that happens, it doesn't cause any soundness
             // issues, as we have not generated any invalid state which we need to
             // fix before returning.
-            match candidate.try_into_valid() {
+            match candidate.try_into_safe() {
                 Ok(valid) => Ok((valid.as_mut(), prefix_suffix.as_mut())),
                 Err(e) => Err(e.map_src(|src| src.as_bytes().as_mut()).into()),
             }
@@ -3339,49 +3511,112 @@ fn swap<T, U>((t, u): (T, U)) -> (U, T) {
     (u, t)
 }
 
-/// # Safety
-///
-/// All bytes of `candidate` must be initialized.
 #[inline(always)]
-unsafe fn try_read_from<S, T: TryFromBytes>(
-    source: S,
-    mut candidate: CoreMaybeUninit<T>,
-) -> Result<T, TryReadError<S, T>> {
+fn try_read_from<S, T>(source: &S) -> Result<T, TryReadError<&S, T>>
+where
+    S: IntoBytes + Immutable + ?Sized,
+    T: TryFromBytes,
+{
+    let bytes = source.as_bytes();
+
+    if bytes.len() != mem::size_of::<T>() {
+        return Err(SizeError::new(source).into());
+    }
+
+    // FIXME(#2981): Avoid the validation copy when validation can safely use
+    // a pointer derived from `source`'s shared borrow.
+
+    // Initialize the candidate in its final location. A typed move of a
+    // `MaybeUninit<T>` may discard initialized bytes at `T`'s padding offsets
+    // [1], but validation requires every byte to be initialized. Do not move
+    // `candidate` between this copy and validation.
+    //
+    // [1] Per https://doc.rust-lang.org/1.93.1/std/mem/union.MaybeUninit.html#validity:
+    //
+    //   Moving or copying a value of type `MaybeUninit<T>` (i.e., performing a
+    //   "typed copy") will exactly preserve the contents, including the
+    //   provenance, of all non-padding bytes of type `T` in the value's
+    //   representation.
+    let mut candidate = CoreMaybeUninit::<T>::uninit();
+
+    // SAFETY: The earlier `if bytes.len() != mem::size_of::<T>()` returns on a
+    // size mismatch, so reaching this copy implies that `bytes.len()` equals
+    // `mem::size_of::<T>()`. Copying that many `u8`s cannot overrun `bytes`.
+    // `candidate.as_mut_ptr()` is writable for the same number of bytes because
+    // `MaybeUninit<T>` has `T`'s size. Both pointers are non-null and aligned
+    // for `u8`, including when `T` is zero-sized. The fresh local allocation
+    // cannot overlap `source`, which is an argument. Thus the read, write,
+    // alignment, and non-overlap requirements of [2] hold. Copying `u8`s
+    // initializes every destination byte, including those at `T`'s padding
+    // offsets.
+    //
+    // These writes cannot violate `candidate`'s bit validity because every bit
+    // pattern is valid for `MaybeUninit<T>` [3], even if it is invalid for `T`.
+    //
+    // [2] Per https://doc.rust-lang.org/1.56.0/std/ptr/fn.copy_nonoverlapping.html:
+    //
+    //   Copies `count * size_of::<T>()` bytes from `src` to `dst`. The source
+    //   and destination must *not* overlap.
+    //
+    // [3] Per https://doc.rust-lang.org/1.56.0/std/mem/union.MaybeUninit.html#layout:
+    //
+    //   ... any bit value is valid for a `MaybeUninit<T>` ...
+    unsafe {
+        ptr::copy_nonoverlapping(
+            bytes.as_ptr(),
+            candidate.as_mut_ptr().cast::<u8>(),
+            mem::size_of::<T>(),
+        );
+    }
+
     // We use `from_mut` despite not mutating via `c_ptr` so that we don't need
     // to add a `T: Immutable` bound.
     let c_ptr = Ptr::from_mut(&mut candidate);
+
     // SAFETY: `c_ptr` has no uninitialized sub-ranges because it derived from
-    // `candidate`, which the caller promises is entirely initialized. Since
-    // `candidate` is a `MaybeUninit`, it has no validity requirements, and so
-    // no values written to an `Initialized` `c_ptr` can violate its validity.
-    // Since `c_ptr` has `Exclusive` aliasing, no mutations may happen except
-    // via `c_ptr` so long as it is live, so we don't need to worry about the
-    // fact that `c_ptr` may have more restricted validity than `candidate`.
+    // `candidate`, whose bytes were all initialized by the copy above and which
+    // has not been moved since. Since `candidate` is a `MaybeUninit`, it has no
+    // validity requirements, and so no values written to an `Initialized`
+    // `c_ptr` can violate its validity. Since `c_ptr` has `Exclusive` aliasing,
+    // no mutations may happen except via `c_ptr` so long as it is live, so we
+    // don't need to worry about the fact that `c_ptr` may have more restricted
+    // validity than `candidate`.
     let c_ptr = unsafe { c_ptr.assume_validity::<invariant::Initialized>() };
-    let mut c_ptr = c_ptr.cast::<_, crate::pointer::cast::CastSized, _>();
 
-    // Since we don't have `T: KnownLayout`, we hack around that by using
-    // `Wrapping<T>`, which implements `KnownLayout` even if `T` doesn't.
+    let c_ptr = c_ptr.cast::<_, crate::pointer::cast::CastSized, _>();
+
+    // SAFETY: `c_ptr` originated from a reference to `candidate`, so its
+    // address is aligned for `MaybeUninit<T>`, which has `T`'s alignment [1].
+    // `CastSized` preserves that address. `ReadOnly<T>` is `repr(transparent)`
+    // with a single `T` field, so it also has `T`'s alignment [2], including
+    // when `T` is zero-sized.
     //
+    // [1] Per https://doc.rust-lang.org/1.56.0/std/mem/union.MaybeUninit.html#layout:
+    //
+    //   `MaybeUninit<T>` is guaranteed to have the same size, alignment, and
+    //   ABI as `T`:
+    //
+    // [2] Per https://doc.rust-lang.org/1.93.1/reference/type-layout.html#the-transparent-representation:
+    //
+    //   ... same layout and ABI as the only non-size 0 non-alignment 1 field,
+    //   if present, or unit otherwise.
+    let mut c_ptr = unsafe { c_ptr.assume_alignment::<invariant::Aligned>() };
+
     // This call may panic. If that happens, it doesn't cause any soundness
     // issues, as we have not generated any invalid state which we need to fix
     // before returning.
-    if !Wrapping::<T>::is_bit_valid(c_ptr.reborrow_shared().forget_aligned()) {
+    if !T::is_safe(c_ptr.reborrow_shared()) {
         return Err(ValidityError::new(source).into());
     }
 
-    fn _assert_same_size_and_validity<T>()
-    where
-        Wrapping<T>: pointer::TransmuteFrom<T, invariant::Valid, invariant::Valid>,
-        T: pointer::TransmuteFrom<Wrapping<T>, invariant::Valid, invariant::Valid>,
-    {
-    }
-
-    _assert_same_size_and_validity::<T>();
-
-    // SAFETY: We just validated that `candidate` contains a valid
-    // `Wrapping<T>`, which has the same size and bit validity as `T`, as
-    // guaranteed by the preceding type assertion.
+    // SAFETY: `T::is_safe` returned true for `candidate`'s initialized bytes,
+    // so it contains a valid `T`, as required by [1]. Validation used a shared
+    // `ReadOnly<T>` pointer, and the bytes have not been modified since.
+    //
+    // [1] Per https://doc.rust-lang.org/1.56.0/std/mem/union.MaybeUninit.html#method.assume_init:
+    //
+    //   It is up to the caller to guarantee that the `MaybeUninit<T>` really is
+    //   in an initialized state.
     Ok(unsafe { candidate.assume_init() })
 }
 
@@ -5464,22 +5699,32 @@ fn read_from(source: &[u8]) -> Option<Self>
     }
 }
 
-/// Interprets the given affix of the given bytes as a `&Self`.
+/// Interprets the given affix of `source`'s bytes as a `&T`.
 ///
-/// This method computes the largest possible size of `Self` that can fit in the
-/// prefix or suffix bytes of `source`, then attempts to return both a reference
-/// to those bytes interpreted as a `Self`, and a reference to the excess bytes.
-/// If there are insufficient bytes, or if that affix of `source` is not
-/// appropriately aligned, this returns `Err`.
+/// This method uses `meta` if provided; otherwise, it computes the largest
+/// possible size of `T` that can fit in the prefix or suffix bytes of `source`.
+/// It returns both a reference to those bytes interpreted as a `T`, and a
+/// reference to the excess bytes. If there are insufficient bytes, or if that
+/// affix of `source` is not appropriately aligned, this returns `Err` containing
+/// the original `&S`.
 #[inline(always)]
-fn ref_from_prefix_suffix<T: FromBytes + KnownLayout + Immutable + ?Sized>(
-    source: &[u8],
+fn ref_from_prefix_suffix<S, T>(
+    source: &S,
     meta: Option<T::PointerMetadata>,
     cast_type: CastType,
-) -> Result<(&T, &[u8]), CastError<&[u8], T>> {
-    let (slf, prefix_suffix) = Ptr::from_ref(source)
+) -> Result<(&T, &[u8]), CastError<&S, T>>
+where
+    S: IntoBytes + Immutable + ?Sized,
+    T: FromBytes + KnownLayout + Immutable + ?Sized,
+{
+    let (slf, prefix_suffix) = Ptr::from_ref(source.as_bytes())
         .try_cast_into::<_, BecauseImmutable>(cast_type, meta)
-        .map_err(|err| err.map_src(|s| s.as_ref()))?;
+        .map_err(|err| {
+            err.map_src(
+                #[inline(always)]
+                |_| source,
+            )
+        })?;
     Ok((slf.recall_validity().as_ref(), prefix_suffix.as_ref()))
 }
 
@@ -5602,6 +5847,10 @@ fn mut_from_prefix_suffix<T: FromBytes + IntoBytes + KnownLayout + ?Sized>(
 ///       if its field is [`IntoBytes`]; else,
 ///     - if the type has no generic parameters, it is [`IntoBytes`] if the type
 ///       is sized and has no padding bytes; else,
+///     - if the type is `repr(C)` without an `align(N)` modifier for `N > 1`
+///       (it may have `align(1)` or `packed(N)`), and every field is `T`,
+///       `[T; N]`, or a final `[T]` for the same type parameter `T`, it is
+///       [`IntoBytes`]; else,
 ///     - if the type is `repr(C)`, its fields must be [`Unaligned`].
 /// - If the type is an enum:
 ///   - It must have a defined representation (`repr`s `C`, `u8`, `u16`, `u32`,
@@ -6493,6 +6742,39 @@ fn from_mut_slice(slc: &mut [u8]) -> &mut Unsized {
         }
     }
 
+    // These types exercise a nested slice DST whose inner trailing-padding
+    // operation cannot be flattened into the alignment of the packed outer
+    // type. For `NestedPackedDstOuter<[u8]>`, the trailing slice begins at
+    // offset 7, but the size for `elems` elements is
+    // `2 + round_up(5 + elems, 4)`.
+    //
+    // The Reference rejects directly placing an alignment-4 field in a
+    // `repr(packed(2))` type. Rust currently accepts this construction through
+    // generic indirection. So long as Rust accepts it, this test deliberately
+    // treats its layout as following the otherwise-applicable `repr(C)` and
+    // `repr(packed)` rules.
+    #[derive(FromBytes, Immutable, KnownLayout)]
+    #[repr(C, align(4))]
+    struct NestedPackedDstWord([u8; 4]);
+
+    #[derive(FromBytes, Immutable, KnownLayout)]
+    #[repr(C)]
+    struct NestedPackedDstInner<T: ?Sized> {
+        a: NestedPackedDstWord,
+        b: u8,
+        tail: T,
+    }
+
+    #[derive(FromBytes, Immutable, KnownLayout)]
+    #[repr(C, packed(2))]
+    struct NestedPackedDstOuter<T: ?Sized> {
+        z: u8,
+        inner: ManuallyDrop<NestedPackedDstInner<T>>,
+    }
+
+    #[repr(C, align(2))]
+    struct Align2<T>(T);
+
     #[test]
     fn test_known_layout() {
         // Test that `$ty` and `ManuallyDrop<$ty>` have the expected layout.
@@ -6507,17 +6789,25 @@ macro_rules! test {
             };
         }
 
-        let layout =
-            |offset, align, trailing_slice_elem_size, statically_shallow_unpadded| DstLayout {
-                align: NonZeroUsize::new(align).unwrap(),
+        let layout = |offset, align, trailing_slice_elem_size, statically_shallow_unpadded| {
+            let align = NonZeroUsize::new(align).unwrap();
+            let size_phase = offset % align;
+            DstLayout {
+                align,
                 size_info: match trailing_slice_elem_size {
                     None => SizeInfo::Sized { size: offset },
-                    Some(elem_size) => {
-                        SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size })
-                    }
+                    Some(elem_size) => SizeInfo::SliceDst(TrailingSliceLayout {
+                        offset,
+                        elem_size,
+                        size_base: offset - size_phase,
+                        size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                            align, size_phase,
+                        ),
+                    }),
                 },
                 statically_shallow_unpadded,
-            };
+            }
+        };
 
         test!((), layout(0, 1, None, false));
         test!(u8, layout(1, 1, None, false));
@@ -6533,6 +6823,153 @@ macro_rules! test {
         test!(str, layout(0, 1, Some(1), true));
     }
 
+    #[test]
+    fn test_known_layout_pointer_to_metadata() {
+        fn test<T>(data: *mut T, elems: usize) {
+            let ptr = ptr::slice_from_raw_parts_mut(data, elems);
+            assert_eq!(<[T] as KnownLayout>::pointer_to_metadata(ptr), elems);
+        }
+
+        for elems in [0, 1, usize::MAX] {
+            test(ptr::null_mut::<u8>(), elems);
+        }
+
+        test(NonNull::<u8>::dangling().as_ptr(), 0);
+
+        let mut bytes = [1, 2, 3];
+        test(bytes.as_mut_ptr(), bytes.len());
+        assert_eq!(bytes, [1, 2, 3]);
+
+        test(NonNull::<()>::dangling().as_ptr(), usize::MAX);
+
+        // Retaining and inspecting a raw pointer after freeing its allocation
+        // is safe so long as the pointer is not dereferenced.
+        let deallocated = {
+            let mut byte = Box::new(0u8);
+            let ptr: *mut u8 = &mut *byte;
+            drop(byte);
+            ptr
+        };
+        test(deallocated, 3);
+
+        // Metadata extraction requires neither element storage nor alignment
+        // for `T`; it does not access the pointer's referent.
+        test(NonNull::<u8>::dangling().as_ptr().cast::<u64>(), usize::MAX);
+    }
+
+    #[cfg(feature = "derive")]
+    #[test]
+    fn test_known_layout_pointer_to_metadata_derive() {
+        #[derive(KnownLayout)]
+        #[repr(C)]
+        struct Dst {
+            prefix: u8,
+            trailing: [u8],
+        }
+
+        for elems in [0, 1, usize::MAX] {
+            let ptr = ptr::slice_from_raw_parts_mut(ptr::null_mut::<u8>(), elems);
+            #[allow(clippy::as_conversions)]
+            let ptr = ptr as *mut Dst;
+            assert_eq!(Dst::pointer_to_metadata(ptr), elems);
+        }
+    }
+
+    #[test]
+    fn test_nested_packed_dst_layout() {
+        fn assert_native_size<const N: usize>(expected: usize) {
+            let value = NestedPackedDstOuter {
+                z: 0,
+                inner: ManuallyDrop::new(NestedPackedDstInner {
+                    a: NestedPackedDstWord([0; 4]),
+                    b: 0,
+                    tail: [0; N],
+                }),
+            };
+            let value: &NestedPackedDstOuter<[u8]> = &value;
+            assert_eq!(mem::size_of_val(value), expected);
+            assert_eq!(NestedPackedDstOuter::<[u8]>::size_for_metadata(N), Some(expected));
+        }
+
+        assert_native_size::<0>(10);
+        assert_native_size::<1>(10);
+        assert_native_size::<2>(10);
+        assert_native_size::<3>(10);
+        assert_native_size::<4>(14);
+        assert_native_size::<7>(14);
+        assert_native_size::<8>(18);
+
+        let layout = NestedPackedDstOuter::<[u8]>::LAYOUT;
+        assert_eq!(layout.align.get(), 2);
+        assert!(layout.requires_dynamic_padding());
+        assert_eq!(
+            layout.size_info,
+            SizeInfo::SliceDst(TrailingSliceLayout {
+                offset: 7,
+                elem_size: 1,
+                size_base: 6,
+                size_rounding_align_and_phase: RoundingAlignAndPhase::new(
+                    NonZeroUsize::new(4).unwrap(),
+                    1
+                ),
+            })
+        );
+
+        // Eight bytes used to be incorrectly accepted for a zero-element
+        // value. The actual Rust layout requires ten bytes.
+        let short = Align2([0u8; 8]);
+        assert!(NestedPackedDstOuter::<[u8]>::ref_from_bytes_with_elems(&short.0, 0).is_err());
+        assert!(pointer::Ptr::from_ref(&short.0[..])
+            .try_cast_into::<NestedPackedDstOuter<[u8]>, pointer::BecauseImmutable>(
+                CastType::Prefix,
+                Some(0),
+            )
+            .is_err());
+
+        let full = Align2([0, 0, 0, 0, 0, 0, 0, 0, b'S', b'!']);
+        let value = NestedPackedDstOuter::<[u8]>::ref_from_bytes_with_elems(&full.0, 0).unwrap();
+        assert_eq!(mem::size_of_val(value), 10);
+
+        // When metadata is inferred, lengths 0 through 3 all produce a
+        // ten-byte object. Parsing chooses the largest trailing-slice length
+        // which fits exactly.
+        let inferred = NestedPackedDstOuter::<[u8]>::ref_from_bytes(&full.0).unwrap();
+        assert_eq!(pointer::Ptr::from_ref(inferred).len(), 3);
+
+        // Trailing padding includes the inner type's padding, even when the
+        // outer type's alignment is reduced by packing.
+        let trailing_layout = trailing_slice_layout::<NestedPackedDstOuter<[u8]>>();
+        for (elems, expected) in [(0, 3), (1, 2), (2, 1), (3, 0), (4, 3)] {
+            assert_eq!(trailing_layout.padding_for_elems(elems), expected);
+        }
+    }
+
+    // Before Rust 1.76, rust-lang/rust#118537 caused `addr_of_mut!` to
+    // miscompute the offset of an unsized field in a packed struct. The fix is
+    // rust-lang/rust#118540. Keep the layout and parsing regression above on
+    // all supported compilers, and gate only the projection regression which
+    // necessarily exercises that independent compiler bug.
+    #[rustversion::since(1.76.0)]
+    #[test]
+    fn test_nested_packed_dst_projection() {
+        let full = Align2([0, 0, 0, 0, 0, 0, 0, 0, b'S', b'!']);
+
+        // The projected inner value occupies the final eight bytes of the full
+        // ten-byte input, including the two sentinel bytes.
+        let (value, rest) = pointer::Ptr::from_ref(&full.0[..])
+            .try_cast_into::<NestedPackedDstOuter<[u8]>, pointer::BecauseImmutable>(
+                CastType::Prefix,
+                Some(0),
+            )
+            .unwrap();
+        assert!(rest.as_ref().is_empty());
+        let inner = value.project::<project_clients::TryFromBytesDerive, _, { STRUCT_VARIANT_ID }, { ident_id!(inner) }>().unwrap();
+        assert_eq!(
+            inner.as_bytes::<pointer::BecauseImmutable>().as_ref(),
+            &[0, 0, 0, 0, 0, 0, b'S', b'!']
+        );
+    }
+
     #[cfg(feature = "derive")]
     #[test]
     fn test_known_layout_derive() {
@@ -6588,10 +7025,19 @@ fn _assert_kl<T: ?Sized + KnownLayout>(_: &T) {}
             statically_shallow_unpadded: false,
         };
 
-        let unsized_layout = |align, elem_size, offset, statically_shallow_unpadded| DstLayout {
-            align: NonZeroUsize::new(align).unwrap(),
-            size_info: SizeInfo::SliceDst(TrailingSliceLayout { offset, elem_size }),
-            statically_shallow_unpadded,
+        let unsized_layout = |align, elem_size, offset, statically_shallow_unpadded| {
+            let align = NonZeroUsize::new(align).unwrap();
+            let size_phase = offset % align;
+            DstLayout {
+                align,
+                size_info: SizeInfo::SliceDst(TrailingSliceLayout {
+                    offset,
+                    elem_size,
+                    size_base: offset - size_phase,
+                    size_rounding_align_and_phase: RoundingAlignAndPhase::new(align, size_phase),
+                }),
+                statically_shallow_unpadded,
+            }
         };
 
         // | `repr(C)`? | generic? | `KnownLayout`? | `Sized`? | Type Name |
@@ -7152,6 +7598,112 @@ fn test_try_from_bytes_try_read_from() {
         );
     }
 
+    #[test]
+    fn test_try_read_from_typed_source() {
+        #[derive(IntoBytes, Immutable)]
+        #[repr(transparent)]
+        struct Source<T: ?Sized>(T);
+
+        fn check<S: IntoBytes + Immutable + ?Sized>(source: &S, valid: bool) {
+            match try_read_from::<_, [bool; 4]>(source) {
+                Ok(value) => {
+                    assert!(valid);
+                    assert_eq!(value, [false, true, false, true]);
+                }
+                Err(error) => {
+                    assert!(!valid);
+                    assert!(matches!(error, TryReadError::Validity(_)));
+                    assert!(ptr::eq(error.into_src(), source));
+                }
+            }
+
+            let error = try_read_from::<_, [bool; 5]>(source).unwrap_err();
+            assert!(matches!(error, TryReadError::Size(_)));
+            assert!(ptr::eq(error.into_src(), source));
+        }
+
+        for (value, valid) in [(u16::from_ne_bytes([0, 1]), true), (0x0202, false)] {
+            let source = Source([value; 2]);
+            check(&source, valid);
+            let source: &Source<[u16]> = &source;
+            check(source, valid);
+        }
+
+        let source = Source([(); 2]);
+        assert!(try_read_from::<_, ()>(&source).is_ok());
+        let source: &Source<[()]> = &source;
+        assert!(try_read_from::<_, ()>(source).is_ok());
+    }
+
+    #[test]
+    fn test_try_read_initialized_padding() {
+        #[derive(KnownLayout, Immutable, Debug, PartialEq, Eq)]
+        #[repr(C, align(8))]
+        struct Padded(u8);
+
+        // SAFETY: `Padded` has only a `u8` field and padding, so all
+        // initialized byte sequences are valid. Per
+        // https://doc.rust-lang.org/1.93.1/reference/behavior-considered-undefined.html#invalid-values:
+        //
+        //   An integer (`i*`/`u*`), floating point value (`f*`), or raw pointer
+        //   must be initialized, i.e., must not be obtained from uninitialized
+        //   memory.
+        //
+        //   A `struct`, tuple, and array requires all fields/elements to be
+        //   valid at their respective type.
+        const _: () = unsafe {
+            unsafe_impl!(=> TryFromBytes for Padded; |candidate| {
+                // Observe every byte while validation is running, including
+                // padding that a typed move of `MaybeUninit<Padded>` could
+                // discard. The returned `Padded` need not retain its padding.
+                assert_eq!(candidate.as_bytes::<BecauseImmutable>().as_ref(), &[0xA5; 8]);
+                true
+            })
+        };
+
+        let source = [0xA5; 8];
+        assert_eq!(Padded::try_read_from_bytes(&source), Ok(Padded(0xA5)));
+
+        let prefix_source = [0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0];
+        let (value, suffix) = Padded::try_read_from_prefix(&prefix_source).unwrap();
+        assert_eq!(value, Padded(0xA5));
+        assert!(ptr::eq(suffix, &prefix_source[8..]));
+
+        let suffix_source = [0, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5, 0xA5];
+        let (prefix, value) = Padded::try_read_from_suffix(&suffix_source).unwrap();
+        assert_eq!(value, Padded(0xA5));
+        assert!(ptr::eq(prefix, &suffix_source[..1]));
+    }
+
+    #[test]
+    fn test_try_read_error_sources_and_zero_sized() {
+        let invalid = [2, 3];
+        for (error, source) in [
+            (bool::try_read_from_bytes(&invalid[..1]).unwrap_err(), &invalid[..1]),
+            (bool::try_read_from_prefix(&invalid).unwrap_err(), &invalid[..]),
+            (bool::try_read_from_suffix(&invalid).unwrap_err(), &invalid[..]),
+        ] {
+            assert!(matches!(error, TryReadError::Validity(_)));
+            assert!(ptr::eq(error.into_src(), source));
+        }
+        for source in [&[][..], &invalid[..]] {
+            let error = bool::try_read_from_bytes(source).unwrap_err();
+            assert!(matches!(error, TryReadError::Size(_)));
+            assert!(ptr::eq(error.into_src(), source));
+        }
+        for error in [
+            bool::try_read_from_prefix(&invalid[..0]).unwrap_err(),
+            bool::try_read_from_suffix(&invalid[..0]).unwrap_err(),
+        ] {
+            assert!(matches!(error, TryReadError::Size(_)));
+            assert!(ptr::eq(error.into_src(), &invalid[..0]));
+        }
+
+        assert_eq!(<()>::try_read_from_bytes(&[]), Ok(()));
+        assert_eq!(<()>::try_read_from_prefix(&invalid), Ok(((), &invalid[..])));
+        assert_eq!(<()>::try_read_from_suffix(&invalid), Ok((&invalid[..], ())));
+    }
+
     #[test]
     fn test_ref_from_mut_from_bytes() {
         // Test `FromBytes::{ref_from_bytes, mut_from_bytes}{,_prefix,Suffix}`
@@ -7502,6 +8054,16 @@ fn test_new_box_zeroed_with_elems() {
             assert_eq!(&*s, &[0, 3, 0]);
         }
 
+        #[test]
+        fn test_new_box_zeroed_with_elems_nested_packed_dst() {
+            let mut value = NestedPackedDstOuter::<[u8]>::new_box_zeroed_with_elems(0).unwrap();
+            assert_eq!(mem::size_of_val(&*value), 10);
+
+            // Exercise the whole-object write that exposed the former
+            // under-allocation under Miri and AddressSanitizer.
+            value.zero();
+        }
+
         #[test]
         fn test_new_box_zeroed_with_elems_empty() {
             let s: Box<[u64]> = <[u64]>::new_box_zeroed_with_elems(0).unwrap();
@@ -7571,6 +8133,133 @@ fn test_deprecated_from_bytes() {
         assert_eq!(rest.len(), 4);
     }
 
+    #[test]
+    fn test_ref_from_prefix_suffix_typed_source() {
+        #[derive(IntoBytes, Immutable)]
+        #[repr(transparent)]
+        struct Source<T: ?Sized>(T);
+
+        fn check<S: IntoBytes + Immutable + ?Sized>(source: &S) {
+            let bytes = source.as_bytes();
+            assert_eq!(bytes.len(), 4);
+
+            for cast_type in [CastType::Prefix, CastType::Suffix] {
+                let (expected, expected_rest) = match cast_type {
+                    CastType::Prefix => (&bytes[..3], &bytes[3..]),
+                    CastType::Suffix => (&bytes[1..], &bytes[..1]),
+                };
+                for meta in [None, Some(1)] {
+                    let (value, rest) =
+                        ref_from_prefix_suffix::<_, [[u8; 3]]>(source, meta, cast_type).unwrap();
+                    assert_eq!(value, &[expected]);
+                    assert!(ptr::eq(value.as_bytes(), expected));
+                    assert!(ptr::eq(rest, expected_rest));
+                }
+
+                let err =
+                    ref_from_prefix_suffix::<_, [u8; 5]>(source, None, cast_type).unwrap_err();
+                assert!(matches!(err, CastError::Size(_)));
+                assert!(ptr::eq(err.into_src(), source));
+
+                let err =
+                    ref_from_prefix_suffix::<_, [u8]>(source, Some(5), cast_type).unwrap_err();
+                assert!(matches!(err, CastError::Size(_)));
+                assert!(ptr::eq(err.into_src(), source));
+            }
+        }
+
+        check(&Source([0x0102u16, 0x0304]));
+        let source = Source([false, true, false, true]);
+        let source: &Source<[bool]> = &source;
+        check(source);
+    }
+
+    #[test]
+    fn test_ref_from_prefix_suffix_typed_source_alignment_error() {
+        let storage = Align::<[bool; 9], AU64>::new([false; 9]);
+        for cast_type in [CastType::Prefix, CastType::Suffix] {
+            let source = match cast_type {
+                CastType::Prefix => &storage.t[1..],
+                CastType::Suffix => &storage.t[..],
+            };
+            let err = ref_from_prefix_suffix::<_, AU64>(source, None, cast_type).unwrap_err();
+            assert!(matches!(err, CastError::Alignment(_)));
+            let recovered: &[bool] = err.into_src();
+            assert!(ptr::eq(recovered, source));
+
+            let err = try_ref_from_prefix_suffix::<_, AU64>(source, cast_type, None).unwrap_err();
+            assert!(matches!(err, TryCastError::Alignment(_)));
+            let recovered: &[bool] = err.into_src();
+            assert!(ptr::eq(recovered, source));
+        }
+    }
+
+    #[test]
+    fn test_try_ref_from_prefix_suffix_typed_source() {
+        #[derive(IntoBytes, Immutable)]
+        #[repr(transparent)]
+        struct Source<T: ?Sized>(T);
+
+        fn check<S: IntoBytes + Immutable + ?Sized>(source: &S) {
+            let bytes = source.as_bytes();
+            assert_eq!(bytes, [0, 1, 0, 1]);
+
+            for cast_type in [CastType::Prefix, CastType::Suffix] {
+                let (expected, expected_rest) = match cast_type {
+                    CastType::Prefix => (&bytes[..3], &bytes[3..]),
+                    CastType::Suffix => (&bytes[1..], &bytes[..1]),
+                };
+                for meta in [None, Some(1)] {
+                    let (value, rest) =
+                        try_ref_from_prefix_suffix::<_, [[bool; 3]]>(source, cast_type, meta)
+                            .unwrap();
+                    assert_eq!(value.as_bytes(), expected);
+                    assert!(ptr::eq(value.as_bytes(), expected));
+                    assert!(ptr::eq(rest, expected_rest));
+                }
+
+                let err = try_ref_from_prefix_suffix::<_, [bool; 5]>(source, cast_type, None)
+                    .unwrap_err();
+                assert!(matches!(err, TryCastError::Size(_)));
+                assert!(ptr::eq(err.into_src(), source));
+
+                let err = try_ref_from_prefix_suffix::<_, [bool]>(source, cast_type, Some(5))
+                    .unwrap_err();
+                assert!(matches!(err, TryCastError::Size(_)));
+                assert!(ptr::eq(err.into_src(), source));
+            }
+        }
+
+        check(&Source([u16::from_ne_bytes([0, 1]); 2]));
+        let source = Source([false, true, false, true]);
+        let source: &Source<[bool]> = &source;
+        check(source);
+    }
+
+    #[test]
+    fn test_try_ref_from_prefix_suffix_typed_source_validity_error() {
+        fn check<S: IntoBytes + Immutable + ?Sized>(source: &S) {
+            for cast_type in [CastType::Prefix, CastType::Suffix] {
+                let err =
+                    try_ref_from_prefix_suffix::<_, bool>(source, cast_type, None).unwrap_err();
+                assert!(matches!(err, TryCastError::Validity(_)));
+                assert!(ptr::eq(err.into_src(), source));
+
+                for meta in [None, Some(1)] {
+                    let err = try_ref_from_prefix_suffix::<_, [bool]>(source, cast_type, meta)
+                        .unwrap_err();
+                    assert!(matches!(err, TryCastError::Validity(_)));
+                    assert!(ptr::eq(err.into_src(), source));
+                }
+            }
+        }
+
+        let source = [u16::from_ne_bytes([2, 2]); 2];
+        check(&source);
+        check(&source[..]);
+        check(source.as_bytes());
+    }
+
     #[test]
     fn test_try_ref_from_prefix_suffix() {
         use crate::util::testutil::Align;
diff --git a/rust/zerocopy/src/macros.rs b/rust/zerocopy/src/macros.rs
index ec67c03a44fc..73f6dd0ca0ae 100644
--- a/rust/zerocopy/src/macros.rs
+++ b/rust/zerocopy/src/macros.rs
@@ -1033,7 +1033,7 @@ unsafe impl $(<$($tyvar),*>)? $crate::TryFromBytes for $name$(<$($tyvar),*>)?
             )?
         {
             #[inline(always)]
-            fn is_bit_valid<A>(_: $crate::Maybe<'_, Self, A>) -> bool
+            fn is_safe<A>(_: $crate::Maybe<'_, Self, A>) -> bool
             where
                 A: $crate::invariant::Alignment,
             {
@@ -1179,7 +1179,7 @@ unsafe impl $crate::TryFromBytes for $name
             )*
         {
             #[inline(always)]
-            fn is_bit_valid<A>(_: $crate::Maybe<'_, Self, A>) -> bool
+            fn is_safe<A>(_: $crate::Maybe<'_, Self, A>) -> bool
             where
                 A: $crate::invariant::Alignment,
             {
@@ -1411,6 +1411,38 @@ const fn transmute_ref<T, U>(t: &T) -> &U
         let x: &SliceDst<U16, u8> = transmute_ref!(slice_dst_big);
         assert_eq!(x, slice_dst_small);
 
+        // A packed outer DST can preserve the trailing field's stronger
+        // rounding alignment. These two types consequently have different
+        // normalized layout formulas even though both have size `2 + 4 * n`
+        // for every trailing slice length. Ensure the semantic size-sequence
+        // comparison accepts this representation-preserving transmutation.
+        #[derive(FromBytes, Immutable, IntoBytes, KnownLayout)]
+        #[repr(C, align(2))]
+        struct TransmuteAlign2([u8; 4]);
+
+        #[derive(FromBytes, Immutable, IntoBytes, KnownLayout)]
+        #[repr(C, packed(2))]
+        struct TransmutePacked4 {
+            head: u16,
+            tail: [u32],
+        }
+
+        #[derive(FromBytes, Immutable, IntoBytes, KnownLayout)]
+        #[repr(C, packed(2))]
+        struct TransmutePacked2 {
+            head: u16,
+            tail: [TransmuteAlign2],
+        }
+
+        #[repr(C, align(2))]
+        struct TransmuteBytes([u8; 10]);
+
+        let bytes = TransmuteBytes([0; 10]);
+        let src = TransmutePacked4::ref_from_bytes(&bytes.0).unwrap();
+        let dst: &TransmutePacked2 = transmute_ref!(src);
+        assert_eq!(mem::size_of_val(src), 10);
+        assert_eq!(mem::size_of_val(dst), 10);
+
         // Test that it's legal to transmute a reference while shrinking the
         // lifetime (note that `X` has the lifetime `'static`).
         let x: &[u8; 8] = transmute_ref!(X);
@@ -1471,6 +1503,19 @@ fn drop(&mut self) {
         // its `PanicOnDrop` temporary, which would cause a panic.
         assert_eq!(y.as_ref().map_err(|p| &p.src.0), Err::<&bool, _>(&2u8));
         mem::forget(y);
+
+        #[derive(Debug, TryFromBytes)]
+        #[repr(C, align(8))]
+        struct PaddedBool(bool);
+
+        // A failed transmutation must return every source byte, including
+        // bytes which would be padding in the destination type.
+        let src = [2u8, 1, 2, 3, 4, 5, 6, 7];
+        let x: Result<PaddedBool, _> = try_transmute!(src);
+        assert_eq!(x.unwrap_err().into_src(), src);
+
+        let x: Result<PaddedBool, _> = try_transmute!([0u8; 8]);
+        assert!(!x.unwrap().0);
     }
 
     #[test]
@@ -1687,9 +1732,9 @@ fn test_macros_evaluate_args_once() {
     #[test]
     fn test_include_value() {
         const AS_U32: u32 = include_value!("../testdata/include_value/data");
-        assert_eq!(AS_U32, u32::from_ne_bytes([b'a', b'b', b'c', b'd']));
+        assert_eq!(AS_U32, u32::from_ne_bytes(*b"abcd"));
         const AS_I32: i32 = include_value!("../testdata/include_value/data");
-        assert_eq!(AS_I32, i32::from_ne_bytes([b'a', b'b', b'c', b'd']));
+        assert_eq!(AS_I32, i32::from_ne_bytes(*b"abcd"));
     }
 
     #[test]
diff --git a/rust/zerocopy/src/pointer/inner.rs b/rust/zerocopy/src/pointer/inner.rs
index 949b60a3f83e..8beb6267b217 100644
--- a/rust/zerocopy/src/pointer/inner.rs
+++ b/rust/zerocopy/src/pointer/inner.rs
@@ -289,10 +289,10 @@ impl<'a, T> PtrInner<'a, T>
     ///
     /// Given `let (left, right) = ptr.split_at(l_len)`, it is guaranteed that
     /// `left` and `right` are contiguous and non-overlapping if
-    /// `l_len.padding_needed_for() == 0`. This is true for all `[T]`.
+    /// the left part has no trailing padding. This is true for all `[T]`.
     ///
-    /// If `l_len.padding_needed_for() != 0`, then the left pointer will overlap
-    /// the right pointer to satisfy `T`'s padding requirements.
+    /// Any trailing padding in the left part begins at the right part's
+    /// starting address and may overlap its referent.
     #[inline]
     #[must_use]
     pub unsafe fn split_at_unchecked(
@@ -313,23 +313,19 @@ pub unsafe fn split_at_unchecked(
         // Trivially, `slf.meta() <= slf.meta()`.
         let right = unsafe { right.slice_unchecked(l_len..self.meta().get()) };
 
-        // SAFETY: If `l_len.padding_needed_for() == 0`, then `left` and `right`
-        // are non-overlapping. Proof: `left` is constructed `slf` with `l_len`
-        // as its (exclusive) upper bound. If `l_len.padding_needed_for() == 0`,
-        // then `left` requires no trailing padding following its final element.
-        // Since `right` is constructed from `slf`'s trailing slice with `l_len`
-        // as its (inclusive) lower bound, no byte is referred to by both
-        // pointers.
+        // SAFETY: If the left part has no trailing padding, then `left` and
+        // `right` are non-overlapping. Proof: `left` has `l_len` trailing
+        // elements, and `right` starts at element `l_len` of the original
+        // trailing slice. Without padding after `left`'s final element, no
+        // byte is referred to by both pointers.
         //
-        // Conversely, `l_len.padding_needed_for() == N`, where `N
-        // > 0`, `left` requires `N` bytes of trailing padding following its
-        // final element. Since `right` is constructed from the trailing slice
-        // of `slf` with `l_len` as its (inclusive) lower bound, the first `N`
-        // bytes of `right` are aliased by `left`.
+        // Any trailing padding in `left` begins at `right`'s starting
+        // address. If `right` is nonzero sized, the referents overlap.
         (left, right)
     }
 
-    /// Produces the trailing slice of `self`.
+    /// Produces the trailing slice of `self` using `T::Elem` as its element
+    /// representation.
     #[inline]
     #[must_use]
     pub fn trailing_slice(self) -> PtrInner<'a, [T::Elem]>
@@ -368,9 +364,10 @@ pub fn trailing_slice(self) -> PtrInner<'a, [T::Elem]>
         // 1. If `ptr`'s referent is not zero sized, then `ptr` has valid
         //    provenance for `A` because `raw` is derived from the same
         //    allocated object as `self` via provenance-preserving operations.
-        // 2. If `ptr`'s referent is not zero sized, then `ptr` addresses a byte
-        //    range which is entirely contained in `A`, by previous safety proof
-        //    on `bytes`.
+        // 2. `T: SplitAt` guarantees that `T::Elem` has the size of the actual
+        //    trailing element. The new slice has the same length and start as
+        //    the original trailing slice, so it covers the same byte range.
+        //    If nonzero sized, that range is entirely contained in `A`.
         // 3. `ptr` addresses a byte range whose length fits in an `isize`, by
         //    consequence of #2.
         // 4. `ptr` addresses a byte range which does not wrap around the
diff --git a/rust/zerocopy/src/pointer/invariant.rs b/rust/zerocopy/src/pointer/invariant.rs
index 7ff0d43dad5e..8dfaf82e134f 100644
--- a/rust/zerocopy/src/pointer/invariant.rs
+++ b/rust/zerocopy/src/pointer/invariant.rs
@@ -47,7 +47,7 @@ pub trait Alignment: Sealed {
     fn read<T, I, R>(ptr: crate::Ptr<'_, T, I>) -> T
     where
         T: Copy + Read<I::Aliasing, R>,
-        I: Invariants<Alignment = Self, Validity = Valid>,
+        I: Invariants<Alignment = Self, Validity = Safe>,
         I::Aliasing: Reference;
 }
 
@@ -64,35 +64,39 @@ fn read<T, I, R>(ptr: crate::Ptr<'_, T, I>) -> T
 /// all `T: ?Sized`. Any `V: Validity` must guarantee that this set is only a
 /// function of the *bit validity* of the referent type, `T`, and not of any
 /// other property of `T`. As a consequence, given `V: Validity`, `T`, and `U`
-/// where `T` and `U` have the same bit validity, `S(V, T) = S(V, U)`.
+/// where `T` and `U` have the same bit validity, `S(T, V) = S(U, V)`.
 ///
 /// It is guaranteed that the referent of any `ptr: Ptr<T, V>` is a member of
 /// `S(T, V)`. Unsafe code must ensure that this guarantee will be upheld for
 /// any existing `Ptr`s or any `Ptr`s that that code creates.
 ///
-/// An important implication of this guarantee is that it restricts what
-/// transmutes are sound, where "transmute" is used in this context to refer to
-/// changing the referent type or validity invariant of a `Ptr`, as either
-/// change may change the set of bit values permitted to appear in the referent.
-/// In particular, the following are necessary (but not sufficient) conditions
-/// in order for a transmute from `src: Ptr<T, V>` to `dst: Ptr<U, W>` to be
-/// sound:
-/// - If `S(T, V) = S(U, W)`, then no restrictions apply; otherwise,
+/// An important implication of this guarantee is that it restricts which exact
+/// reinterpretations are sound. Here, an exact reinterpretation changes the
+/// referent type or validity invariant of a `Ptr` while preserving the exact
+/// byte range. In particular, given `src: Ptr<T, V>` and `dst: Ptr<U, W>` which
+/// refer to the same byte range, the following are necessary (but not
+/// sufficient) conditions:
+/// - If `S(T, V) = S(U, W)`, then no additional validity-preservation
+///   restrictions apply; otherwise,
 /// - If `dst` permits mutation of its referent (e.g. via `Exclusive` aliasing
 ///   or interior mutation under `Shared` aliasing), then it must hold that
-///   `S(T, V) ⊇ S(U, W)` - in other words, the transmute must not expand the
-///   set of allowed referent bit patterns. A violation of this requirement
+///   `S(T, V) ⊇ S(U, W)` - in other words, the reinterpretation must not expand
+///   the set of allowed referent bit patterns. A violation of this requirement
 ///   would permit using `dst` to write `x` where `x ∈ S(U, W)` but `x ∉ S(T,
 ///   V)`, which would violate the guarantee that `src`'s referent may only
 ///   contain values in `S(T, V)`.
 /// - If the referent may be mutated without going through `dst` while `dst` is
 ///   live (e.g. via interior mutation on a `Shared`-aliased `Ptr` or `&`
 ///   reference), then it must hold that `S(T, V) ⊆ S(U, W)` - in other words,
-///   the transmute must not shrink the set of allowed referent bit patterns. A
-///   violation of this requirement would permit using `src` or another
-///   mechanism (e.g. a `&` reference used to derive `src`) to write `x` where
-///   `x ∈ S(T, V)` but `x ∉ S(U, W)`, which would violate the guarantee that
-///   `dst`'s referent may only contain values in `S(U, W)`.
+///   the reinterpretation must not shrink the set of allowed referent bit
+///   patterns. A violation of this requirement would permit using `src` or
+///   another mechanism (e.g. a `&` reference used to derive `src`) to write `x`
+///   where `x ∈ S(T, V)` but `x ∉ S(U, W)`, which would violate the guarantee
+///   that `dst`'s referent may only contain values in `S(U, W)`.
+///
+/// These conditions describe only exact reinterpretations. Shrinking
+/// projections may have validity that depends on the relationship between the
+/// projected region and bytes outside it, and require additional reasoning.
 pub unsafe trait Validity: Sealed {
     const KIND: ValidityKind;
 }
@@ -101,7 +105,7 @@ pub enum ValidityKind {
     Uninit,
     AsInitialized,
     Initialized,
-    Valid,
+    Safe,
 }
 
 /// An [`Aliasing`] invariant which is either [`Shared`] or [`Exclusive`].
@@ -147,7 +151,7 @@ impl Alignment for Unaligned {
     fn read<T, I, R>(ptr: crate::Ptr<'_, T, I>) -> T
     where
         T: Copy + Read<I::Aliasing, R>,
-        I: Invariants<Alignment = Self, Validity = Valid>,
+        I: Invariants<Alignment = Self, Validity = Safe>,
         I::Aliasing: Reference,
     {
         (*ptr.into_unalign().as_ref()).into_inner()
@@ -162,7 +166,7 @@ impl Alignment for Aligned {
     fn read<T, I, R>(ptr: crate::Ptr<'_, T, I>) -> T
     where
         T: Copy + Read<I::Aliasing, R>,
-        I: Invariants<Alignment = Self, Validity = Valid>,
+        I: Invariants<Alignment = Self, Validity = Safe>,
         I::Aliasing: Reference,
     {
         *ptr.as_ref()
@@ -227,13 +231,20 @@ unsafe impl Validity for Initialized {
 
 /// The referent of a `Ptr<T>` is valid for `T`, upholding bit validity and any
 /// library safety invariants.
-pub enum Valid {}
-// SAFETY: `Valid`'s validity is well-defined for all `T: ?Sized`, and is not a
+pub enum Safe {}
+// SAFETY: `Safe`'s validity is well-defined for all `T: ?Sized`, and is not a
 // function of any property of `T` other than its bit validity.
-unsafe impl Validity for Valid {
-    const KIND: ValidityKind = ValidityKind::Valid;
+unsafe impl Validity for Safe {
+    const KIND: ValidityKind = ValidityKind::Safe;
 }
 
+/// Proof helper for casts whose validity requirement does not depend on the
+/// referent type.
+///
+/// Currently this covers `Uninit`, which permits any byte state, and
+/// `Initialized`, which requires every referent byte to be initialized
+/// regardless of referent type.
+///
 /// # Safety
 ///
 /// `DT: CastableFrom<ST, SV, DV>` is sound if `SV = DV = Uninit` or `SV = DV =
@@ -289,7 +300,7 @@ impl Sealed for Aligned {}
     impl Sealed for Uninit {}
     impl Sealed for AsInitialized {}
     impl Sealed for Initialized {}
-    impl Sealed for Valid {}
+    impl Sealed for Safe {}
 
     impl<A: Sealed, AA: Sealed, V: Sealed> Sealed for (A, AA, V) {}
 
diff --git a/rust/zerocopy/src/pointer/mod.rs b/rust/zerocopy/src/pointer/mod.rs
index d6eacc52febe..0ce543391530 100644
--- a/rust/zerocopy/src/pointer/mod.rs
+++ b/rust/zerocopy/src/pointer/mod.rs
@@ -25,9 +25,9 @@
 use crate::wrappers::ReadOnly;
 
 /// A shorthand for a maybe-valid, maybe-aligned reference. Used as the argument
-/// to [`TryFromBytes::is_bit_valid`].
+/// to [`TryFromBytes::is_safe`].
 ///
-/// [`TryFromBytes::is_bit_valid`]: crate::TryFromBytes::is_bit_valid
+/// [`TryFromBytes::is_safe`]: crate::TryFromBytes::is_safe
 pub type Maybe<'a, T, Alignment = invariant::Unaligned> =
     Ptr<'a, ReadOnly<T>, (invariant::Shared, Alignment, invariant::Initialized)>;
 
@@ -47,10 +47,7 @@ pub(crate) fn is_zeroed<T, I>(ptr: Ptr<'_, T, I>) -> bool
 pub mod cast {
     use core::{marker::PhantomData, mem};
 
-    use crate::{
-        layout::{SizeInfo, TrailingSliceLayout},
-        HasField, KnownLayout, PtrInner,
-    };
+    use crate::{layout::SizeInfo, HasField, KnownLayout, PtrInner};
 
     /// A pointer cast or projection.
     ///
@@ -182,11 +179,9 @@ pub enum CastUnsized {}
 
     // SAFETY: By the `static_assert!`, `Src` and `Dst` are either:
     // - Both sized and equal in size
-    // - Both slice DSTs with the same trailing slice offset and element size
-    //   and with align_of::<Src>() == align_of::<Dst>(). These ensure that any
-    //   given pointer metadata encodes the same size for both `Src` and `Dst`
-    //   (note that the alignment is required as it affects the amount of
-    //   trailing padding). Thus, `project` preserves the set of referent bytes.
+    // - Both slice DSTs with the same trailing-slice offset, the same object
+    //   size for every metadata value, and with align_of::<Src>() ==
+    //   align_of::<Dst>(). Thus, `project` preserves the set of referent bytes.
     unsafe impl<Src, Dst> Project<Src, Dst> for CastUnsized
     where
         Src: ?Sized + KnownLayout,
@@ -201,10 +196,11 @@ fn project(src: PtrInner<'_, Src>) -> *mut Dst {
                 let dst = <Dst as KnownLayout>::LAYOUT;
                 match (src.size_info, dst.size_info) {
                     (SizeInfo::Sized { size: src_size }, SizeInfo::Sized { size: dst_size }) => src_size == dst_size,
-                    (
-                        SizeInfo::SliceDst(TrailingSliceLayout { offset: src_offset, elem_size: src_elem_size }),
-                        SizeInfo::SliceDst(TrailingSliceLayout { offset: dst_offset, elem_size: dst_elem_size })
-                    ) => src.align.get() == dst.align.get() && src_offset == dst_offset && src_elem_size == dst_elem_size,
+                    (SizeInfo::SliceDst(src_trailing), SizeInfo::SliceDst(dst_trailing)) => {
+                        src.align.get() == dst.align.get()
+                            && src_trailing.offset == dst_trailing.offset
+                            && src_trailing.has_same_size_sequence(dst_trailing)
+                    },
                     _ => false,
                 }
             });
@@ -225,10 +221,8 @@ unsafe impl<Src, Dst> Cast<Src, Dst> for CastUnsized
     // SAFETY: By the `static_assert!` in `Project::project`, `Src` and `Dst`
     // are either:
     // - Both sized and equal in size
-    // - Both slice DSTs with the same alignment, trailing slice offset, and
-    //   element size. These ensure that any given pointer metadata encodes the
-    //   same size for both `Src` and `Dst` (note that the alignment is required
-    //   as it affects the amount of trailing padding).
+    // - Both slice DSTs with the same alignment and trailing-slice offset, and
+    //   with equal sizes for every metadata value.
     unsafe impl<Src, Dst> CastExact<Src, Dst> for CastUnsized
     where
         Src: ?Sized + KnownLayout,
@@ -240,18 +234,22 @@ unsafe impl<Src, Dst> CastExact<Src, Dst> for CastUnsized
     ///
     /// A `Projection` is a [`Project`] which implements projection by
     /// delegating to an implementation of [`HasField::project`].
+    ///
+    /// The `Client` parameter exists to select between implementations of
+    /// [`HasField`] that would otherwise conflict.
     #[allow(missing_debug_implementations, missing_copy_implementations)]
-    pub struct Projection<F: ?Sized, const VARIANT_ID: i128, const FIELD_ID: i128> {
+    pub struct Projection<Client, F: ?Sized, const VARIANT_ID: i128, const FIELD_ID: i128> {
         _never: core::convert::Infallible,
+        _client: PhantomData<Client>,
         _phantom: PhantomData<F>,
     }
 
     // SAFETY: `HasField::project` has the same safety post-conditions as
     // `Project::project`.
-    unsafe impl<T: ?Sized, F, const VARIANT_ID: i128, const FIELD_ID: i128> Project<T, T::Type>
-        for Projection<F, VARIANT_ID, FIELD_ID>
+    unsafe impl<T: ?Sized, Client, F, const VARIANT_ID: i128, const FIELD_ID: i128>
+        Project<T, T::Type> for Projection<Client, F, VARIANT_ID, FIELD_ID>
     where
-        T: HasField<F, VARIANT_ID, FIELD_ID>,
+        T: HasField<Client, F, VARIANT_ID, FIELD_ID>,
     {
         #[inline(always)]
         fn project(src: PtrInner<'_, T>) -> *mut T::Type {
@@ -292,10 +290,10 @@ fn project(src: PtrInner<'_, T>) -> *mut T::Type {
     //
     // FIXME(https://github.com/rust-lang/unsafe-code-guidelines/issues/595):
     // Cite the documentation once it's updated.
-    unsafe impl<T: ?Sized, F, const FIELD_ID: i128> Cast<T, T::Type>
-        for Projection<F, { crate::REPR_C_UNION_VARIANT_ID }, FIELD_ID>
+    unsafe impl<T: ?Sized, Client, F, const FIELD_ID: i128> Cast<T, T::Type>
+        for Projection<Client, F, { crate::REPR_C_UNION_VARIANT_ID }, FIELD_ID>
     where
-        T: HasField<F, { crate::REPR_C_UNION_VARIANT_ID }, FIELD_ID>,
+        T: HasField<Client, F, { crate::REPR_C_UNION_VARIANT_ID }, FIELD_ID>,
     {
     }
 
diff --git a/rust/zerocopy/src/pointer/ptr.rs b/rust/zerocopy/src/pointer/ptr.rs
index 7213f6f4a04e..0fcd2ed11d37 100644
--- a/rust/zerocopy/src/pointer/ptr.rs
+++ b/rust/zerocopy/src/pointer/ptr.rs
@@ -169,7 +169,7 @@ mod _conversions {
     use crate::pointer::cast::{CastExact, CastSized, IdCast};
 
     /// `&'a T` → `Ptr<'a, T>`
-    impl<'a, T> Ptr<'a, T, (Shared, Aligned, Valid)>
+    impl<'a, T> Ptr<'a, T, (Shared, Aligned, Safe)>
     where
         T: 'a + ?Sized,
     {
@@ -183,20 +183,19 @@ pub fn from_ref(ptr: &'a T) -> Self {
             // 1. `ptr`, by invariant on `&'a T`, conforms to the alignment
             //    invariant of `Aligned`.
             // 2. `ptr`'s referent, by invariant on `&'a T`, is a bit-valid `T`.
-            //    This satisfies the requirement that a `Ptr<T, (_, _, Valid)>`
+            //    This satisfies the requirement that a `Ptr<T, (_, _, Safe)>`
             //    point to a bit-valid `T`. Even if `T` permits interior
-            //    mutation, this invariant guarantees that the returned `Ptr`
-            //    can only ever be used to modify the referent to store
-            //    bit-valid `T`s, which ensures that the returned `Ptr` cannot
-            //    be used to violate the soundness of the original `ptr: &'a T`
-            //    or of any other references that may exist to the same
-            //    referent.
+            //    mutation, this invariant guarantees that the returned `Ptr` can
+            //    only ever be used to modify the referent to store bit-valid
+            //    `T`s, which ensures that the returned `Ptr` cannot be used to
+            //    violate the soundness of the original `ptr: &'a T` or of any
+            //    other references that may exist to the same referent.
             unsafe { Self::from_inner(inner) }
         }
     }
 
     /// `&'a mut T` → `Ptr<'a, T>`
-    impl<'a, T> Ptr<'a, T, (Exclusive, Aligned, Valid)>
+    impl<'a, T> Ptr<'a, T, (Exclusive, Aligned, Safe)>
     where
         T: 'a + ?Sized,
     {
@@ -211,7 +210,7 @@ pub fn from_mut(ptr: &'a mut T) -> Self {
             //    invariant of `Aligned`.
             // 2. `ptr`'s referent, by invariant on `&'a mut T`, is a bit-valid
             //    `T`. This satisfies the requirement that a `Ptr<T, (_, _,
-            //    Valid)>` point to a bit-valid `T`. This invariant guarantees
+            //    Safe)>` point to a bit-valid `T`. This invariant guarantees
             //    that the returned `Ptr` can only ever be used to modify the
             //    referent to store bit-valid `T`s, which ensures that the
             //    returned `Ptr` cannot be used to violate the soundness of the
@@ -224,7 +223,7 @@ pub fn from_mut(ptr: &'a mut T) -> Self {
     impl<'a, T, I> Ptr<'a, T, I>
     where
         T: 'a + ?Sized,
-        I: Invariants<Alignment = Aligned, Validity = Valid>,
+        I: Invariants<Alignment = Aligned, Validity = Safe>,
         I::Aliasing: Reference,
     {
         /// Converts `self` to a shared reference.
@@ -239,7 +238,7 @@ pub fn as_ref(self) -> &'a T {
             let raw = self.as_inner().as_non_null();
             // SAFETY: `self` satisfies the `Aligned` invariant, so we know that
             // `raw` is validly-aligned for `T`.
-            #[cfg(miri)]
+            #[cfg(all(miri, __ZEROCOPY_INTERNAL_USE_ONLY_DEV_MODE))]
             unsafe {
                 crate::util::miri_promise_symbolic_alignment(
                     raw.as_ptr().cast(),
@@ -264,7 +263,7 @@ pub fn as_ref(self) -> &'a T {
             //
             // 3. The pointer must point to a validly-initialized instance of
             //    `T`. This is ensured by-contract on `Ptr`, because the
-            //    `I::Validity` is `Valid`.
+            //    `I::Validity` is `Safe`.
             //
             // 4. You must enforce Rust’s aliasing rules. This is ensured by
             //    contract on `Ptr`, because `I::Aliasing: Reference`. Either it
@@ -377,7 +376,7 @@ pub fn reborrow_shared<'b>(&'b mut self) -> Ptr<'b, T, (Shared, I::Alignment, I:
     }
 
     /// `Ptr<'a, T>` → `&'a mut T`
-    impl<'a, T> Ptr<'a, T, (Exclusive, Aligned, Valid)>
+    impl<'a, T> Ptr<'a, T, (Exclusive, Aligned, Safe)>
     where
         T: 'a + ?Sized,
     {
@@ -389,7 +388,7 @@ pub fn as_mut(self) -> &'a mut T {
             let mut raw = self.as_inner().as_non_null();
             // SAFETY: `self` satisfies the `Aligned` invariant, so we know that
             // `raw` is validly-aligned for `T`.
-            #[cfg(miri)]
+            #[cfg(all(miri, __ZEROCOPY_INTERNAL_USE_ONLY_DEV_MODE))]
             unsafe {
                 crate::util::miri_promise_symbolic_alignment(
                     raw.as_ptr().cast(),
@@ -413,8 +412,8 @@ pub fn as_mut(self) -> &'a mut T {
             //   This is ensured by contract on all `PtrInner`s.
             //
             // 3. The pointer must point to a validly-initialized instance of
-            //    `T`. This is ensured by-contract on `Ptr`, because the
-            //    validity invariant is `Valid`.
+            //    `T`. This is ensured by-contract on `Ptr`, because the validity
+            //    invariant is `Safe`.
             //
             // 4. You must enforce Rust’s aliasing rules. This is ensured by
             //    contract on `Ptr`, because the `ALIASING_INVARIANT` is
@@ -431,6 +430,10 @@ impl<'a, T: ?Sized, I> Ptr<'a, T, I>
     where
         I: Invariants,
     {
+        /// Reinterprets the same byte region as `U` with validity `V`.
+        ///
+        /// This preserves the aliasing invariant, uses [`SizeEq`] to select a
+        /// [`CastExact`] implementation, and conservatively forgets alignment.
         #[must_use]
         #[inline(always)]
         pub fn transmute<U, V, R>(self) -> Ptr<'a, U, (I::Aliasing, Unaligned, V)>
@@ -443,6 +446,12 @@ pub fn transmute<U, V, R>(self) -> Ptr<'a, U, (I::Aliasing, Unaligned, V)>
             self.transmute_with::<U, V, <U as SizeEq<T>>::CastFrom, R>()
         }
 
+        /// Reinterprets the same byte region as `U` with validity `V` using
+        /// `C`.
+        ///
+        /// `C: CastExact` preserves the byte region. The aliasing invariant is
+        /// preserved, while alignment is conservatively forgotten because the
+        /// destination type may have a different alignment requirement.
         #[inline]
         #[must_use]
         pub fn transmute_with<U, V, C, R>(self) -> Ptr<'a, U, (I::Aliasing, Unaligned, V)>
@@ -462,11 +471,15 @@ pub fn transmute_with<U, V, C, R>(self) -> Ptr<'a, U, (I::Aliasing, Unaligned, V
             //     at the same time, as neither can perform interior mutation
             //   - It is directly guaranteed that it is sound for shared code to
             //     operate on these references simultaneously
-            // - By `U: TransmuteFromPtr<T, I::Aliasing, I::Validity, C, V>`, it
+            // - By `U: TransmuteFromPtr<T, I::Aliasing, I::Validity, V, C>`, it
             //   is sound to perform this transmute using `C`.
             unsafe { self.project_transmute_unchecked::<_, _, C>() }
         }
 
+        /// Changes only the validity invariant to `V`.
+        ///
+        /// The referent type and byte region are unchanged, so this preserves
+        /// the existing aliasing and alignment invariants.
         #[inline]
         #[must_use]
         pub fn recall_validity<V, R>(self) -> Ptr<'a, T, (I::Aliasing, I::Alignment, V)>
@@ -562,7 +575,7 @@ pub fn into_unalign(
             // FIXME(#1359): This should be a `transmute_with` call.
             // Unfortunately, to avoid blanket impl conflicts, we only implement
             // `TransmuteFrom<T>` for `Unalign<T>` (and vice versa) specifically
-            // for `Valid` validity, not for all validity types.
+            // for `Safe` validity, not for all validity types.
 
             // SAFETY:
             // - By `CastSized: Cast`, `CastSized` preserves referent address,
@@ -589,7 +602,7 @@ pub fn into_unalign(
     impl<'a, T, I> Ptr<'a, T, I>
     where
         T: ?Sized,
-        I: Invariants<Validity = Valid>,
+        I: Invariants<Validity = Safe>,
         I::Aliasing: Reference,
     {
         /// Reads the referent.
@@ -656,6 +669,22 @@ pub fn unify_invariants<
             unsafe { self.assume_invariants::<H>() }
         }
 
+        /// Downgrades `self` to shared aliasing.
+        #[inline]
+        #[must_use]
+        pub(super) fn into_shared(self) -> Ptr<'a, T, (Shared, I::Alignment, I::Validity)>
+        where
+            I::Aliasing: Reference,
+        {
+            // SAFETY: `I::Aliasing: Reference` guarantees that the source
+            // aliasing is either `Shared` or `Exclusive`. `Shared` requires no
+            // transition. If it is `Exclusive`, consuming `self` ends the only
+            // permitted access to the referent, so the returned pointer can
+            // soundly carry `Shared` aliasing. The referent type, alignment,
+            // and validity invariants are unchanged.
+            unsafe { self.assume_invariants() }
+        }
+
         /// Assumes that `self`'s referent is validly-aligned for `T` if
         /// required by `A`.
         ///
@@ -738,40 +767,40 @@ pub unsafe fn assume_initialized(
             unsafe { self.assume_validity::<Initialized>() }
         }
 
-        /// A shorthand for `self.assume_validity<Valid>()`.
+        /// A shorthand for `self.assume_validity<Safe>()`.
         ///
         /// # Safety
         ///
         /// The caller promises to uphold the safety preconditions of
-        /// `self.assume_validity<Valid>()`.
+        /// `self.assume_validity<Safe>()`.
         #[must_use]
         #[inline]
-        pub unsafe fn assume_valid(self) -> Ptr<'a, T, (I::Aliasing, I::Alignment, Valid)> {
+        pub unsafe fn assume_safe(self) -> Ptr<'a, T, (I::Aliasing, I::Alignment, Safe)> {
             // SAFETY: The caller has promised to uphold the safety
             // preconditions.
-            unsafe { self.assume_validity::<Valid>() }
+            unsafe { self.assume_validity::<Safe>() }
         }
 
         /// Checks that `self`'s referent is validly initialized for `T`,
-        /// returning a `Ptr` with `Valid` on success.
+        /// returning a `Ptr` with `Safe` on success.
         ///
         /// # Panics
         ///
         /// This method will panic if
-        /// [`T::is_bit_valid`][TryFromBytes::is_bit_valid] panics.
+        /// [`T::is_safe`][TryFromBytes::is_safe] panics.
         ///
         /// # Safety
         ///
         /// On error, unsafe code may rely on this method's returned
         /// `ValidityError` containing `self`.
         #[inline]
-        pub fn try_into_valid<R, S>(
+        pub fn try_into_safe<R, S>(
             mut self,
-        ) -> Result<Ptr<'a, T, (I::Aliasing, I::Alignment, Valid)>, ValidityError<Self, T>>
+        ) -> Result<Ptr<'a, T, (I::Aliasing, I::Alignment, Safe)>, ValidityError<Self, T>>
         where
             T: TryFromBytes
                 + Read<I::Aliasing, R>
-                + TryTransmuteFromPtr<T, I::Aliasing, I::Validity, Valid, IdCast, S>,
+                + TryTransmuteFromPtr<T, I::Aliasing, I::Validity, Safe, IdCast, S>,
             ReadOnly<T>: Read<I::Aliasing, R>,
             I::Aliasing: Reference,
             I: Invariants<Validity = Initialized>,
@@ -779,14 +808,13 @@ pub fn try_into_valid<R, S>(
             // This call may panic. If that happens, it doesn't cause any
             // soundness issues, as we have not generated any invalid state
             // which we need to fix before returning.
-            if T::is_bit_valid(self.reborrow().transmute::<_, _, _>().reborrow_shared()) {
-                // SAFETY: If `T::is_bit_valid`, code may assume that `self`
-                // contains a bit-valid instance of `T`. By `T:
-                // TryTransmuteFromPtr<T, I::Aliasing, I::Validity, Valid>`, so
-                // long as `self`'s referent conforms to the `Valid` validity
-                // for `T` (which we just confirmed), then this transmute is
-                // sound.
-                Ok(unsafe { self.assume_valid() })
+            if T::is_safe(self.reborrow().transmute::<_, _, _>().reborrow_shared()) {
+                // SAFETY: If `T::is_safe` returns true, code may assume that
+                // `self` contains a valid `T`, so its referent conforms to
+                // `Safe` for `T`. By `T: TryTransmuteFromPtr<T, I::Aliasing,
+                // I::Validity, Safe>`, given that condition, changing `self`'s
+                // validity to `Safe` is sound.
+                Ok(unsafe { self.assume_safe() })
             } else {
                 Err(ValidityError::new(self))
             }
@@ -803,7 +831,7 @@ pub fn forget_aligned(self) -> Ptr<'a, T, (I::Aliasing, Unaligned, I::Validity)>
 }
 
 /// Casts of the referent type.
-#[cfg_attr(not(zerocopy_unstable_ptr), allow(unreachable_pub))]
+#[allow(unreachable_pub)] // False positive on MSRV
 pub use _casts::TryWithError;
 mod _casts {
     use core::cell::UnsafeCell;
@@ -875,19 +903,22 @@ pub fn cast<U, C, R>(self) -> Ptr<'a, U, (I::Aliasing, Unaligned, I::Validity)>
         }
 
         #[inline(always)]
-        pub fn project<F, const VARIANT_ID: i128, const FIELD_ID: i128>(
+        pub fn project<Client, F, const VARIANT_ID: i128, const FIELD_ID: i128>(
             mut self,
         ) -> Result<Ptr<'a, T::Type, T::Invariants>, T::Error>
         where
-            T: ProjectField<F, I, VARIANT_ID, FIELD_ID>,
+            T: ProjectField<Client, F, I, VARIANT_ID, FIELD_ID>,
             I::Aliasing: Reference,
         {
             use crate::pointer::cast::Projection;
-            match T::is_projectable(self.reborrow().project_tag()) {
+            match <T as ProjectField<Client, F, I, VARIANT_ID, FIELD_ID>>::is_projectable(
+                self.reborrow().project_tag::<Client>(),
+            ) {
                 Ok(()) => {
                     let inner = self.as_inner();
-                    let projected = inner.project::<_, Projection<F, VARIANT_ID, FIELD_ID>>();
-                    // SAFETY: By `T: ProjectField<F, I, VARIANT_ID, FIELD_ID>`,
+                    let projected =
+                        inner.project::<_, Projection<Client, F, VARIANT_ID, FIELD_ID>>();
+                    // SAFETY: By `T: ProjectField<Client, F, I, VARIANT_ID, FIELD_ID>`,
                     // for `self: Ptr<'_, T, I>` such that `T::is_projectable`
                     // (which we've verified in this match arm),
                     // `T::project(self.as_inner())` conforms to
@@ -908,17 +939,22 @@ pub fn project<F, const VARIANT_ID: i128, const FIELD_ID: i128>(
 
         #[must_use]
         #[inline(always)]
-        pub(crate) fn project_tag(self) -> Ptr<'a, T::Tag, I>
+        pub fn project_tag<Client>(
+            self,
+        ) -> Ptr<'a, <T as HasTag<Client>>::Tag, (Shared, I::Alignment, I::Validity)>
         where
-            T: HasTag,
+            T: HasTag<Client>,
+            I::Aliasing: Reference,
         {
-            // SAFETY: By invariant on `Self::ProjectToTag`, this is a sound
-            // projection.
-            let tag = unsafe { self.project_transmute_unchecked::<_, _, T::ProjectToTag>() };
-            // SAFETY: By invariant on `Self::ProjectToTag`, the projected
-            // pointer has the same alignment as `ptr`.
-            let tag = unsafe { tag.assume_alignment() };
-            tag.unify_invariants()
+            let ptr = self.into_shared();
+            // SAFETY: By invariant on `ProjectToTag`, it is sound to project
+            // `ptr` to a shared tag pointer with the same validity invariant.
+            let ptr = unsafe {
+                ptr.project_transmute_unchecked::<_, _, <T as HasTag<Client>>::ProjectToTag>()
+            };
+            // SAFETY: By invariant on `ProjectToTag`, the projected pointer has
+            // the same alignment as `self`.
+            unsafe { ptr.assume_alignment() }
         }
 
         /// Attempts to transform the pointer, restoring the original on
@@ -1015,11 +1051,11 @@ impl<'a, T, I> Ptr<'a, T, I>
         #[allow(clippy::wrong_self_convention)]
         #[must_use]
         #[inline]
-        pub fn as_bytes<R>(self) -> Ptr<'a, [u8], (I::Aliasing, Aligned, Valid)>
+        pub fn as_bytes<R>(self) -> Ptr<'a, [u8], (I::Aliasing, Aligned, Safe)>
         where
-            [u8]: TransmuteFromPtr<T, I::Aliasing, I::Validity, Valid, AsBytesCast, R>,
+            [u8]: TransmuteFromPtr<T, I::Aliasing, I::Validity, Safe, AsBytesCast, R>,
         {
-            self.transmute_with::<[u8], Valid, AsBytesCast, _>().bikeshed_recall_aligned()
+            self.transmute_with::<[u8], Safe, AsBytesCast, _>().bikeshed_recall_aligned()
         }
     }
 
@@ -1071,7 +1107,7 @@ pub fn as_slice(self) -> Ptr<'a, [T], I> {
     /// alignment of `[u8]` is 1.
     impl<'a, I> Ptr<'a, [u8], I>
     where
-        I: Invariants<Validity = Valid>,
+        I: Invariants<Validity = Safe>,
     {
         /// Attempts to cast `self` to a `U` using the given cast type.
         ///
@@ -1135,7 +1171,7 @@ pub fn try_cast_into<U, R>(
             //    it is derived from `try_cast_into`, which promises that the
             //    object described by `target` is validly aligned for `U`.
             // 2. By trait bound, `self` - and thus `target` - is a bit-valid
-            //    `[u8]`. `Ptr<[u8], (_, _, Valid)>` and `Ptr<_, (_, _,
+            //    `[u8]`. `Ptr<[u8], (_, _, Safe)>` and `Ptr<_, (_, _,
             //    Initialized)>` have the same bit validity, and so neither
             //    `self` nor `res` can be used to write a value to the referent
             //    which violates the other's validity invariant.
@@ -1143,14 +1179,14 @@ pub fn try_cast_into<U, R>(
 
             // SAFETY:
             // 0. `self` and `remainder` both have the type `[u8]`. Thus, they
-            //    have `UnsafeCell`s at the same locations. Type casting does
-            //    not affect aliasing.
+            //    have `UnsafeCell`s at the same locations. Type casting does not
+            //    affect aliasing.
             // 1. `[u8]` has no alignment requirement.
-            // 2. `self` has validity `Valid` and has type `[u8]`. Since
+            // 2. `self` has validity `Safe` and has type `[u8]`. Since
             //    `remainder` references a subset of `self`'s referent, it is
             //    also a bit-valid `[u8]`. Thus, neither `self` nor `remainder`
-            //    can be used to write a value to the referent which violates
-            //    the other's validity invariant.
+            //    can be used to write a value to the referent which violates the
+            //    other's validity invariant.
             let remainder = unsafe { Ptr::from_inner(remainder) };
 
             Ok((res, remainder))
@@ -1333,6 +1369,23 @@ mod tests {
     use crate::util::AsAddress;
     use crate::{pointer::BecauseImmutable, util::testutil::AU64, FromBytes, Immutable};
 
+    #[test]
+    fn test_project_tag_downgrades_aliasing() {
+        #[allow(dead_code)]
+        #[derive(zerocopy_derive::Project)]
+        #[repr(u8)]
+        enum Enum {
+            Variant(u8),
+        }
+
+        let mut value = Enum::Variant(0);
+        let _: Ptr<
+            '_,
+            <Enum as crate::HasTag<crate::project_clients::ProjectDerive>>::Tag,
+            (Shared, Aligned, Safe),
+        > = Ptr::from_mut(&mut value).project_tag::<crate::project_clients::ProjectDerive>();
+    }
+
     mod test_ptr_try_cast_into_soundness {
         use super::*;
 
diff --git a/rust/zerocopy/src/pointer/transmute.rs b/rust/zerocopy/src/pointer/transmute.rs
index ef9836698203..75f9312f622e 100644
--- a/rust/zerocopy/src/pointer/transmute.rs
+++ b/rust/zerocopy/src/pointer/transmute.rs
@@ -24,14 +24,14 @@
     FromBytes, Immutable, IntoBytes, Unalign,
 };
 
-/// Transmutations which are sound to attempt, conditional on validating the bit
-/// validity of the destination type.
+/// Exact pointer reinterpretations which are sound to attempt, conditional on
+/// establishing the destination validity invariant.
 ///
 /// If a `Ptr` transmutation is `TryTransmuteFromPtr`, then it is sound to
 /// perform that transmutation so long as some additional mechanism is used to
-/// validate that the referent is bit-valid for the destination type. That
-/// validation mechanism could be a type bound (such as `TransmuteFrom`) or a
-/// runtime validity check.
+/// establish that the referent is `DV`-valid for the destination type. That
+/// mechanism could be a type bound (such as `TransmuteFrom`) or a runtime
+/// validity check.
 ///
 /// # Safety
 ///
@@ -49,14 +49,14 @@
 /// Given `src: Ptr<Src, (A, _, SV)>` and `dst: Ptr<Dst, (A, Unaligned, DV)>`,
 /// `Dst: TryTransmuteFromPtr<Src, A, SV, DV, C, _>` is sound if all of the
 /// following hold:
-/// - Forwards transmutation: Either of the following hold:
+/// - Preserve destination validity: Either of the following hold:
 ///   - So long as `dst` is active, no mutation of `dst`'s referent is allowed
 ///     except via `dst` itself
 ///   - The set of `DV`-valid referents of `dst` is a superset of the set of
 ///     `SV`-valid referents of `src` (NOTE: this condition effectively bans
 ///     shrinking or overwriting transmutes, which cannot satisfy this
 ///     condition)
-/// - Reverse transmutation: Either of the following hold:
+/// - Preserve source validity: Either of the following hold:
 ///   - `dst` does not permit mutation of its referent
 ///   - The set of `DV`-valid referents of `dst` is a subset of the set of
 ///     `SV`-valid referents of `src` (NOTE: this condition effectively bans
@@ -126,7 +126,7 @@ pub unsafe trait TryTransmuteFromPtr<
 pub enum BecauseMutationCompatible {}
 
 // SAFETY:
-// - Forwards transmutation: By `Dst: MutationCompatible<Src, A, SV, DV, _>`, we
+// - Preserve destination validity: By `Dst: MutationCompatible<Src, A, SV, DV, _>`, we
 //   know that at least one of the following holds:
 //   - So long as `dst: Ptr<Dst>` is active, no mutation of its referent is
 //     allowed except via `dst` itself if either of the following hold:
@@ -138,17 +138,18 @@ pub enum BecauseMutationCompatible {}
 //     referent as `src`. By `Dst: TransmuteFrom<Src, SV, DV>`, the set of
 //     `DV`-valid referents of `dst` is a superset of the set of `SV`-valid
 //     referents of `src`.
-// - Reverse transmutation: Since the underlying cast is size-preserving, `dst`
-//   addresses the same referent as `src`. By `Src: TransmuteFrom<Dst, DV, SV>`,
-//   the set of `DV`-valid referents of `src` is a subset of the set of
-//   `SV`-valid referents of `dst`.
+// - Preserve source validity: Since the underlying cast is size-preserving,
+//   `dst` addresses the same referent as `src`. By
+//   `Src: TransmuteFrom<Dst, DV, SV>`, the set of `DV`-valid referents of `dst`
+//   is a subset of the set of `SV`-valid referents of `src`.
 // - No safe code, given access to `src` and `dst`, can cause undefined
 //   behavior: By `Dst: MutationCompatible<Src, A, SV, DV, _>`, at least one of
 //   the following holds:
 //   - `A` is `Exclusive`
 //   - `Src: Immutable` and `Dst: Immutable`
-//   - `Dst: InvariantsEq<Src>`, which guarantees that `Src` and `Dst` have the
-//     same invariants, and permit interior mutation on the same byte ranges
+//   - `Dst: SharedCompatible<Src>`, which guarantees that it is sound for safe
+//     code to operate on `&Src` and `&Dst` pointing to the same byte range at
+//     the same time
 unsafe impl<Src, Dst, SV, DV, A, C, R>
     TryTransmuteFromPtr<Src, A, SV, DV, C, (BecauseMutationCompatible, R)> for Dst
 where
@@ -162,9 +163,9 @@ unsafe impl<Src, Dst, SV, DV, A, C, R>
 }
 
 // SAFETY:
-// - Forwards transmutation: Since aliasing is `Shared` and `Src: Immutable`,
+// - Preserve destination validity: Since aliasing is `Shared` and `Src: Immutable`,
 //   `src` does not permit mutation of its referent.
-// - Reverse transmutation: Since aliasing is `Shared` and `Dst: Immutable`,
+// - Preserve source validity: Since aliasing is `Shared` and `Dst: Immutable`,
 //   `dst` does not permit mutation of its referent.
 // - No safe code, given access to `src` and `dst`, can cause undefined
 //   behavior: `Src: Immutable` and `Dst: Immutable`
@@ -187,9 +188,9 @@ unsafe impl<Src, Dst, SV, DV, C> TryTransmuteFromPtr<Src, Shared, SV, DV, C, Bec
 ///
 /// At least one of the following must hold:
 /// - `Src: Read<A, _>` and `Self: Read<A, _>`
-/// - `Self: InvariantsEq<Src>`, and, for some `V`:
-///   - `Dst: TransmuteFrom<Src, V, V>`
-///   - `Src: TransmuteFrom<Dst, V, V>`
+/// - `Self: SharedCompatible<Src>`, and, for some `V`:
+///   - `Self: TransmuteFrom<Src, V, V>`
+///   - `Src: TransmuteFrom<Self, V, V>`
 pub unsafe trait MutationCompatible<Src: ?Sized, A: Aliasing, SV, DV, R> {}
 
 #[allow(missing_copy_implementations, missing_debug_implementations)]
@@ -204,38 +205,39 @@ unsafe impl<Src: ?Sized, Dst: ?Sized, A: Aliasing, SV: Validity, DV: Validity, R
 {
 }
 
-/// Denotes that two types have the same invariants.
+/// Denotes that shared references to two types may safely coexist on the same
+/// referent.
 ///
 /// # Safety
 ///
 /// It is sound for safe code to operate on a `&T` and a `&Self` pointing to the
 /// same referent at the same time - no such safe code can cause undefined
 /// behavior.
-pub unsafe trait InvariantsEq<T: ?Sized> {}
+pub unsafe trait SharedCompatible<T: ?Sized> {}
 
 // SAFETY: Trivially sound to have multiple `&T` pointing to the same referent.
-unsafe impl<T: ?Sized> InvariantsEq<T> for T {}
+unsafe impl<T: ?Sized> SharedCompatible<T> for T {}
 
-// SAFETY: `Dst: InvariantsEq<Src> + TransmuteFrom<Src, SV, DV>`, and `Src:
+// SAFETY: `Dst: SharedCompatible<Src> + TransmuteFrom<Src, SV, DV>`, and `Src:
 // TransmuteFrom<Dst, DV, SV>`.
 unsafe impl<Src: ?Sized, Dst: ?Sized, A: Aliasing, SV: Validity, DV: Validity>
-    MutationCompatible<Src, A, SV, DV, BecauseInvariantsEq> for Dst
+    MutationCompatible<Src, A, SV, DV, BecauseSharedCompatible> for Dst
 where
     Src: TransmuteFrom<Dst, DV, SV>,
-    Dst: TransmuteFrom<Src, SV, DV> + InvariantsEq<Src>,
+    Dst: TransmuteFrom<Src, SV, DV> + SharedCompatible<Src>,
 {
 }
 
 #[allow(missing_debug_implementations, missing_copy_implementations)]
-pub enum BecauseInvariantsEq {}
+pub enum BecauseSharedCompatible {}
 
-macro_rules! unsafe_impl_invariants_eq {
+macro_rules! unsafe_impl_shared_compatible {
     ($tyvar:ident => $t:ty, $u:ty) => {{
         crate::util::macros::__unsafe();
         // SAFETY: The caller promises that this is sound.
-        unsafe impl<$tyvar> InvariantsEq<$t> for $u {}
+        unsafe impl<$tyvar> SharedCompatible<$t> for $u {}
         // SAFETY: The caller promises that this is sound.
-        unsafe impl<$tyvar> InvariantsEq<$u> for $t {}
+        unsafe impl<$tyvar> SharedCompatible<$u> for $t {}
     }};
 }
 
@@ -253,11 +255,11 @@ unsafe impl<$tyvar> InvariantsEq<$u> for $t {}
 //   validity as `T`
 //
 // [2] https://doc.rust-lang.org/1.81.0/std/mem/struct.ManuallyDrop.html#impl-Deref-for-ManuallyDrop%3CT%3E
-unsafe impl<T: ?Sized> InvariantsEq<T> for ManuallyDrop<T> {}
+unsafe impl<T: ?Sized> SharedCompatible<T> for ManuallyDrop<T> {}
 // SAFETY: See previous safety comment.
-unsafe impl<T: ?Sized> InvariantsEq<ManuallyDrop<T>> for T {}
+unsafe impl<T: ?Sized> SharedCompatible<ManuallyDrop<T>> for T {}
 
-/// Transmutations which are always sound.
+/// Exact pointer reinterpretations which are always sound.
 ///
 /// `TransmuteFromPtr` is a shorthand for [`TryTransmuteFromPtr`] and
 /// [`TransmuteFrom`].
@@ -293,8 +295,12 @@ unsafe impl<
 {
 }
 
-/// Denotes that any `SV`-valid `Src` may soundly be transmuted into a
-/// `DV`-valid `Self`.
+/// Denotes that, for equally-sized referents, every bit pattern allowed for an
+/// `SV`-valid `Src` is also allowed for a `DV`-valid `Self`.
+///
+/// `TransmuteFrom` does not by itself authorize a pointer transmutation. It
+/// provides a directional validity implication used by the pointer-transmutation
+/// machinery.
 ///
 /// # Safety
 ///
@@ -333,7 +339,7 @@ impl<T: ?Sized> SizeEq<T> for T {
 // SAFETY: Since `Src: IntoBytes`, the set of valid `Src`'s is the set of
 // initialized bit patterns, which is exactly the set allowed in the referent of
 // any `Initialized` `Ptr`.
-unsafe impl<Src, Dst> TransmuteFrom<Src, Valid, Initialized> for Dst
+unsafe impl<Src, Dst> TransmuteFrom<Src, Safe, Initialized> for Dst
 where
     Src: IntoBytes + ?Sized,
     Dst: ?Sized,
@@ -341,18 +347,19 @@ unsafe impl<Src, Dst> TransmuteFrom<Src, Valid, Initialized> for Dst
 }
 
 // SAFETY: Since `Dst: FromBytes`, any initialized bit pattern may appear in the
-// referent of a `Ptr<Dst, (_, _, Valid)>`. This is exactly equal to the set of
+// referent of a `Ptr<Dst, (_, _, Safe)>`. This is exactly equal to the set of
 // bit patterns which may appear in the referent of any `Initialized` `Ptr`.
-unsafe impl<Src, Dst> TransmuteFrom<Src, Initialized, Valid> for Dst
+unsafe impl<Src, Dst> TransmuteFrom<Src, Initialized, Safe> for Dst
 where
     Src: ?Sized,
     Dst: FromBytes + ?Sized,
 {
 }
 
-// FIXME(#2354): This seems like a smell - the soundness of this bound has
-// nothing to do with `Src` or `Dst` - we're basically just saying `[u8; N]` is
-// transmutable into `[u8; N]`.
+// FIXME(#2354): This relation does not depend on `Src` or `Dst`. That is
+// expected semantically: `Initialized` permits the same states regardless of
+// referent type. The awkward part is encoding that validity-state relation as a
+// trait relation between referent types.
 
 // SAFETY: The set of allowed bit patterns in the referent of any `Initialized`
 // `Ptr` is the same regardless of referent type.
@@ -363,9 +370,10 @@ unsafe impl<Src, Dst> TransmuteFrom<Src, Initialized, Initialized> for Dst
 {
 }
 
-// FIXME(#2354): This seems like a smell - the soundness of this bound has
-// nothing to do with `Dst` - we're basically just saying that any type is
-// transmutable into `MaybeUninit<[u8; N]>`.
+// FIXME(#2354): This relation does not depend on `Src` or `Dst`. That is
+// expected semantically: every validity state implies `Uninit`, which permits
+// any byte sequence. The awkward part is encoding that validity-state relation
+// as a trait relation between referent types.
 
 // SAFETY: A `Dst` with validity `Uninit` permits any byte sequence, and
 // therefore can be transmuted from any value.
@@ -400,7 +408,7 @@ unsafe impl<Src, Dst, V> TransmuteFrom<Src, V, Uninit> for Dst
 // sound for these two references to exist at the same time since it's already
 // possible for safe code to get into this state.
 #[allow(clippy::multiple_unsafe_ops_per_block)]
-const _: () = unsafe { unsafe_impl_invariants_eq!(T => T, Unalign<T>) };
+const _: () = unsafe { unsafe_impl_shared_compatible!(T => T, Unalign<T>) };
 
 // SAFETY:
 // - `Wrapping<T>` has the same size as `T` [1].
@@ -433,7 +441,7 @@ unsafe impl<Src, Dst, V> TransmuteFrom<Src, V, Uninit> for Dst
 // already possible for safe code to obtain a `&Wrapping<T>` and a `&T` pointing
 // to the same referent at the same time. Thus, this must be sound.
 #[allow(clippy::multiple_unsafe_ops_per_block)]
-const _: () = unsafe { unsafe_impl_invariants_eq!(T => T, Wrapping<T>) };
+const _: () = unsafe { unsafe_impl_shared_compatible!(T => T, Wrapping<T>) };
 
 // SAFETY:
 // - `UnsafeCell<T>` has the same size as `T` [1].
@@ -478,7 +486,7 @@ unsafe impl<Src, Dst, V> TransmuteFrom<Src, V, Uninit> for Dst
 // explicitly guaranteed, but it's obvious from `MaybeUninit`'s documentation
 // that this is the intention:
 // https://doc.rust-lang.org/1.85.0/core/mem/union.MaybeUninit.html
-unsafe impl<T> TransmuteFrom<T, Uninit, Valid> for MaybeUninit<T> {}
+unsafe impl<T> TransmuteFrom<T, Uninit, Safe> for MaybeUninit<T> {}
 
 impl<T> SizeEq<T> for MaybeUninit<T> {
     type CastFrom = CastSizedExact;
diff --git a/rust/zerocopy/src/ref.rs b/rust/zerocopy/src/ref.rs
index e49f2a887ffa..7a8876a0587b 100644
--- a/rust/zerocopy/src/ref.rs
+++ b/rust/zerocopy/src/ref.rs
@@ -10,7 +10,7 @@
 // those terms.
 use super::*;
 use crate::pointer::{
-    BecauseInvariantsEq, BecauseMutationCompatible, MutationCompatible, TransmuteFromPtr,
+    BecauseMutationCompatible, BecauseSharedCompatible, MutationCompatible, TransmuteFromPtr,
 };
 
 mod def {
@@ -18,7 +18,7 @@ mod def {
 
     use crate::{
         ByteSlice, ByteSliceMut, CloneableByteSlice, CopyableByteSlice, IntoByteSlice,
-        IntoByteSliceMut,
+        IntoByteSliceMut, KnownLayout, PointerMetadata,
     };
 
     /// A typed reference derived from a byte slice.
@@ -59,30 +59,83 @@ mod def {
     ///     }
     /// }
     /// ```
-    pub struct Ref<B, T: ?Sized>(
-        // INVARIANTS: The referent (via `.deref`, `.deref_mut`, `.into`) byte
-        // slice is aligned to `T`'s alignment and its size corresponds to a
-        // valid size for `T`.
-        B,
-        PhantomData<T>,
-    );
-
-    impl<B, T: ?Sized> Ref<B, T> {
+    pub struct Ref<B, T: ?Sized> {
+        // INVARIANTS:
+        // - The referent (via `.deref`, `.deref_mut`, `.into`) byte slice is
+        //   aligned to `T`'s alignment, and its size is valid for `T`.
+        // - If `T: KnownLayout`, let `metadata` be
+        //   `T::PointerMetadata::from_elem_count` applied to `elem_count`.
+        //   Then `T::size_for_metadata(metadata)` is `Some(referent.len())`.
+        bytes: B,
+        // Ignored when `T` does not implement `KnownLayout`.
+        elem_count: usize,
+        _marker: PhantomData<T>,
+    }
+
+    impl<B, T> Ref<B, T> {
+        /// Constructs a new `Ref` to a sized `T`.
+        ///
+        /// # Safety
+        ///
+        /// `bytes` dereferences (via [`deref`], [`deref_mut`], and [`into`]) to
+        /// a byte slice which is aligned to `T`'s alignment and whose size is
+        /// `size_of::<T>()`.
+        ///
+        /// [`deref`]: core::ops::Deref::deref
+        /// [`deref_mut`]: core::ops::DerefMut::deref_mut
+        /// [`into`]: core::convert::Into::into
+        pub(super) unsafe fn new_sized_unchecked(bytes: B) -> Ref<B, T> {
+            // INVARIANTS: The caller has promised that `bytes`'s referent is
+            // validly aligned and has size `size_of::<T>()`. If `T:
+            // KnownLayout`, then, since `T` is sized, `T::PointerMetadata` is
+            // `()`. `from_elem_count` returns `()` for any element count, and
+            // `T::size_for_metadata(()) == Some(size_of::<T>())`. `size_of`
+            // reports this size in bytes [1].
+            //
+            // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of.html:
+            //
+            //     Returns the size of a type in bytes.
+            Ref { bytes, elem_count: 0, _marker: PhantomData }
+        }
+    }
+
+    impl<B, T: KnownLayout + ?Sized> Ref<B, T> {
         /// Constructs a new `Ref`.
         ///
         /// # Safety
         ///
         /// `bytes` dereferences (via [`deref`], [`deref_mut`], and [`into`]) to
-        /// a byte slice which is aligned to `T`'s alignment and whose size is a
-        /// valid size for `T`.
+        /// a byte slice which is aligned to `T`'s alignment and satisfies
+        /// `T::size_for_metadata(metadata) == Some(referent.len())`.
         ///
         /// [`deref`]: core::ops::Deref::deref
         /// [`deref_mut`]: core::ops::DerefMut::deref_mut
         /// [`into`]: core::convert::Into::into
-        pub(crate) unsafe fn new_unchecked(bytes: B) -> Ref<B, T> {
+        pub(super) unsafe fn new_unchecked(bytes: B, metadata: T::PointerMetadata) -> Ref<B, T> {
             // INVARIANTS: The caller has promised that `bytes`'s referent is
-            // validly-aligned and has a valid size.
-            Ref(bytes, PhantomData)
+            // validly aligned and has exactly the size described by `metadata`.
+            // `KnownLayout::PointerMetadata` is `()` for sized types and
+            // `usize` for slice DSTs. For both permitted metadata types,
+            // `from_elem_count(metadata.to_elem_count()) == metadata`: `()`
+            // round-trips through zero, while `usize` round-trips through
+            // itself. Thus, storing the element count preserves the metadata
+            // whose size the caller validated. This agrees with Rust's
+            // language-level definition of slice pointer metadata [1].
+            //
+            // [1] Per https://doc.rust-lang.org/1.56.0/reference/dynamically-sized-types.html:
+            //
+            //     Pointers to slices also store the number of elements of the
+            //     slice.
+            Ref { bytes, elem_count: metadata.to_elem_count(), _marker: PhantomData }
+        }
+
+        /// Gets the pointer metadata represented by this `Ref`.
+        #[inline(always)]
+        pub(super) fn pointer_metadata(&self) -> T::PointerMetadata {
+            // INVARIANTS: `KnownLayout::PointerMetadata` is either `()` or
+            // `usize`. For `()`, `from_elem_count` ignores the element count;
+            // for `usize`, it returns the element count unchanged.
+            T::PointerMetadata::from_elem_count(self.elem_count)
         }
     }
 
@@ -96,16 +149,18 @@ impl<B: ByteSlice, T: ?Sized> Ref<B, T> {
         /// `Any::downcast_ref`).
         ///
         /// `as_byte_slice` promises to return a `ByteSlice` whose referent is
-        /// validly-aligned for `T` and has a valid size for `T`.
+        /// validly aligned for `T` and has a valid size for `T`. If `T:
+        /// KnownLayout`, then `T::size_for_metadata(self.pointer_metadata())`
+        /// returns `Some(referent.len())`.
         pub(crate) unsafe fn as_byte_slice(&self) -> &impl ByteSlice {
             // INVARIANTS: The caller promises not to call methods other than
             // those on `ByteSlice`. Since `B: ByteSlice`, dereference stability
             // guarantees that calling `ByteSlice` methods will not change the
-            // address or length of `self.0`'s referent.
+            // address or length of `self.bytes`'s referent.
             //
-            // SAFETY: By invariant on `self.0`, the alignment and size
-            // post-conditions are upheld.
-            &self.0
+            // SAFETY: By invariant on `self`, the alignment, size, and metadata
+            // postconditions are upheld.
+            &self.bytes
         }
     }
 
@@ -118,17 +173,20 @@ impl<B: ByteSliceMut, T: ?Sized> Ref<B, T> {
         /// [`ByteSliceMut`] other than `ByteSliceMut` methods (for example, via
         /// `Any::downcast_mut`).
         ///
-        /// `as_byte_slice` promises to return a `ByteSlice` whose referent is
-        /// validly-aligned for `T` and has a valid size for `T`.
+        /// `as_byte_slice_mut` promises to return a `ByteSliceMut` whose
+        /// referent is validly aligned for `T` and has a valid size for `T`. If
+        /// `T: KnownLayout`, then
+        /// `T::size_for_metadata(self.pointer_metadata())` returns
+        /// `Some(referent.len())`.
         pub(crate) unsafe fn as_byte_slice_mut(&mut self) -> &mut impl ByteSliceMut {
             // INVARIANTS: The caller promises not to call methods other than
             // those on `ByteSliceMut`. Since `B: ByteSlice`, dereference
             // stability guarantees that calling `ByteSlice` methods will not
-            // change the address or length of `self.0`'s referent.
+            // change the address or length of `self.bytes`'s referent.
             //
-            // SAFETY: By invariant on `self.0`, the alignment and size
-            // post-conditions are upheld.
-            &mut self.0
+            // SAFETY: By invariant on `self`, the alignment, size, and metadata
+            // postconditions are upheld.
+            &mut self.bytes
         }
     }
 
@@ -141,17 +199,20 @@ impl<'a, B: IntoByteSlice<'a>, T: ?Sized> Ref<B, T> {
         /// [`IntoByteSlice`] other than `IntoByteSlice` methods (for example,
         /// via `Any::downcast_ref`).
         ///
-        /// `as_byte_slice` promises to return a `ByteSlice` whose referent is
-        /// validly-aligned for `T` and has a valid size for `T`.
+        /// `into_byte_slice` promises to return an `IntoByteSlice` whose
+        /// referent is validly aligned for `T` and has a valid size for `T`. If
+        /// `T: KnownLayout`, then
+        /// `T::size_for_metadata(self.pointer_metadata())` returns
+        /// `Some(referent.len())`.
         pub(crate) unsafe fn into_byte_slice(self) -> impl IntoByteSlice<'a> {
             // INVARIANTS: The caller promises not to call methods other than
             // those on `IntoByteSlice`. Since `B: ByteSlice`, dereference
             // stability guarantees that calling `ByteSlice` methods will not
-            // change the address or length of `self.0`'s referent.
+            // change the address or length of `self.bytes`'s referent.
             //
-            // SAFETY: By invariant on `self.0`, the alignment and size
-            // post-conditions are upheld.
-            self.0
+            // SAFETY: By invariant on `self`, the alignment, size, and metadata
+            // postconditions are upheld.
+            self.bytes
         }
     }
 
@@ -164,33 +225,38 @@ impl<'a, B: IntoByteSliceMut<'a>, T: ?Sized> Ref<B, T> {
         /// [`IntoByteSliceMut`] other than `IntoByteSliceMut` methods (for
         /// example, via `Any::downcast_mut`).
         ///
-        /// `as_byte_slice` promises to return a `ByteSlice` whose referent is
-        /// validly-aligned for `T` and has a valid size for `T`.
+        /// `into_byte_slice_mut` promises to return an `IntoByteSliceMut` whose
+        /// referent is validly aligned for `T` and has a valid size for `T`. If
+        /// `T: KnownLayout`, then
+        /// `T::size_for_metadata(self.pointer_metadata())` returns
+        /// `Some(referent.len())`.
         pub(crate) unsafe fn into_byte_slice_mut(self) -> impl IntoByteSliceMut<'a> {
             // INVARIANTS: The caller promises not to call methods other than
             // those on `IntoByteSliceMut`. Since `B: ByteSlice`, dereference
             // stability guarantees that calling `ByteSlice` methods will not
-            // change the address or length of `self.0`'s referent.
+            // change the address or length of `self.bytes`'s referent.
             //
-            // SAFETY: By invariant on `self.0`, the alignment and size
-            // post-conditions are upheld.
-            self.0
+            // SAFETY: By invariant on `self`, the alignment, size, and metadata
+            // postconditions are upheld.
+            self.bytes
         }
     }
 
     impl<B: CloneableByteSlice + Clone, T: ?Sized> Clone for Ref<B, T> {
         #[inline]
         fn clone(&self) -> Ref<B, T> {
-            // INVARIANTS: Since `B: CloneableByteSlice`, `self.0.clone()` has
-            // the same address and length as `self.0`. Since `self.0` upholds
-            // the field invariants, so does `self.0.clone()`.
-            Ref(self.0.clone(), PhantomData)
+            // INVARIANTS: Since `B: CloneableByteSlice`, `self.bytes.clone()` has
+            // the same address and length as `self.bytes`. We copy
+            // `self.elem_count`, so the clone also has the same metadata. Since
+            // `self` upholds the field invariants, so does the clone.
+            Ref { bytes: self.bytes.clone(), elem_count: self.elem_count, _marker: PhantomData }
         }
     }
 
-    // INVARIANTS: Since `B: CopyableByteSlice`, the copied `Ref`'s `.0` has the
-    // same address and length as the original `Ref`'s `.0`. Since the original
-    // upholds the field invariants, so does the copy.
+    // INVARIANTS: Since `B: CopyableByteSlice`, the copied `Ref`'s `bytes` has the
+    // same address and length as the original `Ref`'s `bytes`. The copied
+    // `elem_count` has the same metadata. Since the original upholds the field
+    // invariants, so does the copy.
     impl<B: CopyableByteSlice + Copy, T: ?Sized> Copy for Ref<B, T> {}
 }
 
@@ -198,7 +264,7 @@ impl<B: CopyableByteSlice + Copy, T: ?Sized> Copy for Ref<B, T> {}
 pub use def::Ref;
 
 use crate::pointer::{
-    invariant::{Aligned, BecauseExclusive, Initialized, Unaligned, Valid},
+    invariant::{Aligned, BecauseExclusive, Initialized, Safe, Unaligned},
     BecauseRead, PtrInner,
 };
 
@@ -215,8 +281,14 @@ pub(crate) fn sized_from(bytes: B) -> Result<Ref<B, T>, CastError<B, T>> {
             return Err(err.with_src(bytes).into());
         }
 
-        // SAFETY: We just validated size and alignment.
-        Ok(unsafe { Ref::new_unchecked(bytes) })
+        // SAFETY: `size_of` returns `T`'s size in bytes [1]. The equality check
+        // above therefore establishes that `bytes` has exactly that byte
+        // length, and `validate_aligned_to` establishes alignment.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of.html:
+        //
+        //     Returns the size of a type in bytes.
+        Ok(unsafe { Ref::new_sized_unchecked(bytes) })
     }
 }
 
@@ -238,10 +310,15 @@ pub(crate) fn sized_from_prefix(bytes: B) -> Result<(Ref<B, T>, B), CastError<B,
         )?;
         // SAFETY: We just validated alignment and that `bytes` is at least as
         // large as `T`. `bytes.split_at(mem::size_of::<T>())?` ensures that the
-        // new `bytes` is exactly the size of `T`. By safety postcondition on
+        // new `bytes` is exactly the size of `T`, measured in bytes as specified
+        // for `size_of` [1]. By safety postcondition on
         // `SplitByteSlice::split_at` we can rely on `split_at` to produce the
         // correct `bytes` and `suffix`.
-        let r = unsafe { Ref::new_unchecked(bytes) };
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of.html:
+        //
+        //     Returns the size of a type in bytes.
+        let r = unsafe { Ref::new_sized_unchecked(bytes) };
         Ok((r, suffix))
     }
 
@@ -259,11 +336,16 @@ pub(crate) fn sized_from_suffix(bytes: B) -> Result<(B, Ref<B, T>), CastError<B,
         }
         // SAFETY: Since `split_at` is defined as `bytes_len - size_of::<T>()`,
         // the `bytes` which results from `let (prefix, bytes) =
-        // bytes.split_at(split_at)?` has length `size_of::<T>()`. After
-        // constructing `bytes`, we validate that it has the proper alignment.
-        // By safety postcondition on `SplitByteSlice::split_at` we can rely on
-        // `split_at` to produce the correct `prefix` and `bytes`.
-        let r = unsafe { Ref::new_unchecked(bytes) };
+        // bytes.split_at(split_at)?` has length `size_of::<T>()`, measured in
+        // bytes as specified for `size_of` [1]. After constructing `bytes`, we
+        // validate that it has the proper alignment. By safety postcondition on
+        // `SplitByteSlice::split_at` we can rely on `split_at` to produce the
+        // correct `prefix` and `bytes`.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of.html:
+        //
+        //     Returns the size of a type in bytes.
+        let r = unsafe { Ref::new_sized_unchecked(bytes) };
         Ok((prefix, r))
     }
 }
@@ -306,17 +388,64 @@ impl<B, T> Ref<B, T>
     ///
     /// let _ = Ref::<_, ZSTy>::from_bytes(&b"UU"[..]); // ⚠ Compile Error!
     /// ```
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_from_bytes",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[must_use = "has no side effects"]
     #[inline]
     pub fn from_bytes(source: B) -> Result<Ref<B, T>, CastError<B, T>> {
         static_assert_dst_is_not_zst!(T);
-        if let Err(e) =
-            Ptr::from_ref(source.deref()).try_cast_into_no_leftover::<T, BecauseImmutable>(None)
+        let metadata = match Ptr::from_ref(source.deref())
+            .try_cast_into_no_leftover::<T, BecauseImmutable>(None)
         {
-            return Err(e.with_src(()).with_src(source));
-        }
-        // SAFETY: `try_cast_into_no_leftover` validates size and alignment.
-        Ok(unsafe { Ref::new_unchecked(source) })
+            Ok(ptr) => T::pointer_to_metadata(ptr.as_inner().as_ptr()),
+            Err(e) => return Err(e.with_src(()).with_src(source)),
+        };
+        // SAFETY: By its safety postcondition, `try_cast_into_no_leftover`
+        // returned a `Ptr<T>` aligned as required for references [2], over the
+        // same byte range as `source.deref()`. `pointer_to_metadata` returns
+        // the metadata stored in that pointer, and `size_for_metadata` computes
+        // the corresponding dynamically-known byte size [1]. Thus,
+        // `T::size_for_metadata(metadata)` is `Some(source.len())`.
+        // `ByteSlice` and its applicable subtraits guarantee that the stored
+        // `source` continues to dereference or convert to that address and
+        // length. These facts establish both preconditions of `new_unchecked`.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of_val.html:
+        //
+        //     Returns the size of the pointed-to value in bytes.
+        //
+        //     ... when `T` has no statically-known size ... `size_of_val` can
+        //     be used to get the dynamically-known size.
+        //
+        // [2] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.align_of_val.html:
+        //
+        //     Returns the ABI-required minimum alignment of the type of the
+        //     value that `val` points to.
+        //
+        //     Every reference to a value of the type `T` must be a multiple of
+        //     this number.
+        Ok(unsafe { Ref::new_unchecked(source, metadata) })
     }
 }
 
@@ -360,14 +489,37 @@ impl<B, T> Ref<B, T>
     ///
     /// let _ = Ref::<_, ZSTy>::from_prefix(&b"UU"[..]); // ⚠ Compile Error!
     /// ```
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_from_prefix",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[must_use = "has no side effects"]
     #[inline]
     pub fn from_prefix(source: B) -> Result<(Ref<B, T>, B), CastError<B, T>> {
         static_assert_dst_is_not_zst!(T);
-        let remainder = match Ptr::from_ref(source.deref())
+        let (metadata, remainder) = match Ptr::from_ref(source.deref())
             .try_cast_into::<T, BecauseImmutable>(CastType::Prefix, None)
         {
-            Ok((_, remainder)) => remainder,
+            Ok((ptr, remainder)) => (T::pointer_to_metadata(ptr.as_inner().as_ptr()), remainder),
             Err(e) => {
                 return Err(e.with_src(()).with_src(source));
             }
@@ -381,11 +533,35 @@ pub fn from_prefix(source: B) -> Result<(Ref<B, T>, B), CastError<B, T>> {
         #[allow(unstable_name_collisions)]
         let split_at = unsafe { source.len().unchecked_sub(remainder.len()) };
         let (bytes, suffix) = source.split_at(split_at).map_err(|b| SizeError::new(b).into())?;
-        // SAFETY: `try_cast_into` validates size and alignment, and returns a
-        // `split_at` that indicates how many bytes of `source` correspond to a
-        // valid `T`. By safety postcondition on `SplitByteSlice::split_at` we
-        // can rely on `split_at` to produce the correct `source` and `suffix`.
-        let r = unsafe { Ref::new_unchecked(bytes) };
+        // SAFETY: By its safety postcondition, `try_cast_into` returned an
+        // `Ptr<T>` aligned as required for references [2], and a remainder
+        // which are non-overlapping, cover `source.deref()`, and place the
+        // `Ptr<T>` at `source.deref()`'s address.
+        // Therefore, `split_at` is the typed pointer's byte length. By the
+        // safety postcondition of `SplitByteSlice::split_at`, `bytes` has that
+        // length and address. `pointer_to_metadata` returns the metadata stored
+        // in the typed pointer, and `size_for_metadata` computes the
+        // corresponding dynamically-known byte size [1]. Thus,
+        // `T::size_for_metadata(metadata)` is `Some(bytes.len())`. The
+        // `SplitByteSlice` and `ByteSlice` contracts preserve the established
+        // address and length, satisfying both preconditions of
+        // `new_unchecked`.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of_val.html:
+        //
+        //     Returns the size of the pointed-to value in bytes.
+        //
+        //     ... when `T` has no statically-known size ... `size_of_val` can
+        //     be used to get the dynamically-known size.
+        //
+        // [2] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.align_of_val.html:
+        //
+        //     Returns the ABI-required minimum alignment of the type of the
+        //     value that `val` points to.
+        //
+        //     Every reference to a value of the type `T` must be a multiple of
+        //     this number.
+        let r = unsafe { Ref::new_unchecked(bytes, metadata) };
         Ok((r, suffix))
     }
 
@@ -425,14 +601,37 @@ pub fn from_prefix(source: B) -> Result<(Ref<B, T>, B), CastError<B, T>> {
     ///
     /// let _ = Ref::<_, ZSTy>::from_suffix(&b"UU"[..]); // ⚠ Compile Error!
     /// ```
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_from_suffix",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[must_use = "has no side effects"]
     #[inline]
     pub fn from_suffix(source: B) -> Result<(B, Ref<B, T>), CastError<B, T>> {
         static_assert_dst_is_not_zst!(T);
-        let remainder = match Ptr::from_ref(source.deref())
+        let (metadata, remainder) = match Ptr::from_ref(source.deref())
             .try_cast_into::<T, BecauseImmutable>(CastType::Suffix, None)
         {
-            Ok((_, remainder)) => remainder,
+            Ok((ptr, remainder)) => (T::pointer_to_metadata(ptr.as_inner().as_ptr()), remainder),
             Err(e) => {
                 let e = e.with_src(());
                 return Err(e.with_src(source));
@@ -441,11 +640,39 @@ pub fn from_suffix(source: B) -> Result<(B, Ref<B, T>), CastError<B, T>> {
 
         let split_at = remainder.len();
         let (prefix, bytes) = source.split_at(split_at).map_err(|b| SizeError::new(b).into())?;
-        // SAFETY: `try_cast_into` validates size and alignment, and returns a
-        // `split_at` that indicates how many bytes of `source` correspond to a
-        // valid `T`. By safety postcondition on `SplitByteSlice::split_at` we
-        // can rely on `split_at` to produce the correct `prefix` and `bytes`.
-        let r = unsafe { Ref::new_unchecked(bytes) };
+        // SAFETY: By its safety postcondition, `try_cast_into` returned an
+        // `Ptr<T>` aligned as required for references [2], and a remainder
+        // which are non-overlapping, cover `source.deref()`, and place the
+        // remainder at `source.deref()`'s address. More precisely,
+        // `PtrInner::try_cast_into` constructs the typed suffix from the
+        // `r_slice` produced by `split_at_unchecked(split_at)` and returns its
+        // `l_slice` as `remainder`. Thus, even when `T` is zero-sized, the typed
+        // pointer and the `bytes` produced by splitting `source` at
+        // `remainder.len()` have the same address and length. By the safety
+        // postcondition of `SplitByteSlice::split_at`, `bytes` retains that
+        // address and length. `pointer_to_metadata` returns the metadata stored
+        // in the typed pointer, and `size_for_metadata` computes the
+        // corresponding dynamically-known byte size [1]. Thus,
+        // `T::size_for_metadata(metadata)` is `Some(bytes.len())`. The
+        // `SplitByteSlice` and `ByteSlice` contracts preserve the established
+        // address and length, satisfying both preconditions of
+        // `new_unchecked`.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of_val.html:
+        //
+        //     Returns the size of the pointed-to value in bytes.
+        //
+        //     ... when `T` has no statically-known size ... `size_of_val` can
+        //     be used to get the dynamically-known size.
+        //
+        // [2] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.align_of_val.html:
+        //
+        //     Returns the ABI-required minimum alignment of the type of the
+        //     value that `val` points to.
+        //
+        //     Every reference to a value of the type `T` must be a multiple of
+        //     this number.
+        let r = unsafe { Ref::new_unchecked(bytes, metadata) };
         Ok((prefix, r))
     }
 }
@@ -487,6 +714,24 @@ impl<B, T> Ref<B, T>
     ///
     /// let _ = Ref::<_, ZSTy>::from_bytes_with_elems(&b"UU"[..], 42); // ⚠ Compile Error!
     /// ```
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_from_bytes_with_elems",
+        format = "coco",
+        arity = 2,
+        [
+            open
+            @index 1
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 2
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[inline]
     pub fn from_bytes_with_elems(source: B, count: usize) -> Result<Ref<B, T>, CastError<B, T>> {
         static_assert_dst_is_not_zst!(T);
@@ -497,7 +742,37 @@ pub fn from_bytes_with_elems(source: B, count: usize) -> Result<Ref<B, T>, CastE
         if source.len() != expected_len {
             return Err(SizeError::new(source).into());
         }
-        Self::from_bytes(source)
+        if let Err(e) = Ptr::from_ref(source.deref())
+            .try_cast_into_no_leftover::<T, BecauseImmutable>(Some(count))
+        {
+            return Err(e.with_src(()).with_src(source));
+        }
+        // SAFETY: `size_for_metadata(count)` returned `expected_len`, and the
+        // equality check established that this is `source.len()`. This is the
+        // dynamically-known byte size described by `size_of_val` [1]. By its
+        // safety postcondition, `try_cast_into_no_leftover(Some(count))` only
+        // succeeded after producing a `Ptr<T>` aligned as required for
+        // references [2], with that metadata over the same byte range as
+        // `source.deref()`. `ByteSlice` and its applicable subtraits guarantee
+        // that the stored `source` continues to dereference or convert to that
+        // address and length. These facts establish both preconditions of
+        // `new_unchecked`.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of_val.html:
+        //
+        //     Returns the size of the pointed-to value in bytes.
+        //
+        //     ... when `T` has no statically-known size ... `size_of_val` can
+        //     be used to get the dynamically-known size.
+        //
+        // [2] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.align_of_val.html:
+        //
+        //     Returns the ABI-required minimum alignment of the type of the
+        //     value that `val` points to.
+        //
+        //     Every reference to a value of the type `T` must be a multiple of
+        //     this number.
+        Ok(unsafe { Ref::new_unchecked(source, count) })
     }
 }
 
@@ -538,6 +813,24 @@ impl<B, T> Ref<B, T>
     ///
     /// let _ = Ref::<_, ZSTy>::from_prefix_with_elems(&b"UU"[..], 42); // ⚠ Compile Error!
     /// ```
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_from_prefix_with_elems",
+        format = "coco",
+        arity = 2,
+        [
+            open
+            @index 1
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 2
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[inline]
     pub fn from_prefix_with_elems(
         source: B,
@@ -549,7 +842,7 @@ pub fn from_prefix_with_elems(
             None => return Err(SizeError::new(source).into()),
         };
         let (prefix, bytes) = source.split_at(expected_len).map_err(SizeError::new)?;
-        Self::from_bytes(prefix).map(move |l| (l, bytes))
+        Self::from_bytes_with_elems(prefix, count).map(move |l| (l, bytes))
     }
 
     /// Constructs a `Ref` from the suffix of the given bytes with DST length
@@ -584,6 +877,24 @@ pub fn from_prefix_with_elems(
     ///
     /// let _ = Ref::<_, ZSTy>::from_suffix_with_elems(&b"UU"[..], 42); // ⚠ Compile Error!
     /// ```
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_from_suffix_with_elems",
+        format = "coco",
+        arity = 2,
+        [
+            open
+            @index 1
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 2
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[inline]
     pub fn from_suffix_with_elems(
         source: B,
@@ -602,7 +913,7 @@ pub fn from_suffix_with_elems(
         // SAFETY: The preceding `source.len().checked_sub(expected_len)`
         // guarantees that `split_at` is in-bounds.
         let (bytes, suffix) = unsafe { source.split_at_unchecked(split_at) };
-        Self::from_bytes(suffix).map(move |l| (bytes, l))
+        Self::from_bytes_with_elems(suffix, count).map(move |l| (bytes, l))
     }
 }
 
@@ -618,12 +929,37 @@ impl<'a, B, T> Ref<B, T>
     /// Note: this is an associated function, which means that you have to call
     /// it as `Ref::into_ref(r)` instead of `r.into_ref()`. This is so that
     /// there is no conflict with a method on the inner type.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_into_ref",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[must_use = "has no side effects"]
     #[inline(always)]
     pub fn into_ref(r: Self) -> &'a T {
         // Presumably unreachable, since we've guarded each constructor of `Ref`.
         static_assert_dst_is_not_zst!(T);
 
+        let metadata = r.pointer_metadata();
+
         // SAFETY: We don't call any methods on `b` other than those provided by
         // `IntoByteSlice`.
         let b = unsafe { r.into_byte_slice() };
@@ -642,12 +978,12 @@ pub fn into_ref(r: Self) -> &'a T {
             return ptr.as_ref();
         }
 
-        // PANICS: By post-condition on `into_byte_slice`, `b`'s size and
-        // alignment are valid for `T`. By post-condition, `b.into_byte_slice()`
-        // produces a byte slice with identical address and length to that
-        // produced by `b.deref()`.
+        // PANICS: By post-condition on `into_byte_slice`, `b` is aligned for
+        // `T`, and its size is exactly the size encoded by `metadata`. By
+        // post-condition, `b.into_byte_slice()` produces a byte slice with
+        // identical address and length to that produced by `b.deref()`.
         let ptr = Ptr::from_ref(b.into_byte_slice())
-            .try_cast_into_no_leftover::<T, BecauseImmutable>(None)
+            .try_cast_into_no_leftover::<T, BecauseImmutable>(Some(metadata))
             .expect("zerocopy internal error: into_ref should be infallible");
         let ptr = ptr.recall_validity();
         ptr.as_ref()
@@ -666,12 +1002,32 @@ impl<'a, B, T> Ref<B, T>
     /// Note: this is an associated function, which means that you have to call
     /// it as `Ref::into_mut(r)` instead of `r.into_mut()`. This is so that
     /// there is no conflict with a method on the inner type.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_into_mut",
+        format = "coco",
+        arity = 2,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ]
+    )]
     #[must_use = "has no side effects"]
     #[inline(always)]
     pub fn into_mut(r: Self) -> &'a mut T {
         // Presumably unreachable, since we've guarded each constructor of `Ref`.
         static_assert_dst_is_not_zst!(T);
 
+        let metadata = r.pointer_metadata();
+
         // SAFETY: We don't call any methods on `b` other than those provided by
         // `IntoByteSliceMut`.
         let b = unsafe { r.into_byte_slice_mut() };
@@ -686,7 +1042,7 @@ pub fn into_mut(r: Self) -> &'a mut T {
                     T,
                     _,
                     (BecauseRead, BecauseExclusive),
-                    (BecauseMutationCompatible, BecauseInvariantsEq),
+                    (BecauseMutationCompatible, BecauseSharedCompatible),
                 >(ptr)
             };
 
@@ -697,13 +1053,13 @@ pub fn into_mut(r: Self) -> &'a mut T {
             return ptr.as_mut();
         }
 
-        // PANICS: By post-condition on `into_byte_slice_mut`, `b`'s size and
-        // alignment are valid for `T`. By post-condition,
-        // `b.into_byte_slice_mut()` produces a byte slice with identical
-        // address and length to that produced by `b.deref_mut()`.
+        // PANICS: By post-condition on `into_byte_slice_mut`, `b` is aligned
+        // for `T`, and its size is exactly the size encoded by `metadata`. By
+        // post-condition, `b.into_byte_slice_mut()` produces a byte slice with
+        // identical address and length to that produced by `b.deref_mut()`.
         let ptr = Ptr::from_mut(b.into_byte_slice_mut())
-            .try_cast_into_no_leftover::<T, BecauseExclusive>(None)
-            .expect("zerocopy internal error: into_ref should be infallible");
+            .try_cast_into_no_leftover::<T, BecauseExclusive>(Some(metadata))
+            .expect("zerocopy internal error: into_mut should be infallible");
         let ptr = ptr.recall_validity::<_, (_, (_, _))>();
         ptr.as_mut()
     }
@@ -719,6 +1075,29 @@ impl<B, T> Ref<B, T>
     /// Note: this is an associated function, which means that you have to call
     /// it as `Ref::bytes(r)` instead of `r.bytes()`. This is so that there is
     /// no conflict with a method on the inner type.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_bytes",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[inline]
     pub fn bytes(r: &Self) -> &[u8] {
         // SAFETY: We don't call any methods on `b` other than those provided by
@@ -737,6 +1116,29 @@ impl<B, T> Ref<B, T>
     /// Note: this is an associated function, which means that you have to call
     /// it as `Ref::bytes_mut(r)` instead of `r.bytes_mut()`. This is so that
     /// there is no conflict with a method on the inner type.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_bytes_mut",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[inline]
     pub fn bytes_mut(r: &mut Self) -> &mut [u8] {
         // SAFETY: We don't call any methods on `b` other than those provided by
@@ -755,6 +1157,12 @@ impl<B, T> Ref<B, T>
     /// Note: this is an associated function, which means that you have to call
     /// it as `Ref::read(r)` instead of `r.read()`. This is so that there is no
     /// conflict with a method on the inner type.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_read_static_size",
+        format = "coco_static_size",
+    )]
     #[must_use = "has no side effects"]
     #[inline]
     pub fn read(r: &Self) -> T {
@@ -780,14 +1188,20 @@ impl<B, T> Ref<B, T>
     /// Note: this is an associated function, which means that you have to call
     /// it as `Ref::write(r, t)` instead of `r.write(t)`. This is so that there
     /// is no conflict with a method on the inner type.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_write_static_size",
+        format = "coco_static_size",
+    )]
     #[inline]
     pub fn write(r: &mut Self, t: T) {
         // SAFETY: We don't call any methods on `b` other than those provided by
         // `ByteSliceMut`.
         let b = unsafe { r.as_byte_slice_mut() };
 
-        // SAFETY: By postcondition on `as_byte_slice_mut`, we know that `b` is
-        // a valid size and alignment for `T`. By safety invariant on
+        // SAFETY: By postcondition on `as_byte_slice_mut`, we know that `b` is a
+        // valid size and alignment for `T`. By safety invariant on
         // `ByteSlice`, we know that this is preserved via `.deref()`. Writing
         // `t` to the buffer will allow all of the bytes of `t` to be accessed
         // as a `[u8]`, but because `T: IntoBytes`, we know that this is sound.
@@ -801,11 +1215,38 @@ impl<B, T> Deref for Ref<B, T>
     T: FromBytes + KnownLayout + Immutable + ?Sized,
 {
     type Target = T;
+
+    /// Dereferences the value.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_deref",
+        format = "coco",
+        arity = 3,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ],
+        [
+            @index 3
+            @title "Dynamically Padded"
+            @variant "dynamic_padding"
+        ]
+    )]
     #[inline]
     fn deref(&self) -> &T {
         // Presumably unreachable, since we've guarded each constructor of `Ref`.
         static_assert_dst_is_not_zst!(T);
 
+        let metadata = self.pointer_metadata();
+
         // SAFETY: We don't call any methods on `b` other than those provided by
         // `ByteSlice`.
         let b = unsafe { self.as_byte_slice() };
@@ -824,11 +1265,12 @@ fn deref(&self) -> &T {
             return ptr.as_ref();
         }
 
-        // PANICS: By postcondition on `as_byte_slice`, `b`'s size and alignment
-        // are valid for `T`, and by invariant on `ByteSlice`, these are
-        // preserved through `.deref()`, so this `unwrap` will not panic.
+        // PANICS: By postcondition on `as_byte_slice`, `b` is aligned for `T`,
+        // and its size is exactly the size encoded by `metadata`. By invariant
+        // on `ByteSlice`, these are preserved through `.deref()`, so this
+        // `unwrap` will not panic.
         let ptr = Ptr::from_ref(b)
-            .try_cast_into_no_leftover::<T, BecauseImmutable>(None)
+            .try_cast_into_no_leftover::<T, BecauseImmutable>(Some(metadata))
             .expect("zerocopy internal error: Deref::deref should be infallible");
         let ptr = ptr.recall_validity();
         ptr.as_ref()
@@ -843,11 +1285,32 @@ impl<B, T> DerefMut for Ref<B, T>
     // add a separate inherent method for this?
     T: FromBytes + IntoBytes + KnownLayout + Immutable + ?Sized,
 {
+    /// Mutably dereferences the value.
+    ///
+    #[doc = codegen_section!(
+        header = "h5",
+        bench = "ref_type_deref_mut",
+        format = "coco",
+        arity = 2,
+        [
+            open
+            @index 1
+            @title "Sized"
+            @variant "static_size"
+        ],
+        [
+            @index 2
+            @title "Unsized"
+            @variant "dynamic_size"
+        ]
+    )]
     #[inline]
     fn deref_mut(&mut self) -> &mut T {
         // Presumably unreachable, since we've guarded each constructor of `Ref`.
         static_assert_dst_is_not_zst!(T);
 
+        let metadata = self.pointer_metadata();
+
         // SAFETY: We don't call any methods on `b` other than those provided by
         // `ByteSliceMut`.
         let b = unsafe { self.as_byte_slice_mut() };
@@ -862,7 +1325,7 @@ fn deref_mut(&mut self) -> &mut T {
                     T,
                     _,
                     (BecauseRead, BecauseExclusive),
-                    (BecauseMutationCompatible, BecauseInvariantsEq),
+                    (BecauseMutationCompatible, BecauseSharedCompatible),
                 >(ptr)
             };
 
@@ -873,12 +1336,12 @@ fn deref_mut(&mut self) -> &mut T {
             return ptr.as_mut();
         }
 
-        // PANICS: By postcondition on `as_byte_slice_mut`, `b`'s size and
-        // alignment are valid for `T`, and by invariant on `ByteSlice`, these
-        // are preserved through `.deref_mut()`, so this `unwrap` will not
-        // panic.
+        // PANICS: By postcondition on `as_byte_slice_mut`, `b` is aligned for
+        // `T`, and its size is exactly the size encoded by `metadata`. By
+        // invariant on `ByteSlice`, these are preserved through `.deref_mut()`,
+        // so this `unwrap` will not panic.
         let ptr = Ptr::from_mut(b)
-            .try_cast_into_no_leftover::<T, BecauseExclusive>(None)
+            .try_cast_into_no_leftover::<T, BecauseExclusive>(Some(metadata))
             .expect("zerocopy internal error: DerefMut::deref_mut should be infallible");
         let ptr = ptr.recall_validity::<_, (_, (_, BecauseExclusive))>();
         ptr.as_mut()
@@ -958,13 +1421,13 @@ fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
 /// `T: Sized` and `ptr`'s referent must have size `size_of::<T>()`.
 #[inline(always)]
 unsafe fn cast_for_sized<'a, T, A, R, S>(
-    ptr: Ptr<'a, [u8], (A, Aligned, Valid)>,
-) -> Ptr<'a, T, (A, Unaligned, Valid)>
+    ptr: Ptr<'a, [u8], (A, Aligned, Safe)>,
+) -> Ptr<'a, T, (A, Unaligned, Safe)>
 where
     T: FromBytes + KnownLayout + ?Sized,
     A: crate::invariant::Aliasing,
     [u8]: MutationCompatible<T, A, Initialized, Initialized, R>,
-    T: TransmuteFromPtr<T, A, Initialized, Valid, crate::pointer::cast::IdCast, S>,
+    T: TransmuteFromPtr<T, A, Initialized, Safe, crate::pointer::cast::IdCast, S>,
 {
     use crate::pointer::cast::{Cast, Project};
 
@@ -990,7 +1453,7 @@ unsafe impl<T: ?Sized + KnownLayout> Cast<[u8], T> for CastForSized {}
 
     ptr.recall_validity::<Initialized, (_, (_, _))>()
         .cast::<_, CastForSized, _>()
-        .recall_validity::<Valid, _>()
+        .recall_validity::<Safe, _>()
 }
 
 #[cfg(test)]
@@ -1028,6 +1491,66 @@ fn test_address() {
         assert_eq!(buf_ptr, deref_ptr);
     }
 
+    #[test]
+    #[allow(clippy::clone_on_copy)] // Exercise `Ref`'s manual `Clone` impl.
+    fn test_with_elems_preserves_ambiguous_metadata() {
+        #[derive(FromBytes, Immutable, KnownLayout)]
+        #[repr(C, align(8))]
+        struct Frame {
+            header: [u8; 8],
+            body: [u8],
+        }
+
+        #[derive(FromBytes, Immutable, KnownLayout)]
+        #[repr(C, align(8))]
+        struct OddHeader {
+            header: [u8; 7],
+            body: [u8],
+        }
+
+        // Dynamic trailing padding makes these pairs of distinct element
+        // counts produce the same total byte size. Thus, the byte length alone
+        // cannot recover the count supplied to a `*_with_elems` constructor.
+        assert_eq!(Frame::size_for_metadata(1), Some(16));
+        assert_eq!(Frame::size_for_metadata(8), Some(16));
+        assert_eq!(OddHeader::size_for_metadata(0), Some(8));
+        assert_eq!(OddHeader::size_for_metadata(1), Some(8));
+
+        let bytes = Align::<[u8; 32], AU64>::default();
+
+        let whole = Ref::<_, Frame>::from_bytes_with_elems(&bytes.t[..16], 1).unwrap();
+        assert_eq!(whole.body.len(), 1);
+        assert_eq!(Ref::bytes(&whole).len(), 16);
+        assert_eq!(whole.clone().body.len(), 1);
+        let copied = whole;
+        assert_eq!(copied.body.len(), 1);
+        assert_eq!(Ref::into_ref(whole).body.len(), 1);
+
+        let (prefix, rest) = Ref::<_, Frame>::from_prefix_with_elems(&bytes.t[..], 1).unwrap();
+        assert_eq!(prefix.body.len(), 1);
+        assert_eq!(rest.len(), 16);
+
+        let (before, suffix) = Ref::<_, Frame>::from_suffix_with_elems(&bytes.t[..24], 1).unwrap();
+        assert_eq!(before.len(), 8);
+        assert_eq!(suffix.body.len(), 1);
+
+        // Zero is real metadata, not a sentinel for "infer from the bytes".
+        let empty = Ref::<_, OddHeader>::from_bytes_with_elems(&bytes.t[..8], 0).unwrap();
+        assert!(empty.body.is_empty());
+        assert!(Ref::into_ref(empty).body.is_empty());
+
+        // The implicit constructors still choose the largest fitting count,
+        // and retain the metadata selected during their validating cast.
+        let inferred = Ref::<_, Frame>::from_bytes(&bytes.t[..16]).unwrap();
+        assert_eq!(inferred.body.len(), 8);
+        let (inferred, rest) = Ref::<_, Frame>::from_prefix(&bytes.t[..16]).unwrap();
+        assert_eq!(inferred.body.len(), 8);
+        assert!(rest.is_empty());
+        let (before, inferred) = Ref::<_, Frame>::from_suffix(&bytes.t[..16]).unwrap();
+        assert!(before.is_empty());
+        assert_eq!(inferred.body.len(), 8);
+    }
+
     // Verify that values written to a `Ref` are properly shared between the
     // typed and untyped representations, that reads via `deref` and `read`
     // behave the same, and that writes via `deref_mut` and `write` behave the
@@ -1251,6 +1774,13 @@ fn test_into_ref_mut() {
 
         *rf = u64::MAX;
         assert_eq!(buf.t, [0xFF; 8]);
+
+        // Exercise the unsized `into_mut` route, which must use the metadata
+        // retained by the constructor rather than infer fresh metadata.
+        let mut buf = Align::<[u8; 8], u16>::default();
+        let r = Ref::<_, [u16]>::from_bytes_with_elems(&mut buf.t[..], 4).unwrap();
+        let rf = Ref::into_mut(r);
+        assert_eq!(rf.len(), 4);
     }
 
     #[test]
@@ -1325,8 +1855,13 @@ fn bench_into_mut_sized(b: &mut Bencher) {
         let _ = Ref::<_, AU64>::from_bytes(&mut *buf).unwrap();
         b.iter(move || {
             // SAFETY: The preceding `from_bytes` succeeded, and so we know that
-            // `buf` is validly-aligned and has the correct length.
-            let r = unsafe { Ref::<&mut [u8], AU64>::new_unchecked(&mut *buf) };
+            // `buf` is validly aligned and has the `size_of::<AU64>()` byte
+            // length required by `new_sized_unchecked` [1].
+            //
+            // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of.html:
+            //
+            //     Returns the size of a type in bytes.
+            let r = unsafe { Ref::<&mut [u8], AU64>::new_sized_unchecked(&mut *buf) };
             test::black_box(Ref::into_mut(test::black_box(r)));
         });
     }
@@ -1349,8 +1884,13 @@ fn bench_deref_mut_sized(b: &mut Bencher) {
         let _ = Ref::<_, AU64>::from_bytes(&mut *buf).unwrap();
         b.iter(|| {
             // SAFETY: The preceding `from_bytes` succeeded, and so we know that
-            // `buf` is validly-aligned and has the correct length.
-            let r = unsafe { Ref::<&mut [u8], AU64>::new_unchecked(&mut *buf) };
+            // `buf` is validly aligned and has the `size_of::<AU64>()` byte
+            // length required by `new_sized_unchecked` [1].
+            //
+            // [1] Per https://doc.rust-lang.org/1.56.0/core/mem/fn.size_of.html:
+            //
+            //     Returns the size of a type in bytes.
+            let r = unsafe { Ref::<&mut [u8], AU64>::new_sized_unchecked(&mut *buf) };
             let mut temp = test::black_box(r);
             test::black_box(temp.deref_mut());
         });
diff --git a/rust/zerocopy/src/split_at.rs b/rust/zerocopy/src/split_at.rs
index d7778425a31d..4aeb602f69e0 100644
--- a/rust/zerocopy/src/split_at.rs
+++ b/rust/zerocopy/src/split_at.rs
@@ -10,13 +10,19 @@
 // those terms.
 
 use super::*;
-use crate::pointer::invariant::{Aligned, Exclusive, Invariants, Shared, Valid};
+use crate::pointer::invariant::{Aligned, Exclusive, Invariants, Safe, Shared};
 
 /// Types that can be split in two.
 ///
 /// This trait generalizes Rust's existing support for splitting slices to
 /// support slices and slice-based dynamically-sized types ("slice DSTs").
 ///
+/// For a `repr(C, packed)` or `repr(C, packed(N))` struct, the derive wraps
+/// the trailing field's [`Elem`](Self::Elem) in [`Unalign`]. The returned
+/// slice can therefore be accessed even when packing misaligns the original
+/// elements. Each packed struct in the trailing-field chain adds one wrapper;
+/// unpacked structs and [`ManuallyDrop`] forward their trailing type's `Elem`.
+///
 /// # Implementation
 ///
 /// **Do not implement this trait yourself!** Instead, use
@@ -38,6 +44,28 @@
 /// This derive performs a sophisticated, compile-time safety analysis to
 /// determine whether a type is `SplitAt`.
 ///
+/// A packed struct exposes its trailing elements through `Unalign`:
+///
+/// ```
+/// use zerocopy::{FromBytes, SplitAt, Unalign};
+/// # use zerocopy_derive::*;
+///
+/// #[derive(FromBytes, IntoBytes, KnownLayout, SplitAt)]
+/// #[repr(C, packed)]
+/// struct Packet {
+///     tag: u8,
+///     words: [u16],
+/// }
+///
+/// let mut bytes = [0u8; 5];
+/// let packet = Packet::mut_from_bytes(&mut bytes[..]).unwrap();
+/// let (left, right): (&mut Packet, &mut [Unalign<u16>]) =
+///     packet.split_at_mut(1).unwrap().via_into_bytes();
+/// left.tag = 1;
+/// right[0] = Unalign::new(0x0202);
+/// assert_eq!(bytes, [1, 0, 0, 2, 2]);
+/// ```
+///
 /// # Safety
 ///
 /// This trait does not convey any safety guarantees to code outside this crate.
@@ -58,10 +86,20 @@
 )]
 // # Safety
 //
-// The trailing slice is well-aligned for its element type. `Self` is `[T]`, or
-// a `repr(C)` or `repr(transparent)` slice DST.
+// `Self` is a slice, a `repr(C)` (possibly packed) or `repr(transparent)` slice
+// DST, or `ManuallyDrop<T>` for some `T: SplitAt`.
+//
+// `Self::Elem` has the same size, bit validity, and `UnsafeCell` coverage as
+// the actual trailing element type. Access through either representation
+// preserves the other's validity, including writes through mutable references
+// and interior mutation through shared references. For every aligned `Self`,
+// its trailing slice's address is aligned for `Self::Elem`.
 pub unsafe trait SplitAt: KnownLayout<PointerMetadata = usize> {
-    /// The element type of the trailing slice.
+    /// The element type exposed by the split's returned slice.
+    ///
+    /// For `[T]`, this is `T`. For a struct, this is the trailing field's `Elem`,
+    /// wrapped in [`Unalign`] if the struct is packed. Nested packed structs
+    /// produce nested `Unalign` wrappers.
     type Elem;
 
     #[doc(hidden)]
@@ -188,10 +226,7 @@ unsafe fn split_at_mut_unchecked(&mut self, l_len: usize) -> Split<&mut Self> {
     /// Attempts to split `self` in two.
     ///
     /// Returns `None` if `l_len` is greater than the length of `self`'s
-    /// trailing slice, or if the given `l_len` would result in [the trailing
-    /// padding](KnownLayout#slice-dst-layout) of the left portion overlapping
-    /// the right portion.
-    ///
+    /// trailing slice.
     ///
     /// # Examples
     ///
@@ -249,7 +284,8 @@ fn split_at_mut(&mut self, l_len: usize) -> Option<Split<&mut Self>> {
     }
 }
 
-// SAFETY: `[T]`'s trailing slice is `[T]`, which is trivially aligned.
+// SAFETY: `[T]` exposes its own element type, preserving size, validity, and
+// `UnsafeCell` coverage. An aligned slice is aligned for its elements.
 unsafe impl<T> SplitAt for [T] {
     type Elem = T;
 
@@ -262,6 +298,29 @@ fn only_derive_is_allowed_to_implement_this_trait()
     }
 }
 
+// SAFETY: `ManuallyDrop<T>` has the same layout and bit validity as `T` [1].
+// Its `KnownLayout` implementation preserves `T`'s metadata and trailing-slice
+// layout. Forwarding `T::Elem` therefore preserves its size, validity, and
+// alignment guarantees. Its `UnsafeCell` coverage also matches `T`'s, as
+// established for `ManuallyDrop` in `impls.rs`; accesses through the forwarded
+// element representation preserve validity in both directions.
+//
+// [1] Per https://doc.rust-lang.org/1.93.0/std/mem/struct.ManuallyDrop.html:
+//
+//   `ManuallyDrop<T>` is guaranteed to have the same layout and bit validity as
+//   `T`
+unsafe impl<T: ?Sized + SplitAt> SplitAt for ManuallyDrop<T> {
+    type Elem = T::Elem;
+
+    #[inline]
+    #[allow(dead_code)]
+    fn only_derive_is_allowed_to_implement_this_trait()
+    where
+        Self: Sized,
+    {
+    }
+}
+
 /// A `T` that has been split into two possibly-overlapping parts.
 ///
 /// For some dynamically sized types, the padding that appears after the
@@ -270,10 +329,11 @@ fn only_derive_is_allowed_to_implement_this_trait()
 /// requires trailing padding, the trailing padding of the left part of the
 /// split `T` will overlap the right part. If `T` is a mutable reference or
 /// permits interior mutation, you must ensure that the left and right parts do
-/// not overlap. You can do this at zero-cost using using
-/// [`Self::via_immutable`], [`Self::via_into_bytes`], or
-/// [`Self::via_unaligned`], or with a dynamic check by using
-/// [`Self::via_runtime_check`].
+/// not overlap. Use [`Self::via_into_bytes`] or
+/// [`Self::via_no_dynamic_padding`] to establish this without a runtime check,
+/// or [`Self::via_runtime_check`] to check a particular split. Shared references
+/// to an [`Immutable`] type may overlap; use [`Self::via_immutable`] in that
+/// case.
 #[derive(Debug)]
 pub struct Split<T> {
     /// A pointer to the source slice DST.
@@ -304,7 +364,7 @@ impl<'a, T> Split<&'a T>
     T: ?Sized + SplitAt,
 {
     #[inline(always)]
-    fn into_ptr(self) -> Split<Ptr<'a, T, (Shared, Aligned, Valid)>> {
+    fn into_ptr(self) -> Split<Ptr<'a, T, (Shared, Aligned, Safe)>> {
         let source = Ptr::from_ref(self.source);
         // SAFETY: `Ptr::from_ref(self.source)` points to exactly `self.source`
         // and thus maintains the invariants of `self` with respect to `l_len`.
@@ -423,59 +483,100 @@ pub fn via_into_bytes(self) -> (&'a T, &'a [T::Elem])
         (l.as_ref(), r.as_ref())
     }
 
-    /// Produces the split parts of `self`, using [`Unaligned`] to ensure that
-    /// it is sound to have concurrent references to both parts.
+    /// Produces the split parts of `self` using [`Self::via_no_dynamic_padding`].
+    #[deprecated(note = "use `Split::via_no_dynamic_padding` instead")]
+    #[doc(hidden)]
+    #[must_use = "has no side effects"]
+    #[inline(always)]
+    pub fn via_unaligned(self) -> (&'a T, &'a [T::Elem])
+    where
+        T: Unaligned,
+    {
+        self.via_no_dynamic_padding()
+    }
+
+    /// Produces the split parts of `self` using a compile-time assertion to
+    /// ensure that it is unconditionally sound to have concurrent references to
+    /// both parts.
+    ///
+    /// When possible, you should prefer using [`Self::via_into_bytes`], which
+    /// ensures this safety property through regular trait bounds.
     ///
     /// # Examples
     ///
+    /// In the below example, a single byte of padding exists (on most
+    /// platforms) between `Packet<[u16]>`'s `length` and `body` fields,
+    /// precluding the use of [`Self::via_into_bytes`].
+    ///
     /// ```
-    /// use zerocopy::{SplitAt, FromBytes};
+    /// use zerocopy::SplitAt;
     /// # use zerocopy_derive::*;
     ///
-    /// #[derive(SplitAt, FromBytes, KnownLayout, Immutable, Unaligned)]
+    /// #[derive(SplitAt, KnownLayout)]
     /// #[repr(C)]
-    /// struct Packet {
+    /// struct Packet<B: ?Sized> {
     ///     length: u8,
-    ///     body: [u8],
+    ///     body: B,
     /// }
     ///
-    /// // These bytes encode a `Packet`.
-    /// let bytes = &[4, 1, 2, 3, 4, 5, 6, 7, 8, 9][..];
-    ///
-    /// let packet = Packet::ref_from_bytes(bytes).unwrap();
+    /// let packet: &Packet<[u16]> = &Packet { length: 4, body: [1u16, 2, 3, 4, 5, 6, 7, 8, 9] };
     ///
     /// assert_eq!(packet.length, 4);
     /// assert_eq!(packet.body, [1, 2, 3, 4, 5, 6, 7, 8, 9]);
     ///
-    /// // Attempt to split `packet` at `length`.
-    /// let split = packet.split_at(packet.length as usize).unwrap();
+    /// if let Some(split) = packet.split_at(packet.length as usize) {
+    ///     // Every body length requires no trailing padding.
+    ///     let (packet, rest) = split.via_no_dynamic_padding();
+    ///     assert_eq!(packet.length, 4);
+    ///     assert_eq!(packet.body, [1, 2, 3, 4]);
+    ///     assert_eq!(rest, [5, 6, 7, 8, 9]);
+    /// } else {
+    ///     unreachable!("The packet's length field is within its body");
+    /// }
+    /// ```
     ///
-    /// // Use the `Unaligned` bound on `Packet` to prove that it's okay to
-    /// // return concurrent references to `packet` and `rest`.
-    /// let (packet, rest) = split.via_unaligned();
+    /// # Compile-Time Assertions
     ///
-    /// assert_eq!(packet.length, 4);
-    /// assert_eq!(packet.body, [1, 2, 3, 4]);
-    /// assert_eq!(rest, [5, 6, 7, 8, 9]);
+    /// This method rejects at compile-time any type that admits dynamic
+    /// trailing padding. In the below example, some `split_at` indices would
+    /// produce left parts whose trailing padding overlaps with the right part:
+    ///
+    /// ```compile_fail,E0080
+    /// use zerocopy::SplitAt;
+    /// # use zerocopy_derive::*;
+    ///
+    /// #[derive(SplitAt, KnownLayout)]
+    /// #[repr(C, align(2))]
+    /// struct Packet<B: ?Sized> {
+    ///     length: u16,
+    ///     body: B,
+    /// }
+    ///
+    /// let packet: &Packet<[u8]> = &Packet { length: 4, body: [1u8, 2, 3, 4, 5, 6, 7, 8, 9] };
+    ///
+    /// if let Some(split) = packet.split_at(packet.length as usize) {
+    ///     let _ = split.via_no_dynamic_padding(); // ⚠ Compile Error!
+    /// } else {
+    ///     unreachable!("The packet's length field is within its body");
+    /// }
     /// ```
     ///
-    #[doc = codegen_header!("h5", "split_via_unaligned")]
+    /// If you need to split such types, use [`Self::via_runtime_check`].
+    ///
+    #[doc = codegen_header!("h5", "split_via_no_dynamic_padding")]
     ///
     /// See [`Split::via_immutable`](#method.split_via_immutable.codegen).
     #[must_use = "has no side effects"]
     #[inline(always)]
-    pub fn via_unaligned(self) -> (&'a T, &'a [T::Elem])
-    where
-        T: Unaligned,
-    {
-        let (l, r) = self.into_ptr().via_unaligned();
+    pub fn via_no_dynamic_padding(self) -> (&'a T, &'a [T::Elem]) {
+        let (l, r) = self.into_ptr().via_no_dynamic_padding();
         (l.as_ref(), r.as_ref())
     }
 
     /// Produces the split parts of `self`, using a dynamic check to ensure that
     /// it is sound to have concurrent references to both parts. You should
     /// prefer using [`Self::via_immutable`], [`Self::via_into_bytes`], or
-    /// [`Self::via_unaligned`], which have no runtime cost.
+    /// [`Self::via_no_dynamic_padding`], which perform no runtime check.
     ///
     /// Note that this check is overly conservative if `T` is [`Immutable`]; for
     /// some types, this check will reject some splits which
@@ -484,52 +585,40 @@ pub fn via_unaligned(self) -> (&'a T, &'a [T::Elem])
     /// # Examples
     ///
     /// ```
-    /// use zerocopy::{SplitAt, FromBytes, IntoBytes, network_endian::U16};
+    /// use zerocopy::SplitAt;
     /// # use zerocopy_derive::*;
     ///
-    /// #[derive(SplitAt, FromBytes, KnownLayout, Immutable, Debug)]
+    /// #[derive(SplitAt, KnownLayout)]
     /// #[repr(C, align(2))]
-    /// struct Packet {
-    ///     length: U16,
-    ///     body: [u8],
+    /// struct Packet<B: ?Sized> {
+    ///     length: u16,
+    ///     body: B,
     /// }
     ///
-    /// // These bytes encode a `Packet`.
-    /// let bytes = [
-    ///     4u16.to_be(),
-    ///     1u16.to_be(),
-    ///     2u16.to_be(),
-    ///     3u16.to_be(),
-    ///     4u16.to_be()
-    /// ];
-    ///
-    /// let packet = Packet::ref_from_bytes(bytes.as_bytes()).unwrap();
+    /// let packet: &Packet<[u8]> = &Packet { length: 4, body: [1u8, 2, 3, 4, 5, 6, 7, 8, 9] };
     ///
     /// assert_eq!(packet.length, 4);
-    /// assert_eq!(packet.body, [0, 1, 0, 2, 0, 3, 0, 4]);
-    ///
-    /// // Attempt to split `packet` at `length`.
-    /// let split = packet.split_at(packet.length.into()).unwrap();
+    /// assert_eq!(packet.body, [1, 2, 3, 4, 5, 6, 7, 8, 9]);
     ///
-    /// // Use a dynamic check to prove that it's okay to return concurrent
-    /// // references to `packet` and `rest`.
-    /// let (packet, rest) = split.via_runtime_check().unwrap();
+    /// // The two-byte prefix and four-byte body need no trailing padding.
+    /// if let Some(split) = packet.split_at(packet.length as usize) {
+    ///     if let Ok((packet, rest)) = split.via_runtime_check() {
+    ///         assert_eq!(packet.length, 4);
+    ///         assert_eq!(packet.body, [1, 2, 3, 4]);
+    ///         assert_eq!(rest, [5, 6, 7, 8, 9]);
+    ///     } else {
+    ///         unreachable!("A four-byte body requires no trailing padding");
+    ///     }
+    /// } else {
+    ///     unreachable!("The packet's length field is within its body");
+    /// }
     ///
-    /// assert_eq!(packet.length, 4);
-    /// assert_eq!(packet.body, [0, 1, 0, 2]);
-    /// assert_eq!(rest, [0, 3, 0, 4]);
-    ///
-    /// // Attempt to split `packet` at `length - 1`.
-    /// let idx = packet.length.get() - 1;
-    /// let split = packet.split_at(idx as usize).unwrap();
-    ///
-    /// // Attempt (and fail) to use a dynamic check to prove that it's okay
-    /// // to return concurrent references to `packet` and `rest`. Note that
-    /// // this is a case of `via_runtime_check` being overly conservative.
-    /// // Although the left and right parts indeed overlap, the `Immutable`
-    /// // bound ensures that concurrently referencing these overlapping
-    /// // parts is sound.
-    /// assert!(split.via_runtime_check().is_err());
+    /// // A three-byte body needs a padding byte that would overlap `rest`.
+    /// if let Some(split) = packet.split_at((packet.length - 1) as usize) {
+    ///     assert!(split.via_runtime_check().is_err());
+    /// } else {
+    ///     unreachable!("One less than the packet's length is within its body");
+    /// }
     /// ```
     ///
     #[doc = codegen_section!(
@@ -602,7 +691,7 @@ impl<'a, T> Split<&'a mut T>
     T: ?Sized + SplitAt,
 {
     #[inline(always)]
-    fn into_ptr(self) -> Split<Ptr<'a, T, (Exclusive, Aligned, Valid)>> {
+    fn into_ptr(self) -> Split<Ptr<'a, T, (Exclusive, Aligned, Safe)>> {
         let source = Ptr::from_mut(self.source);
         // SAFETY: `Ptr::from_mut(self.source)` points to exactly `self.source`,
         // and thus maintains the invariants of `self` with respect to `l_len`.
@@ -665,101 +754,135 @@ pub fn via_into_bytes(self) -> (&'a mut T, &'a mut [T::Elem])
         (l.as_mut(), r.as_mut())
     }
 
-    /// Produces the split parts of `self`, using [`Unaligned`] to ensure that
-    /// it is sound to have concurrent references to both parts.
+    /// Produces the split parts of `self` using [`Self::via_no_dynamic_padding`].
+    #[deprecated(note = "use `Split::via_no_dynamic_padding` instead")]
+    #[doc(hidden)]
+    #[must_use = "has no side effects"]
+    #[inline(always)]
+    pub fn via_unaligned(self) -> (&'a mut T, &'a mut [T::Elem])
+    where
+        T: Unaligned,
+    {
+        self.via_no_dynamic_padding()
+    }
+
+    /// Produces the split parts of `self` using a compile-time assertion to
+    /// ensure that it is unconditionally sound to have concurrent references to
+    /// both parts.
+    ///
+    /// When possible, you should prefer using [`Self::via_into_bytes`], which
+    /// ensures this safety property through regular trait bounds.
     ///
     /// # Examples
     ///
+    /// In the below example, a single byte of padding exists (on most
+    /// platforms) between `Packet<[u16]>`'s `length` and `body` fields,
+    /// precluding the use of [`Self::via_into_bytes`].
+    ///
     /// ```
-    /// use zerocopy::{SplitAt, FromBytes};
+    /// use zerocopy::SplitAt;
     /// # use zerocopy_derive::*;
     ///
-    /// #[derive(SplitAt, FromBytes, KnownLayout, IntoBytes, Unaligned)]
+    /// #[derive(SplitAt, KnownLayout)]
     /// #[repr(C)]
     /// struct Packet<B: ?Sized> {
     ///     length: u8,
     ///     body: B,
     /// }
     ///
-    /// // These bytes encode a `Packet`.
-    /// let mut bytes = &mut [4, 1, 2, 3, 4, 5, 6, 7, 8, 9][..];
-    ///
-    /// let packet = Packet::<[u8]>::mut_from_bytes(bytes).unwrap();
+    /// let packet: &mut Packet<[u16]> = &mut Packet { length: 4, body: [1u16, 2, 3, 4, 5, 6, 7, 8, 9] };
     ///
     /// assert_eq!(packet.length, 4);
     /// assert_eq!(packet.body, [1, 2, 3, 4, 5, 6, 7, 8, 9]);
     ///
-    /// {
-    ///     // Attempt to split `packet` at `length`.
-    ///     let split = packet.split_at_mut(packet.length as usize).unwrap();
-    ///
-    ///     // Use the `Unaligned` bound on `Packet` to prove that it's okay to
-    ///     // return concurrent references to `packet` and `rest`.
-    ///     let (packet, rest) = split.via_unaligned();
-    ///
+    /// // Every body length requires no trailing padding.
+    /// if let Some(split) = packet.split_at_mut(packet.length as usize) {
+    ///     let (packet, rest) = split.via_no_dynamic_padding();
     ///     assert_eq!(packet.length, 4);
     ///     assert_eq!(packet.body, [1, 2, 3, 4]);
     ///     assert_eq!(rest, [5, 6, 7, 8, 9]);
-    ///
     ///     rest.fill(0);
+    /// } else {
+    ///     unreachable!("The packet's length field is within its body");
     /// }
     ///
     /// assert_eq!(packet.length, 4);
     /// assert_eq!(packet.body, [1, 2, 3, 4, 0, 0, 0, 0, 0]);
     /// ```
     ///
+    /// # Compile-Time Assertions
+    ///
+    /// This method rejects at compile-time any type that admits dynamic
+    /// trailing padding. In the below example, some `split_at` indices would
+    /// produce left parts whose trailing padding overlaps with the right part:
+    ///
+    /// ```compile_fail,E0080
+    /// use zerocopy::SplitAt;
+    /// # use zerocopy_derive::*;
+    ///
+    /// #[derive(SplitAt, KnownLayout)]
+    /// #[repr(C, align(2))]
+    /// struct Packet<B: ?Sized> {
+    ///     length: u16,
+    ///     body: B,
+    /// }
+    ///
+    /// let packet: &mut Packet<[u8]> = &mut Packet { length: 4, body: [1u8, 2, 3, 4, 5, 6, 7, 8, 9] };
+    ///
+    /// if let Some(split) = packet.split_at_mut(packet.length as usize) {
+    ///     let _ = split.via_no_dynamic_padding(); // ⚠ Compile Error!
+    /// } else {
+    ///     unreachable!("The packet's length field is within its body");
+    /// }
+    /// ```
+    ///
+    /// If you need to split such types, use [`Self::via_runtime_check`].
+    ///
     /// # Code Generation
     ///
     /// See [`Split::via_immutable`](#method.split_via_immutable.codegen).
     #[must_use = "has no side effects"]
     #[inline(always)]
-    pub fn via_unaligned(self) -> (&'a mut T, &'a mut [T::Elem])
-    where
-        T: Unaligned,
-    {
-        let (l, r) = self.into_ptr().via_unaligned();
+    pub fn via_no_dynamic_padding(self) -> (&'a mut T, &'a mut [T::Elem]) {
+        let (l, r) = self.into_ptr().via_no_dynamic_padding();
         (l.as_mut(), r.as_mut())
     }
 
     /// Produces the split parts of `self`, using a dynamic check to ensure that
     /// it is sound to have concurrent references to both parts. You should
-    /// prefer using [`Self::via_into_bytes`] or [`Self::via_unaligned`], which
-    /// have no runtime cost.
+    /// prefer using [`Self::via_into_bytes`] or
+    /// [`Self::via_no_dynamic_padding`], which perform no runtime check.
     ///
     /// # Examples
     ///
     /// ```
-    /// use zerocopy::{SplitAt, FromBytes};
+    /// use zerocopy::SplitAt;
     /// # use zerocopy_derive::*;
     ///
-    /// #[derive(SplitAt, FromBytes, KnownLayout, IntoBytes, Debug)]
-    /// #[repr(C)]
+    /// #[derive(SplitAt, KnownLayout)]
+    /// #[repr(C, align(2))]
     /// struct Packet<B: ?Sized> {
-    ///     length: u8,
+    ///     length: u16,
     ///     body: B,
     /// }
     ///
-    /// // These bytes encode a `Packet`.
-    /// let mut bytes = &mut [4, 1, 2, 3, 4, 5, 6, 7, 8, 9][..];
-    ///
-    /// let packet = Packet::<[u8]>::mut_from_bytes(bytes).unwrap();
+    /// let packet: &mut Packet<[u8]> = &mut Packet { length: 4, body: [1u8, 2, 3, 4, 5, 6, 7, 8, 9] };
     ///
     /// assert_eq!(packet.length, 4);
     /// assert_eq!(packet.body, [1, 2, 3, 4, 5, 6, 7, 8, 9]);
     ///
-    /// {
-    ///     // Attempt to split `packet` at `length`.
-    ///     let split = packet.split_at_mut(packet.length as usize).unwrap();
-    ///
-    ///     // Use a dynamic check to prove that it's okay to return concurrent
-    ///     // references to `packet` and `rest`.
-    ///     let (packet, rest) = split.via_runtime_check().unwrap();
-    ///
-    ///     assert_eq!(packet.length, 4);
-    ///     assert_eq!(packet.body, [1, 2, 3, 4]);
-    ///     assert_eq!(rest, [5, 6, 7, 8, 9]);
-    ///
-    ///     rest.fill(0);
+    /// // The two-byte prefix and four-byte body need no trailing padding.
+    /// if let Some(split) = packet.split_at_mut(packet.length as usize) {
+    ///     if let Ok((packet, rest)) = split.via_runtime_check() {
+    ///         assert_eq!(packet.length, 4);
+    ///         assert_eq!(packet.body, [1, 2, 3, 4]);
+    ///         assert_eq!(rest, [5, 6, 7, 8, 9]);
+    ///         rest.fill(0);
+    ///     } else {
+    ///         unreachable!("A four-byte body requires no trailing padding");
+    ///     }
+    /// } else {
+    ///     unreachable!("The packet's length field is within its body");
     /// }
     ///
     /// assert_eq!(packet.length, 4);
@@ -805,7 +928,7 @@ pub unsafe fn via_unchecked(self) -> (&'a mut T, &'a mut [T::Elem]) {
 impl<'a, T, I> Split<Ptr<'a, T, I>>
 where
     T: ?Sized + SplitAt,
-    I: Invariants<Alignment = Aligned, Validity = Valid>,
+    I: Invariants<Alignment = Aligned, Validity = Safe>,
 {
     fn into_ref(self) -> Split<&'a T>
     where
@@ -860,37 +983,57 @@ fn via_into_bytes(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>)
         unsafe { self.via_unchecked() }
     }
 
-    /// Produces the split parts of `self`, using [`Unaligned`] to ensure that
-    /// it is sound to have concurrent references to both parts.
+    /// Produces the split parts of `self` after the conservative layout
+    /// predicate establishes that `T` never requires dynamic trailing padding.
     #[inline(always)]
-    fn via_unaligned(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>)
-    where
-        T: Unaligned,
-    {
-        // SAFETY: By `T: SplitAt + Unaligned`, `T` is either a slice or a
-        // `repr(C)` or `repr(transparent)` slice DST that is well-aligned at
-        // any address and length. If `T` is a slice DST with alignment 1,
-        // `repr(C)` or `repr(transparent)` ensures that no padding is placed
-        // after the final element of the trailing slice. Consequently, `T` can
-        // be split into strictly non-overlapping parts any any index.
+    fn via_no_dynamic_padding(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>) {
+        static_assert!(
+            T: ?Sized + KnownLayout => !T::LAYOUT.requires_dynamic_padding(),
+            "`Split::via_no_dynamic_padding` cannot be used with a type whose layout may require dynamic trailing padding; use `Split::via_runtime_check` instead"
+        );
+
+        // SAFETY: The assertion establishes that `requires_dynamic_padding()`
+        // is false. By that method's guarantee, every valid metadata—including
+        // `self.l_len()`, which is valid by `Split`'s invariant—describes an
+        // object with no trailing padding. By the postcondition of
+        // `PtrInner::split_at_unchecked`, the two returned referents are then
+        // contiguous and non-overlapping. Since the source already conforms to
+        // `I::Aliasing`, splitting it into disjoint byte ranges preserves that
+        // invariant: under `Exclusive`, neither result aliases or accesses the
+        // other's bytes; under `Shared`, interior mutation through one result
+        // cannot mutate bytes pointed to by the other. This satisfies Rust's
+        // reference aliasing rules [1].
+        //
+        // [1] Per https://doc.rust-lang.org/1.93.1/std/ptr/index.html#pointer-to-reference-conversion:
+        //
+        //   When creating a mutable reference, then while this reference
+        //   exists, the memory it points to must not get accessed (read or
+        //   written) through any other pointer or reference not derived from
+        //   this reference.
+        //
+        //   When creating a shared reference, then while this reference
+        //   exists, the memory it points to must not get mutated (except inside
+        //   `UnsafeCell`).
         unsafe { self.via_unchecked() }
     }
 
     /// Produces the split parts of `self`, using a dynamic check to ensure that
     /// it is sound to have concurrent references to both parts. You should
     /// prefer using [`Self::via_immutable`], [`Self::via_into_bytes`], or
-    /// [`Self::via_unaligned`], which have no runtime cost.
+    /// [`Self::via_no_dynamic_padding`], which perform no runtime check.
     #[inline(always)]
     fn via_runtime_check(self) -> Result<(Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>), Self> {
         let l_len = self.l_len();
+        // `l_len` witnesses an object size at most `isize::MAX`, and
+        // `KnownLayout::LAYOUT` guarantees that it contains the trailing
+        // slice. Thus `padding_for_elems` returns the exact trailing padding.
+        let trailing_padding = crate::trailing_slice_layout::<T>().padding_for_elems(l_len.get());
         // FIXME(#1290): Once we require `KnownLayout` on all fields, add an
         // `IS_IMMUTABLE` associated const, and add `T::IS_IMMUTABLE ||` to the
         // below check.
-        if l_len.padding_needed_for() == 0 {
-            // SAFETY: By `T: SplitAt`, `T` is either `[T]`, or a `repr(C)` or
-            // `repr(transparent)` slice DST, for which the trailing padding
-            // needed to accommodate `l_len` trailing elements is
-            // `l_len.padding_needed_for()`. If no trailing padding is required,
+        if trailing_padding == 0 {
+            // SAFETY: As established above, `trailing_padding` is the exact
+            // padding after the left part's trailing slice. If it is zero,
             // the left and right parts are strictly non-overlapping.
             Ok(unsafe { self.via_unchecked() })
         } else {
@@ -903,7 +1046,7 @@ fn via_runtime_check(self) -> Result<(Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>), Sel
     /// # Safety
     ///
     /// The caller promises that if `I::Aliasing` is [`Exclusive`] or `T`
-    /// permits interior mutation, then `l_len.padding_needed_for() == 0`.
+    /// permits interior mutation, then the left part has no trailing padding.
     #[inline(always)]
     unsafe fn via_unchecked(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>) {
         let l_len = self.l_len();
@@ -915,11 +1058,11 @@ unsafe fn via_unchecked(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>) {
 
         // Lemma 0: `left` and `right` conform to the aliasing invariant
         // `I::Aliasing`. Proof: If `I::Aliasing` is `Exclusive` or `T` permits
-        // interior mutation, the caller promises that `l_len.padding_needed_for()
-        // == 0`. Consequently, by post-condition on `PtrInner::split_at_unchecked`,
-        // there is no trailing padding after `left`'s final element that would
-        // overlap into `right`. If `I::Aliasing` is shared and `T` forbids interior
-        // mutation, then overlap between their referents is permissible.
+        // interior mutation, the caller promises that the left part has no
+        // trailing padding. Consequently, by the postcondition of
+        // `PtrInner::split_at_unchecked`, `left` and `right` do not overlap.
+        // If `I::Aliasing` is shared and `T` forbids interior mutation, then
+        // overlap between their referents is permissible.
 
         // SAFETY:
         // 0. `left` conforms to the aliasing invariant of `I::Aliasing`, by Lemma 0.
@@ -933,17 +1076,19 @@ unsafe fn via_unchecked(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>) {
         // SAFETY:
         // 0. `right` conforms to the aliasing invariant of `I::Aliasing`, by Lemma
         //    0.
-        // 1. `right` conforms to the alignment invariant of `I::Alignment, because
-        //    if `ptr` with `I::Alignment = Aligned`, then by invariant on `T:
-        //    SplitAt`, the trailing slice of `ptr` (from which `right` is derived)
-        //    will also be well-aligned.
+        // 1. `right` conforms to the alignment invariant of `I::Alignment`:
+        //    if the source is aligned, `T: SplitAt` guarantees that its
+        //    trailing slice's address is aligned for `T::Elem`. Advancing by
+        //    whole elements preserves that alignment.
         // 2. `right` conforms to the validity invariant of `I::Validity`,
-        //    because `right: [T::Elem]` is derived from the trailing slice of
-        //    `ptr`, which, by contract on `T: SplitAt::Elem`, has type
-        //    `[T::Elem]`. The `left` part cannot be used to invalidate `right`,
-        //    because the caller promises that if `I::Aliasing` is `Exclusive`
-        //    or `T` permits interior mutation, then `l_len.padding_needed_for()
-        //    == 0` and thus the parts will be non-overlapping.
+        //    because `T: SplitAt` guarantees that `T::Elem` has the size and
+        //    bit validity of the original trailing element. It also guarantees
+        //    compatible shared and mutable access, so writes through `right`
+        //    preserve the original elements' validity and interior mutation
+        //    respects the original `UnsafeCell` coverage. The left part
+        //    cannot invalidate `right`: when the references are exclusive or
+        //    permit interior mutation, the caller guarantees no trailing
+        //    padding and hence no overlap.
         let right = unsafe { Ptr::from_inner(right) };
 
         (left, right)
@@ -952,6 +1097,185 @@ unsafe fn via_unchecked(self) -> (Ptr<'a, T, I>, Ptr<'a, [T::Elem], I>) {
 
 #[cfg(test)]
 mod tests {
+    use core::{cell::Cell, mem::ManuallyDrop};
+
+    use crate::{Immutable, KnownLayout, SplitAt, Unalign, Unaligned};
+
+    #[derive(KnownLayout, SplitAt, Immutable, Unaligned)]
+    #[repr(C, packed)]
+    struct Packed<T: ?Sized> {
+        prefix: u8,
+        tail: ManuallyDrop<T>,
+    }
+
+    #[derive(KnownLayout, SplitAt, Immutable)]
+    #[repr(C, packed(2))]
+    struct Packed2<T: ?Sized> {
+        prefix: u8,
+        tail: ManuallyDrop<T>,
+    }
+
+    #[derive(KnownLayout, SplitAt, Immutable)]
+    #[repr(C)]
+    struct Inner<T: ?Sized> {
+        prefix: u32,
+        tail: T,
+    }
+
+    #[test]
+    fn test_split_at_packed() {
+        use crate::{FromBytes, IntoBytes};
+
+        #[derive(FromBytes, IntoBytes, KnownLayout, SplitAt, Immutable, Unaligned)]
+        #[repr(C, packed)]
+        struct Packet {
+            prefix: u8,
+            tail: [u16],
+        }
+
+        // The tail starts at an odd address, exercising unaligned reads and
+        // writes on targets where `u16` has alignment 2.
+        #[repr(align(8))]
+        struct Bytes([u8; 9]);
+
+        for i in 0..=4 {
+            let mut bytes = Bytes([1; 9]);
+            let packet = Packet::ref_from_bytes(&bytes.0).unwrap();
+            let (left, right): (&Packet, &[Unalign<u16>]) =
+                packet.split_at(i).unwrap().via_immutable();
+            assert_eq!(core::mem::size_of_val(left), 1 + 2 * i);
+            assert_eq!(right.len(), 4 - i);
+            assert!(right.iter().all(|elem| elem.get() == 0x0101));
+            assert!(left.split_at(i).is_some());
+            assert!(left.split_at(i + 1).is_none());
+            assert!(packet.split_at(5).is_none());
+
+            let (_, right) = packet.split_at(i).unwrap().via_into_bytes();
+            assert_eq!(right.len(), 4 - i);
+            let (_, right) = packet.split_at(i).unwrap().via_no_dynamic_padding();
+            assert_eq!(right.len(), 4 - i);
+
+            let packet = Packet::mut_from_bytes(&mut bytes.0).unwrap();
+            let (left, right): (&mut Packet, &mut [Unalign<u16>]) =
+                packet.split_at_mut(i).unwrap().via_runtime_check().ok().unwrap();
+            left.prefix = 2;
+            for elem in right {
+                *elem = Unalign::new(0x0202);
+            }
+            assert_eq!(bytes.0[0], 2);
+            assert!(bytes.0[1..1 + 2 * i].iter().all(|&byte| byte == 1));
+            assert!(bytes.0[1 + 2 * i..].iter().all(|&byte| byte == 2));
+        }
+    }
+
+    #[test]
+    fn test_split_at_nested_packed() {
+        // A packing factor greater than 1 still exposes `Unalign` elements,
+        // including when the factor is below the original element alignment.
+        let mut words = Packed2 { prefix: 0, tail: ManuallyDrop::new([1u32, 2, 3]) };
+        let dst: &mut Packed2<[u32]> = &mut words;
+        let (left, right): (&mut _, &mut [Unalign<u32>]) =
+            dst.split_at_mut(1).unwrap().via_no_dynamic_padding();
+        left.prefix = 4;
+        right[0] = Unalign::new(5);
+        let dst: &Packed2<[u32]> = &words;
+        let (left, right) = dst.split_at(0).unwrap().via_immutable();
+        assert_eq!(left.prefix, 4);
+        assert_eq!(right[0].get(), 1);
+        assert_eq!(right[1].get(), 5);
+        assert_eq!(right[2].get(), 3);
+
+        let mut packet = Inner {
+            prefix: 0,
+            tail: Packed2 {
+                prefix: 1,
+                tail: ManuallyDrop::new(Packed {
+                    prefix: 2,
+                    tail: ManuallyDrop::new([3u16, 4, 5]),
+                }),
+            },
+        };
+        let dst: &Inner<Packed2<Packed<[u16]>>> = &packet;
+        let (left, right): (&_, &[Unalign<Unalign<u16>>]) =
+            dst.split_at(1).unwrap().via_immutable();
+        assert_eq!(left.prefix, 0);
+        assert_eq!(right.len(), 2);
+        assert_eq!(right[0].get().get(), 4);
+        assert_eq!(right[1].get().get(), 5);
+
+        // Split the packed field separately: the unpacked outer struct's
+        // padding does not constrain this split.
+        let dst: &mut Packed2<Packed<[u16]>> = &mut packet.tail;
+        let (left, right): (&mut _, &mut [Unalign<Unalign<u16>>]) =
+            dst.split_at_mut(1).unwrap().via_no_dynamic_padding();
+        left.prefix = 6;
+        right[0] = Unalign::new(Unalign::new(7));
+        let dst: &Inner<Packed2<Packed<[u16]>>> = &packet;
+        let (_, right) = dst.split_at(0).unwrap().via_immutable();
+        assert_eq!(right[0].get().get(), 3);
+        assert_eq!(right[1].get().get(), 7);
+        assert_eq!(right[2].get().get(), 5);
+    }
+
+    #[test]
+    fn test_split_at_packed_preserves_inner_padding() {
+        for i in 0..=4 {
+            let mut packet = Packed {
+                prefix: 1,
+                tail: ManuallyDrop::new(Inner { prefix: 0, tail: [2u8, 3, 4, 5] }),
+            };
+            let dst: &Packed<Inner<[u8]>> = &packet;
+            let (left, right): (&_, &[Unalign<u8>]) = dst.split_at(i).unwrap().via_immutable();
+            assert_eq!(right.len(), 4 - i);
+            assert_eq!(right.first().map(Unalign::get), [2, 3, 4, 5].get(i).copied());
+
+            // The inner `u32` prefix makes the tail start at byte 5 of the
+            // packed wrapper. Its size may still include inner padding.
+            let has_padding = core::mem::size_of_val(left) != 5 + i;
+            assert_eq!(dst.split_at(i).unwrap().via_runtime_check().is_err(), has_padding);
+
+            let dst: &mut Packed<Inner<[u8]>> = &mut packet;
+            let split = dst.split_at_mut(i).unwrap().via_runtime_check();
+            assert_eq!(split.is_err(), has_padding);
+            if let Ok((left, right)) = split {
+                left.prefix = 6;
+                for elem in right {
+                    *elem = Unalign::new(7);
+                }
+                let dst: &Packed<Inner<[u8]>> = &packet;
+                let (left, right) = dst.split_at(i).unwrap().via_immutable();
+                assert_eq!(left.prefix, 6);
+                assert!(right.iter().all(|elem| elem.get() == 7));
+            }
+        }
+    }
+
+    #[test]
+    fn test_split_at_packed_interior_mutation_and_zsts() {
+        let packet = Packed {
+            prefix: 0,
+            tail: ManuallyDrop::new([Cell::new(1u8), Cell::new(2), Cell::new(3)]),
+        };
+        let dst: &Packed<[Cell<u8>]> = &packet;
+        let (left, right): (&_, &[Unalign<Cell<u8>>]) =
+            dst.split_at(1).unwrap().via_no_dynamic_padding();
+        left.tail[0].set(4);
+        right[0].try_deref().unwrap().set(5);
+        assert_eq!(dst.tail[0].get(), 4);
+        assert_eq!(dst.tail[1].get(), 5);
+        assert_eq!(dst.tail[2].get(), 3);
+
+        let mut packet = Packed { prefix: 0, tail: ManuallyDrop::new([(); 3]) };
+        for i in 0..=3 {
+            let dst: &mut Packed<[()]> = &mut packet;
+            let (left, right): (&mut _, &mut [Unalign<()>]) =
+                dst.split_at_mut(i).unwrap().via_no_dynamic_padding();
+            assert_eq!(left.tail.len(), i);
+            assert_eq!(right.len(), 3 - i);
+            assert_eq!(core::mem::size_of_val(left), 1);
+        }
+    }
+
     #[cfg(feature = "derive")]
     #[test]
     fn test_split_at() {
@@ -1011,6 +1335,8 @@ struct SliceDst {
             trailing: [u8],
         }
 
+        assert!(SliceDst::LAYOUT.requires_dynamic_padding());
+
         const N: usize = 16;
 
         let arr = [1u16; N];
@@ -1070,21 +1396,79 @@ struct Packet {
         assert_eq!(r, &[4]);
     }
     #[test]
+    #[allow(deprecated)]
     fn test_split_at_via_unaligned() {
-        use crate::{FromBytes, Immutable, IntoBytes, KnownLayout, SplitAt, Unaligned};
-        #[derive(FromBytes, KnownLayout, SplitAt, IntoBytes, Immutable, Unaligned)]
+        use crate::{Immutable, KnownLayout, Split, SplitAt, Unaligned};
+
+        fn via_unaligned<'a, T>(split: Split<&'a T>) -> (&'a T, &'a [T::Elem])
+        where
+            T: ?Sized + SplitAt + Unaligned,
+        {
+            split.via_unaligned()
+        }
+
+        fn via_unaligned_mut<'a, T>(split: Split<&'a mut T>) -> (&'a mut T, &'a mut [T::Elem])
+        where
+            T: ?Sized + SplitAt + Unaligned,
+        {
+            split.via_unaligned()
+        }
+
+        #[derive(KnownLayout, SplitAt, Immutable, Unaligned)]
         #[repr(C)]
-        struct Packet {
-            length: u8,
-            body: [u8],
+        struct Packet<B: ?Sized> {
+            prefix: [u8; 2],
+            body: B,
         }
 
-        let arr = [1, 2, 3, 4];
-        let packet = Packet::ref_from_bytes(&arr[..]).unwrap();
+        // Exercise generic callers using the original `T: Unaligned` bound.
+        assert!(!Packet::<[[u8; 2]]>::LAYOUT.requires_dynamic_padding());
+        let packet = Packet { prefix: [0, 1], body: [[2, 3], [4, 5], [6, 7]] };
+        let packet: &Packet<[[u8; 2]]> = &packet;
 
         let split = packet.split_at(2).unwrap();
-        let (l, r) = split.via_unaligned();
-        assert_eq!(l.length, 1);
-        assert_eq!(r, &[4]);
+        let (l, r) = via_unaligned(split);
+        assert_eq!(l.body, [[2, 3], [4, 5]]);
+        assert_eq!(r, &[[6, 7]]);
+
+        let mut packet = Packet { prefix: [0, 1], body: [[2, 3], [4, 5], [6, 7]] };
+        {
+            let packet: &mut Packet<[[u8; 2]]> = &mut packet;
+            let split = packet.split_at_mut(2).unwrap();
+            let (l, r) = via_unaligned_mut(split);
+            l.body[0] = [8, 9];
+            r[0] = [10, 11];
+        }
+        assert_eq!(packet.body, [[8, 9], [4, 5], [10, 11]]);
+    }
+
+    #[test]
+    fn test_split_at_via_no_dynamic_padding() {
+        use core::cell::Cell;
+
+        use crate::SplitAt;
+
+        // `u16` does not implement `Unaligned`, but `[u16]` never requires
+        // dynamic trailing padding.
+        let words = [1u16, 2, 3, 4];
+        let split = SplitAt::split_at(&words[..], 2).unwrap();
+        let (left, right) = split.via_no_dynamic_padding();
+        assert_eq!(left, [1, 2]);
+        assert_eq!(right, [3, 4]);
+
+        let mut words = [1u16, 2, 3, 4];
+        let split = SplitAt::split_at_mut(&mut words[..], 2).unwrap();
+        let (left, right) = split.via_no_dynamic_padding();
+        left[0] = 5;
+        right[0] = 6;
+        assert_eq!(words, [5, 2, 6, 4]);
+
+        // Exercise the safety-sensitive shared route with interior mutation.
+        let cells = [Cell::new(1u16), Cell::new(2), Cell::new(3)];
+        let split = SplitAt::split_at(&cells[..], 2).unwrap();
+        let (left, right) = split.via_no_dynamic_padding();
+        left[0].set(4);
+        right[0].set(5);
+        assert_eq!([cells[0].get(), cells[1].get(), cells[2].get()], [4, 2, 5]);
     }
 }
diff --git a/rust/zerocopy/src/util/macro_util.rs b/rust/zerocopy/src/util/macro_util.rs
index ceeb80432b0b..fdcaa58d418c 100644
--- a/rust/zerocopy/src/util/macro_util.rs
+++ b/rust/zerocopy/src/util/macro_util.rs
@@ -28,8 +28,8 @@
 
 use crate::{
     pointer::{
-        cast::CastSized,
-        invariant::{Aligned, Initialized, Valid},
+        cast::CastSizedExact,
+        invariant::{Aligned, Initialized, Safe},
         BecauseImmutable,
     },
     FromBytes, Immutable, IntoBytes, KnownLayout, Ptr, ReadOnly, TryFromBytes, ValidityError,
@@ -518,9 +518,9 @@ pub const fn hash_name(name: &str) -> i128 {
 ///
 /// `try_transmute` may either produce a post-monomorphization error or a panic
 /// if `Dst` is bigger than `Src`. Otherwise, `try_transmute` panics under the
-/// same circumstances as [`is_bit_valid`].
+/// same circumstances as [`is_safe`].
 ///
-/// [`is_bit_valid`]: TryFromBytes::is_bit_valid
+/// [`is_safe`]: TryFromBytes::is_safe
 #[inline(always)]
 pub fn try_transmute<Src, Dst>(src: Src) -> Result<Dst, ValidityError<Src, Dst>>
 where
@@ -529,30 +529,64 @@ pub fn try_transmute<Src, Dst>(src: Src) -> Result<Dst, ValidityError<Src, Dst>>
 {
     static_assert!(Src, Dst => mem::size_of::<Dst>() == mem::size_of::<Src>());
 
-    let mu_src = mem::MaybeUninit::new(src);
-    // SAFETY: `MaybeUninit` has no validity requirements.
-    let mu_dst: mem::MaybeUninit<ReadOnly<Dst>> =
-        unsafe { crate::util::transmute_unchecked(mu_src) };
-
-    let ptr = Ptr::from_ref(&mu_dst);
-
-    // SAFETY: Since `Src: IntoBytes`, and since `size_of::<Src>() ==
-    // size_of::<Dst>()` by the preceding assertion, all of `mu_dst`'s bytes are
-    // initialized. `MaybeUninit` has no validity requirements, so even if
-    // `ptr` is used to mutate its referent (which it actually can't be - it's
-    // a shared `ReadOnly` pointer), that won't violate its referent's validity.
-    let ptr = unsafe { ptr.assume_validity::<Initialized>() };
-    if Dst::is_bit_valid(ptr.cast::<_, CastSized, _>()) {
-        // SAFETY: Since `Dst::is_bit_valid`, we know that `ptr`'s referent is
-        // bit-valid for `Dst`. `ptr` points to `mu_dst`, and no intervening
-        // operations have mutated it, so it is a bit-valid `Dst`.
-        Ok(ReadOnly::into_inner(unsafe { mu_dst.assume_init() }))
+    let src = mem::ManuallyDrop::new(ReadOnly::new(src));
+    let mut ptr =
+        Ptr::from_ref(&*src).transmute_with::<ReadOnly<Dst>, Initialized, CastSizedExact, _>();
+    if Dst::is_safe(ptr.reborrow_shared()) {
+        // SAFETY: `read_unaligned` requires that `ptr` be valid for reads and
+        // point to a properly initialized `ReadOnly<Dst>` [1]. `ptr` was
+        // derived from a live reference to `src`; `CastSizedExact` preserves
+        // that reference's address, provenance, and exact byte extent. Thus,
+        // the entire range remains live and valid for reads. The reference is
+        // non-null even when `ReadOnly<Dst>` is zero-sized, and the cast
+        // preserves that address, satisfying [1]'s explicit ZST requirement.
+        //
+        // `Src: IntoBytes` and the `ReadOnly<Src>` bridge let `transmute_with`
+        // establish that every byte in that exact range is initialized.
+        // `Dst::is_safe` then established that the same bytes are bit-valid for
+        // `Dst`, and thus for `ReadOnly<Dst>`. The candidate was a shared
+        // `ReadOnly` pointer, so it could not mutate the bytes; no operation
+        // occurs between validation and this read which could do so. Alignment
+        // is not an additional precondition because [1] expressly permits
+        // unaligned pointers.
+        //
+        // `read_unaligned` leaves the source memory unchanged and makes a
+        // bitwise copy [1]. The source is wrapped in `ManuallyDrop`, which
+        // inhibits its destructor [2]. After this read, neither `src` nor
+        // `ptr` is used to access the inner value, and the wrapper's eventual
+        // drop does not drop it. Thus, only the returned `Dst` is subsequently
+        // used or dropped; there is no duplicate ownership use.
+        //
+        // [1] Per https://doc.rust-lang.org/1.56.0/std/ptr/fn.read_unaligned.html:
+        //
+        //     Reads the value from `src` without moving it. This leaves the
+        //     memory in `src` unchanged.
+        //
+        //     Unlike `read`, `read_unaligned` works with unaligned pointers.
+        //
+        //     Behavior is undefined if any of the following conditions are
+        //     violated:
+        //
+        //     * `src` must be valid for reads.
+        //
+        //     * `src` must point to a properly initialized value of type `T`.
+        //
+        //     Like `read`, `read_unaligned` creates a bitwise copy of `T`,
+        //     regardless of whether `T` is `Copy`. If `T` is not `Copy`, using
+        //     both the returned value and the value at `*src` can violate
+        //     memory safety.
+        //
+        //     Note that even if `T` has size `0`, the pointer must be non-null.
+        //
+        // [2] Per https://doc.rust-lang.org/1.56.0/std/mem/struct.ManuallyDrop.html:
+        //
+        //     A wrapper to inhibit compiler from automatically calling `T`'s
+        //     destructor.
+        let dst = unsafe { core::ptr::read_unaligned(ptr.as_inner().as_ptr()) };
+        Ok(ReadOnly::into_inner(dst))
     } else {
-        // SAFETY: `MaybeUninit` has no validity requirements.
-        let mu_src: mem::MaybeUninit<Src> = unsafe { crate::util::transmute_unchecked(mu_dst) };
-        // SAFETY: `mu_dst`/`mu_src` was constructed from `src` and never
-        // modified, so it is still bit-valid.
-        Err(ValidityError::new(unsafe { mu_src.assume_init() }))
+        let src = ReadOnly::into_inner(mem::ManuallyDrop::into_inner(src));
+        Err(ValidityError::new(src))
     }
 }
 
@@ -599,7 +633,7 @@ fn try_transmute_ref(
         let res = ptr.try_with(#[inline(always)] |ptr| {
             let ptr = ptr.recall_validity::<Initialized, _>();
             let ptr = ptr.cast::<_, crate::layout::CastFrom<Dst>, _>();
-            ptr.try_into_valid()
+            ptr.try_into_safe()
         });
         match res {
             Ok(ptr) => {
@@ -662,7 +696,7 @@ fn try_transmute_mut(
             ptr.try_with_unchecked(#[inline(always)] |ptr| {
                 let ptr = ptr.recall_validity::<Initialized, (_, (_, _))>();
                 let ptr = ptr.cast::<_, crate::layout::CastFrom<Dst>, _>();
-                ptr.try_into_valid()
+                ptr.try_into_safe()
             })
         };
         match res {
@@ -878,7 +912,7 @@ fn transmute_ref(self) -> &'a Dst {
         let ptr = Ptr::from_ref(self.0)
             .recall_validity::<Initialized, _>()
             .transmute_with::<Dst, Initialized, crate::layout::CastFrom<Dst>, (crate::pointer::BecauseMutationCompatible, _)>()
-            .recall_validity::<Valid, _>();
+            .recall_validity::<Safe, _>();
 
         static_assert!(Src: ?Sized + KnownLayout, Dst: ?Sized + KnownLayout => {
             Src::LAYOUT.align.get() >= Dst::LAYOUT.align.get()
@@ -911,7 +945,7 @@ fn transmute_mut(self) -> &'a mut Dst {
         let ptr = Ptr::from_mut(self.0)
             .recall_validity::<Initialized, (_, (_, _))>()
             .transmute_with::<Dst, Initialized, crate::layout::CastFrom<Dst>, _>()
-            .recall_validity::<Valid, (_, (_, _))>();
+            .recall_validity::<Safe, (_, (_, _))>();
 
         static_assert!(Src: ?Sized + KnownLayout, Dst: ?Sized + KnownLayout => {
             Src::LAYOUT.align.get() >= Dst::LAYOUT.align.get()
@@ -946,6 +980,22 @@ pub mod mem {
     }
 }
 
+/// Projects `Self` to itself.
+///
+/// This is used by macros to have the compiler verify that two syntactically
+/// similar types actually resolve to the same type. The blanket implementation
+/// ensures that no other implementation can project a type to anything other
+/// than itself.
+#[doc(hidden)]
+pub trait Identity {
+    /// `Self`.
+    type Type: ?Sized;
+}
+
+impl<T: ?Sized> Identity for T {
+    type Type = T;
+}
+
 #[cfg(test)]
 mod tests {
     use core::num::NonZeroUsize;
diff --git a/rust/zerocopy/src/util/macros.rs b/rust/zerocopy/src/util/macros.rs
index 7e63e3a54fc4..e514407ceeaa 100644
--- a/rust/zerocopy/src/util/macros.rs
+++ b/rust/zerocopy/src/util/macros.rs
@@ -15,21 +15,20 @@
 /// The trait impl must be sound.
 ///
 /// When implementing `TryFromBytes`:
-/// - If no `is_bit_valid` impl is provided, then it must be valid for
-///   `is_bit_valid` to unconditionally return `true`. In other words, it must
-///   be the case that any initialized sequence of bytes constitutes a valid
-///   instance of `$ty`.
-/// - If an `is_bit_valid` impl is provided, then the impl of `is_bit_valid`
-///   must only return `true` if its argument refers to a valid `$ty`.
+/// - If no `is_safe` impl is provided, then it must be valid for `is_safe` to
+///   unconditionally return `true`. In other words, it must be the case that any
+///   initialized sequence of bytes constitutes a valid instance of `$ty`.
+/// - If an `is_safe` impl is provided, then the impl of `is_safe` must only
+///   return `true` if its argument refers to a valid `$ty`.
 macro_rules! unsafe_impl {
     // Implement `$trait` for `$ty` with no bounds.
-    ($(#[$attr:meta])* $ty:ty: $trait:ident $(; |$candidate:ident| $is_bit_valid:expr)?) => {{
+    ($(#[$attr:meta])* $ty:ty: $trait:ident $(; |$candidate:ident| $is_safe:expr)?) => {{
         crate::util::macros::__unsafe();
 
         $(#[$attr])*
         // SAFETY: The caller promises that this is sound.
         unsafe impl $trait for $ty {
-            unsafe_impl!(@method $trait $(; |$candidate| $is_bit_valid)?);
+            unsafe_impl!(@method $trait $(; |$candidate| $is_safe)?);
         }
     }};
 
@@ -92,26 +91,26 @@ unsafe impl $trait for $ty {
         $(#[$attr:meta])*
         const $constname:ident : $constty:ident $(,)?
         $($tyvar:ident $(: $(? $optbound:ident $(+)?)* $($bound:ident $(+)?)* )?),*
-        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_bit_valid:expr)?
+        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_safe:expr)?
     ) => {
         unsafe_impl!(
             @inner
             $(#[$attr])*
             @const $constname: $constty,
             $($tyvar $(: $(? $optbound +)* + $($bound +)*)?,)*
-            => $trait for $ty $(; |$candidate| $is_bit_valid)?
+            => $trait for $ty $(; |$candidate| $is_safe)?
         );
     };
     (
         $(#[$attr:meta])*
         $($tyvar:ident $(: $(? $optbound:ident $(+)?)* $($bound:ident $(+)?)* )?),*
-        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_bit_valid:expr)?
+        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_safe:expr)?
     ) => {{
         unsafe_impl!(
             @inner
             $(#[$attr])*
             $($tyvar $(: $(? $optbound +)* + $($bound +)*)?,)*
-            => $trait for $ty $(; |$candidate| $is_bit_valid)?
+            => $trait for $ty $(; |$candidate| $is_safe)?
         );
     }};
     (
@@ -119,7 +118,7 @@ unsafe impl $trait for $ty {
         $(#[$attr:meta])*
         $(@const $constname:ident : $constty:ident,)*
         $($tyvar:ident $(: $(? $optbound:ident +)* + $($bound:ident +)* )?,)*
-        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_bit_valid:expr)?
+        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_safe:expr)?
     ) => {{
         crate::util::macros::__unsafe();
 
@@ -127,21 +126,21 @@ unsafe impl $trait for $ty {
         #[allow(non_local_definitions)]
         // SAFETY: The caller promises that this is sound.
         unsafe impl<$($tyvar $(: $(? $optbound +)* $($bound +)*)?),* $(, const $constname: $constty,)*> $trait for $ty {
-            unsafe_impl!(@method $trait $(; |$candidate| $is_bit_valid)?);
+            unsafe_impl!(@method $trait $(; |$candidate| $is_safe)?);
         }
     }};
 
-    (@method TryFromBytes ; |$candidate:ident| $is_bit_valid:expr) => {
+    (@method TryFromBytes ; |$candidate:ident| $is_safe:expr) => {
         #[allow(clippy::missing_inline_in_public_items, dead_code)]
         #[cfg_attr(all(coverage_nightly, __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS), coverage(off))]
         fn only_derive_is_allowed_to_implement_this_trait() {}
 
         #[inline]
-        fn is_bit_valid<Alignment>($candidate: Maybe<'_, Self, Alignment>) -> bool
+        fn is_safe<Alignment>($candidate: Maybe<'_, Self, Alignment>) -> bool
         where
             Alignment: crate::invariant::Alignment,
         {
-            $is_bit_valid
+            $is_safe
         }
     };
     (@method TryFromBytes) => {
@@ -149,7 +148,7 @@ fn is_bit_valid<Alignment>($candidate: Maybe<'_, Self, Alignment>) -> bool
         #[cfg_attr(all(coverage_nightly, __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS), coverage(off))]
         fn only_derive_is_allowed_to_implement_this_trait() {}
         #[inline(always)]
-        fn is_bit_valid<Alignment>(_candidate: Maybe<'_, Self, Alignment>) -> bool
+        fn is_safe<Alignment>(_candidate: Maybe<'_, Self, Alignment>) -> bool
         where
             Alignment: crate::invariant::Alignment,
         {
@@ -161,16 +160,16 @@ fn is_bit_valid<Alignment>(_candidate: Maybe<'_, Self, Alignment>) -> bool
         #[cfg_attr(all(coverage_nightly, __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS), coverage(off))]
         fn only_derive_is_allowed_to_implement_this_trait() {}
     };
-    (@method $trait:ident; |$_candidate:ident| $_is_bit_valid:expr) => {
-        compile_error!("Can't provide `is_bit_valid` impl for trait other than `TryFromBytes`");
+    (@method $trait:ident; |$_candidate:ident| $_is_safe:expr) => {
+        compile_error!("Can't provide `is_safe` impl for trait other than `TryFromBytes`");
     };
 }
 
 /// Implements `$trait` for `$ty` where `$ty: TransmuteFrom<$repr>` (and
 /// vice-versa).
 ///
-/// Calling this macro is safe; the internals of the macro emit appropriate
-/// trait bounds which ensure that the given impl is sound.
+/// This macro is intended to be safe to call. The current proof is incomplete;
+/// see FIXME(#3691) below.
 macro_rules! impl_for_transmute_from {
     (
         $(#[$attr:meta])*
@@ -181,26 +180,32 @@ macro_rules! impl_for_transmute_from {
             $(#[$attr])*
             #[allow(non_local_definitions)]
 
-            // SAFETY: `is_trait<T, R>` (defined and used below) requires `T:
-            // TransmuteFrom<R>`, `R: TransmuteFrom<T>`, and `R: $trait`. It is
-            // called using `$ty` and `$repr`, ensuring that `$ty` and `$repr`
-            // have equivalent bit validity, and ensuring that `$repr: $trait`.
-            // The supported traits - `TryFromBytes`, `FromZeros`, `FromBytes`,
-            // and `IntoBytes` - are defined only in terms of the bit validity
-            // of a type. Therefore, `$repr: $trait` ensures that `$ty: $trait`
-            // is sound.
+            // SAFETY: `is_trait<T, R>` (defined and used below) requires
+            // reciprocal `TransmuteFrom<_, Safe, Safe>` bounds and `R: $trait`.
+            // If `T` and `R` have the same size, the reciprocal bounds imply
+            // that they permit the same `Safe` bit patterns. The call below
+            // instantiates `T` with `$ty` and `R` with `$repr`, and establishes
+            // `$repr: $trait`. The supported traits - `TryFromBytes`,
+            // `FromZeros`, `FromBytes`, and `IntoBytes` - are defined only in
+            // terms of bit validity, so these premises are sufficient when
+            // `$ty` and `$repr` have the same size.
+            //
+            // FIXME(#3691): This macro does not establish that `$ty` and
+            // `$repr` have the same size. Without that premise, `TransmuteFrom`
+            // conveys no safety guarantee, so these bounds do not make
+            // arbitrary invocations of this macro sound.
             unsafe impl<$($tyvar $(: $(? $optbound +)* $($bound +)*)?)?> $trait for $ty {
                 #[allow(dead_code, clippy::missing_inline_in_public_items)]
                 #[cfg_attr(all(coverage_nightly, __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS), coverage(off))]
                 fn only_derive_is_allowed_to_implement_this_trait() {
-                    use crate::pointer::{*, invariant::Valid};
+                    use crate::pointer::{*, invariant::Safe};
 
                     impl_for_transmute_from!(@assert_is_supported_trait $trait);
 
                     fn is_trait<T, R>()
                     where
-                        T: TransmuteFrom<R, Valid, Valid> + ?Sized,
-                        R: TransmuteFrom<T, Valid, Valid> + ?Sized,
+                        T: TransmuteFrom<R, Safe, Safe> + ?Sized,
+                        R: TransmuteFrom<T, Safe, Safe> + ?Sized,
                         R: $trait,
                     {
                     }
@@ -212,7 +217,7 @@ fn f<$($tyvar $(: $(? $optbound +)* $($bound +)*)?)?>() {
                 }
 
                 impl_for_transmute_from!(
-                    @is_bit_valid
+                    @is_safe
                     $(<$tyvar $(: $(? $optbound +)* $($bound +)*)?>)?
                     $trait for $ty [$repr]
                 );
@@ -224,27 +229,27 @@ fn f<$($tyvar $(: $(? $optbound +)* $($bound +)*)?)?>() {
     (@assert_is_supported_trait FromBytes) => {};
     (@assert_is_supported_trait IntoBytes) => {};
     (
-        @is_bit_valid
+        @is_safe
         $(<$tyvar:ident $(: $(? $optbound:ident $(+)?)* $($bound:ident $(+)?)* )?>)?
         TryFromBytes for $ty:ty [$repr:ty]
     ) => {
         #[inline(always)]
-        fn is_bit_valid<Alignment>(candidate: $crate::Maybe<'_, Self, Alignment>) -> bool
+        fn is_safe<Alignment>(candidate: $crate::Maybe<'_, Self, Alignment>) -> bool
         where
             Alignment: $crate::invariant::Alignment,
         {
             // SAFETY: This macro ensures that `$repr` and `Self` have the same
             // size and bit validity. Thus, a bit-valid instance of `$repr` is
             // also a bit-valid instance of `Self`.
-            <$repr as TryFromBytes>::is_bit_valid(candidate.transmute::<_, _, BecauseImmutable>())
+            <$repr as TryFromBytes>::is_safe(candidate.transmute::<_, _, BecauseImmutable>())
         }
     };
     (
-        @is_bit_valid
+        @is_safe
         $(<$tyvar:ident $(: $(? $optbound:ident $(+)?)* $($bound:ident $(+)?)* )?>)?
         $trait:ident for $ty:ty [$repr:ty]
     ) => {
-        // Trait other than `TryFromBytes`; no `is_bit_valid` impl.
+        // Trait other than `TryFromBytes`; no `is_safe` impl.
     };
 }
 
@@ -269,33 +274,33 @@ fn is_bit_valid<Alignment>(candidate: $crate::Maybe<'_, Self, Alignment>) -> boo
 macro_rules! unsafe_impl_for_power_set {
     (
         $first:ident $(, $rest:ident)* $(-> $ret:ident)? => $trait:ident for $macro:ident!(...)
-        $(; |$candidate:ident| $is_bit_valid:expr)?
+        $(; |$candidate:ident| $is_safe:expr)?
     ) => {
         unsafe_impl_for_power_set!(
             $($rest),* $(-> $ret)? => $trait for $macro!(...)
-            $(; |$candidate| $is_bit_valid)?
+            $(; |$candidate| $is_safe)?
         );
         unsafe_impl_for_power_set!(
             @impl $first $(, $rest)* $(-> $ret)? => $trait for $macro!(...)
-            $(; |$candidate| $is_bit_valid)?
+            $(; |$candidate| $is_safe)?
         );
     };
     (
         $(-> $ret:ident)? => $trait:ident for $macro:ident!(...)
-        $(; |$candidate:ident| $is_bit_valid:expr)?
+        $(; |$candidate:ident| $is_safe:expr)?
     ) => {
         unsafe_impl_for_power_set!(
             @impl $(-> $ret)? => $trait for $macro!(...)
-            $(; |$candidate| $is_bit_valid)?
+            $(; |$candidate| $is_safe)?
         );
     };
     (
         @impl $($vars:ident),* $(-> $ret:ident)? => $trait:ident for $macro:ident!(...)
-        $(; |$candidate:ident| $is_bit_valid:expr)?
+        $(; |$candidate:ident| $is_safe:expr)?
     ) => {
         unsafe_impl!(
             $($vars,)* $($ret)? => $trait for $macro!($($vars),* $(-> $ret)?)
-            $(; |$candidate| $is_bit_valid)?
+            $(; |$candidate| $is_safe)?
         );
     };
 }
@@ -355,8 +360,8 @@ macro_rules! opt_unsafe_fn {
 /// impl in this case, and also provides useful documentation for readers of the
 /// code.
 ///
-/// Finally, if a `TryFromBytes::is_bit_valid` impl is provided, it must adhere
-/// to the safety preconditions of [`unsafe_impl!`].
+/// Finally, if a `TryFromBytes::is_safe` impl is provided, it must adhere to the
+/// safety preconditions of [`unsafe_impl!`].
 ///
 /// ## Example
 ///
@@ -396,11 +401,11 @@ impl<const $constname: $constty, $($tyvar $(: $(? $optbound +)* $($bound +)*)?),
     };
     (
         $($tyvar:ident $(: $(? $optbound:ident $(+)?)* $($bound:ident $(+)?)* )?),*
-        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_bit_valid:expr)?
+        => $trait:ident for $ty:ty $(; |$candidate:ident| $is_safe:expr)?
     ) => {
         impl_or_verify!(@impl { unsafe_impl!(
             $($tyvar $(: $(? $optbound +)* $($bound +)*)?),* => $trait for $ty
-            $(; |$candidate| $is_bit_valid)?
+            $(; |$candidate| $is_safe)?
         ); });
         impl_or_verify!(@verify $trait, {
             impl<$($tyvar $(: $(? $optbound +)* $($bound +)*)?),*> Subtrait for $ty {}
@@ -495,7 +500,7 @@ macro_rules! unsafe_impl_known_layout {
         #[allow(non_local_definitions)]
         // SAFETY: The caller promises that this is sound.
         unsafe impl<$($tyvar: ?Sized + KnownLayout)?> KnownLayout for $ty {
-            #[allow(clippy::missing_inline_in_public_items, dead_code)]
+            #[allow(dead_code, clippy::missing_inline_in_public_items)]
             #[cfg_attr(all(coverage_nightly, __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS), coverage(off))]
             fn only_derive_is_allowed_to_implement_this_trait() {}
 
@@ -742,14 +747,14 @@ macro_rules! unsafe_impl_for_transparent_wrapper {
     ($vis:vis T $(: ?$optbound:ident)? => $wrapper:ident<T>) => {{
         crate::util::macros::__unsafe();
 
-        use crate::pointer::{TransmuteFrom, cast::{CastExact, TransitiveProject}, SizeEq, invariant::Valid};
+        use crate::pointer::{TransmuteFrom, cast::{CastExact, TransitiveProject}, SizeEq, invariant::Safe};
         use crate::wrappers::ReadOnly;
 
         // SAFETY: The caller promises that `T` and `$wrapper<T>` have the same
         // bit validity.
-        unsafe impl<T $(: ?$optbound)?> TransmuteFrom<T, Valid, Valid> for $wrapper<T> {}
+        unsafe impl<T $(: ?$optbound)?> TransmuteFrom<T, Safe, Safe> for $wrapper<T> {}
         // SAFETY: See previous safety comment.
-        unsafe impl<T $(: ?$optbound)?> TransmuteFrom<$wrapper<T>, Valid, Valid> for T {}
+        unsafe impl<T $(: ?$optbound)?> TransmuteFrom<$wrapper<T>, Safe, Safe> for T {}
         // SAFETY: The caller promises that a `T` to `$wrapper<T>` cast is
         // size-preserving.
         define_cast!(unsafe { $vis CastToWrapper<T $(: ?$optbound)? > = T => $wrapper<T> });
@@ -805,7 +810,7 @@ impl<T $(: ?$optbound)?> SizeEq<ReadOnly<$wrapper<T>>> for ReadOnly<T> {
 macro_rules! impl_transitive_transmute_from {
     ($($tyvar:ident $(: ?$optbound:ident)?)? => $t:ty => $u:ty => $v:ty) => {
         const _: () = {
-            use crate::pointer::{TransmuteFrom, SizeEq, invariant::Valid};
+            use crate::pointer::{TransmuteFrom, SizeEq, invariant::Safe};
 
             impl<$($tyvar $(: ?$optbound)?)?> SizeEq<$t> for $v
             where
@@ -819,14 +824,14 @@ impl<$($tyvar $(: ?$optbound)?)?> SizeEq<$t> for $v
                 >;
             }
 
-            // SAFETY: Since `$u: TransmuteFrom<$t, Valid, Valid>`, it is sound
-            // to transmute a bit-valid `$t` to a bit-valid `$u`. Since `$v:
-            // TransmuteFrom<$u, Valid, Valid>`, it is sound to transmute that
+            // SAFETY: Since `$u: TransmuteFrom<$t, Safe, Safe>`, it is sound to
+            // transmute a bit-valid `$t` to a bit-valid `$u`. Since `$v:
+            // TransmuteFrom<$u, Safe, Safe>`, it is sound to transmute that
             // bit-valid `$u` to a bit-valid `$v`.
-            unsafe impl<$($tyvar $(: ?$optbound)?)?> TransmuteFrom<$t, Valid, Valid> for $v
+            unsafe impl<$($tyvar $(: ?$optbound)?)?> TransmuteFrom<$t, Safe, Safe> for $v
             where
-                $u: TransmuteFrom<$t, Valid, Valid>,
-                $v: TransmuteFrom<$u, Valid, Valid>,
+                $u: TransmuteFrom<$t, Safe, Safe>,
+                $v: TransmuteFrom<$u, Safe, Safe>,
             {}
         };
     };
diff --git a/rust/zerocopy/src/util/mod.rs b/rust/zerocopy/src/util/mod.rs
index 02fd4ed62741..646f45739802 100644
--- a/rust/zerocopy/src/util/mod.rs
+++ b/rust/zerocopy/src/util/mod.rs
@@ -23,7 +23,7 @@
 
 use super::*;
 use crate::pointer::{
-    invariant::{Exclusive, Shared, Valid},
+    invariant::{Exclusive, Safe, Shared},
     SizeEq, TransmuteFromPtr,
 };
 
@@ -108,7 +108,7 @@ fn addr(self) -> usize {
         #[allow(clippy::as_conversions)]
         #[cfg_attr(
             __ZEROCOPY_INTERNAL_USE_ONLY_NIGHTLY_FEATURES_IN_TESTS,
-            allow(lossy_provenance_casts)
+            allow(implicit_provenance_casts)
         )]
         return self.cast::<()>() as usize;
     }
@@ -144,9 +144,10 @@ pub(crate) fn validate_aligned_to<T: AsAddress, U>(t: T) -> Result<(), Alignment
 /// on the answer it gives if this is not the case.
 #[cfg_attr(
     kani,
-    kani::requires(len <= DstLayout::MAX_SIZE),
     kani::requires(align.is_power_of_two()),
-    kani::ensures(|&p| (len + p) % align.get() == 0),
+    // A power-of-two alignment divides the `usize` modulus, so wrapping
+    // preserves congruence even when the next aligned value exceeds `usize`.
+    kani::ensures(|&p| len.wrapping_add(p) % align.get() == 0),
     // Ensures that we add the minimum required padding.
     kani::ensures(|&p| p < align.get()),
 )]
@@ -340,7 +341,7 @@ pub(crate) unsafe fn transmute_ref<Src, Dst, R>(src: &Src) -> &Dst
 where
     Src: ?Sized,
     Dst: SizeEq<Src>
-        + TransmuteFromPtr<Src, Shared, Valid, Valid, <Dst as SizeEq<Src>>::CastFrom, R>
+        + TransmuteFromPtr<Src, Shared, Safe, Safe, <Dst as SizeEq<Src>>::CastFrom, R>
         + ?Sized,
 {
     let dst = Ptr::from_ref(src).transmute();
@@ -357,7 +358,7 @@ pub(crate) unsafe fn transmute_mut<Src, Dst, R>(src: &mut Src) -> &mut Dst
 where
     Src: ?Sized,
     Dst: SizeEq<Src>
-        + TransmuteFromPtr<Src, Exclusive, Valid, Valid, <Dst as SizeEq<Src>>::CastFrom, R>
+        + TransmuteFromPtr<Src, Exclusive, Safe, Safe, <Dst as SizeEq<Src>>::CastFrom, R>
         + ?Sized,
 {
     let dst = Ptr::from_mut(src).transmute();
@@ -562,31 +563,6 @@ pub(crate) fn get(&self) -> T::PointerMetadata
             self.meta
         }
 
-        #[inline]
-        pub(crate) fn padding_needed_for(&self) -> usize
-        where
-            T: KnownLayout<PointerMetadata = usize>,
-        {
-            let trailing_slice_layout = crate::trailing_slice_layout::<T>();
-
-            // FIXME(#67): Remove this allow. See NumExt for more details.
-            #[allow(
-                unstable_name_collisions,
-                clippy::incompatible_msrv,
-                clippy::multiple_unsafe_ops_per_block
-            )]
-            // SAFETY: By invariant on `self`, a `&T` with metadata `self.meta`
-            // describes an object of size `<= isize::MAX`. This computes the
-            // size of such a `&T` without any trailing padding, and so neither
-            // the multiplication nor the addition will overflow.
-            let unpadded_size = unsafe {
-                let trailing_size = self.meta.unchecked_mul(trailing_slice_layout.elem_size);
-                trailing_size.unchecked_add(trailing_slice_layout.offset)
-            };
-
-            util::padding_needed_for(unpadded_size, T::LAYOUT.align)
-        }
-
         #[inline(always)]
         pub(crate) fn validate_cast_and_convert_metadata(
             addr: usize,
@@ -895,6 +871,8 @@ mod tests {
 
     #[test]
     fn test_round_down_to_next_multiple_of_alignment() {
+        // Division by `NonZeroUsize` unsupported on our MSRV.
+        #[allow(clippy::needless_nonzero_get)]
         fn alt_impl(n: usize, align: NonZeroUsize) -> usize {
             let mul = n / align.get();
             mul * align.get()
diff --git a/rust/zerocopy/src/wrappers.rs b/rust/zerocopy/src/wrappers.rs
index 1a8cf2b41d55..d0baa901f10c 100644
--- a/rust/zerocopy/src/wrappers.rs
+++ b/rust/zerocopy/src/wrappers.rs
@@ -8,10 +8,10 @@
 // This file may not be copied, modified, or distributed except according to
 // those terms.
 
-use core::{fmt, hash::Hash};
+use core::{borrow::Borrow, fmt, hash::Hash};
 
 use super::*;
-use crate::pointer::{invariant::Valid, SizeEq, TransmuteFrom};
+use crate::pointer::{invariant::Safe, SizeEq, TransmuteFrom};
 
 /// A type with no alignment requirement.
 ///
@@ -140,10 +140,10 @@
 //   Unaligned`.
 // - `Unalign<T>` has the same bit validity as `T`, and so it is `FromZeros`,
 //   `FromBytes`, or `IntoBytes` exactly when `T` is as well.
-// - `Immutable`: `Unalign<T>` has the same fields as `T`, so it permits
-//   interior mutation exactly when `T` does.
+// - `Immutable`: `Unalign<T>` has the same fields as `T`, so it permits interior
+//   mutation exactly when `T` does.
 // - `TryFromBytes`: `Unalign<T>` has the same the same bit validity as `T`, so
-//   `T::is_bit_valid` is a sound implementation of `is_bit_valid`.
+//   `T::is_safe` is a sound implementation of `is_safe`.
 //
 #[allow(clippy::multiple_unsafe_ops_per_block)]
 const _: () = unsafe {
@@ -151,7 +151,7 @@
     impl_or_verify!(T: Immutable => Immutable for Unalign<T>);
     impl_or_verify!(
         T: TryFromBytes => TryFromBytes for Unalign<T>;
-        |c| T::is_bit_valid(c.transmute::<_, _, BecauseImmutable>())
+        |c| T::is_safe(c.transmute::<_, _, BecauseImmutable>())
     );
     impl_or_verify!(T: FromZeros => FromZeros for Unalign<T>);
     impl_or_verify!(T: FromBytes => FromBytes for Unalign<T>);
@@ -613,7 +613,14 @@ mod read_only_def {
     /// Note that `&mut ReadOnly<T>` still permits mutation – the read-only
     /// property only applies to shared references.
     ///
+    /// `ReadOnly<T>` implements [`Copy`] and [`Clone`] when `T: Copy`. Cloning
+    /// copies the value without calling `T::clone`. Trait implementations that
+    /// expose or operate on a shared reference to `T` require `T: Immutable`.
+    /// Constructing a wrapper or accessing its contents through [`AsMut`]
+    /// does not require `T: Immutable`.
+    ///
     /// [`Immutable`]: crate::Immutable
+    #[derive(Copy)]
     #[repr(transparent)]
     pub struct ReadOnly<T: ?Sized> {
         // INVARIANT: `inner` is never mutated through a `&ReadOnly<T>`
@@ -665,7 +672,7 @@ pub(crate) fn as_mut(r: &mut ReadOnly<T>) -> &mut T {
 // SAFETY:
 // - `ReadOnly<T>` has the same alignment as `T`, and so it is `Unaligned`
 //   exactly when `T` is as well.
-// - `ReadOnly<T>` has the same bit validity as `T`, and so this `is_bit_valid`
+// - `ReadOnly<T>` has the same bit validity as `T`, and so this `is_safe`
 //   implementation is correct, and thus the `TryFromBytes` impl is sound.
 // - `ReadOnly<T>` has the same bit validity as `T`, and so it is `FromZeros`,
 //   `FromBytes`, and `IntoBytes` exactly when `T` is as well.
@@ -673,7 +680,7 @@ pub(crate) fn as_mut(r: &mut ReadOnly<T>) -> &mut T {
     unsafe_impl!(T: ?Sized + Unaligned => Unaligned for ReadOnly<T>);
     unsafe_impl!(
         T: ?Sized + TryFromBytes => TryFromBytes for ReadOnly<T>;
-        |c| T::is_bit_valid(c.cast::<_, <ReadOnly<T> as SizeEq<ReadOnly<ReadOnly<T>>>>::CastFrom, _>())
+        |c| T::is_safe(c.cast::<_, <ReadOnly<T> as SizeEq<ReadOnly<ReadOnly<T>>>>::CastFrom, _>())
     );
     unsafe_impl!(T: ?Sized + FromZeros => FromZeros for ReadOnly<T>);
     unsafe_impl!(T: ?Sized + FromBytes => FromBytes for ReadOnly<T>);
@@ -709,11 +716,34 @@ impl<T: ?Sized> SizeEq<T> for ReadOnly<T> {
 
 // SAFETY: `ReadOnly<T>` is a `#[repr(transparent)]` wrapper around `T`, and so
 // it has the same bit validity as `T`.
-unsafe impl<T: ?Sized> TransmuteFrom<T, Valid, Valid> for ReadOnly<T> {}
+unsafe impl<T: ?Sized> TransmuteFrom<T, Safe, Safe> for ReadOnly<T> {}
 
 // SAFETY: `ReadOnly<T>` is a `#[repr(transparent)]` wrapper around `T`, and so
 // it has the same bit validity as `T`.
-unsafe impl<T: ?Sized> TransmuteFrom<ReadOnly<T>, Valid, Valid> for T {}
+unsafe impl<T: ?Sized> TransmuteFrom<ReadOnly<T>, Safe, Safe> for T {}
+
+impl<T: Default> Default for ReadOnly<T> {
+    #[inline(always)]
+    fn default() -> Self {
+        Self::new(Default::default())
+    }
+}
+
+// Copying avoids calling `T::clone`, which could mutate through a shared
+// reference to `T` and violate `ReadOnly`'s invariant.
+impl<T: Copy> Clone for ReadOnly<T> {
+    #[inline(always)]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T> From<T> for ReadOnly<T> {
+    #[inline(always)]
+    fn from(t: T) -> Self {
+        Self::new(t)
+    }
+}
 
 impl<'a, T: ?Sized + Immutable> From<&'a T> for &'a ReadOnly<T> {
     #[inline(always)]
@@ -743,15 +773,74 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
-impl<T: ?Sized + Immutable + Debug> Debug for ReadOnly<T> {
+impl<T: ?Sized + Immutable> AsRef<T> for ReadOnly<T> {
     #[inline(always)]
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
-        self.deref().fmt(f)
+    fn as_ref(&self) -> &T {
+        self.deref()
+    }
+}
+
+impl<T: ?Sized + Immutable> Borrow<T> for ReadOnly<T> {
+    #[inline(always)]
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+impl<T: ?Sized> AsMut<T> for ReadOnly<T> {
+    #[inline(always)]
+    fn as_mut(&mut self) -> &mut T {
+        ReadOnly::as_mut(self)
+    }
+}
+
+// Delegate shared access through `Deref`, which requires `T: Immutable` and
+// thus prevents interior mutation of the wrapped value by these trait methods.
+impl<T: ?Sized + Immutable + PartialEq> PartialEq for ReadOnly<T> {
+    #[inline(always)]
+    fn eq(&self, other: &Self) -> bool {
+        self.deref().eq(other.deref())
+    }
+}
+
+impl<T: ?Sized + Immutable + Eq> Eq for ReadOnly<T> {}
+
+impl<T: ?Sized + Immutable + PartialOrd> PartialOrd for ReadOnly<T> {
+    #[inline(always)]
+    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
+        self.deref().partial_cmp(other.deref())
     }
 }
 
+impl<T: ?Sized + Immutable + Ord> Ord for ReadOnly<T> {
+    #[inline(always)]
+    fn cmp(&self, other: &Self) -> Ordering {
+        self.deref().cmp(other.deref())
+    }
+}
+
+impl<T: ?Sized + Immutable + Hash> Hash for ReadOnly<T> {
+    #[inline(always)]
+    fn hash<H: Hasher>(&self, state: &mut H) {
+        self.deref().hash(state);
+    }
+}
+
+macro_rules! impl_read_only_fmt {
+    ($($trait:ident),* $(,)?) => {$(
+        impl<T: ?Sized + Immutable + fmt::$trait> fmt::$trait for ReadOnly<T> {
+            #[inline(always)]
+            fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+                fmt::$trait::fmt(self.deref(), f)
+            }
+        }
+    )*};
+}
+
+impl_read_only_fmt!(Debug, Display, Binary, Octal, LowerHex, UpperHex, LowerExp, UpperExp);
+
 // SAFETY: See safety comment on `ProjectToTag`.
-unsafe impl<T: HasTag + ?Sized> HasTag for ReadOnly<T> {
+unsafe impl<T: HasTag<Client> + ?Sized, Client> HasTag<Client> for ReadOnly<T> {
     #[allow(clippy::missing_inline_in_public_items)]
     fn only_derive_is_allowed_to_implement_this_trait()
     where
@@ -759,30 +848,33 @@ fn only_derive_is_allowed_to_implement_this_trait()
     {
     }
 
-    type Tag = T::Tag;
+    type Tag = <T as HasTag<Client>>::Tag;
 
     // SAFETY: `<T as SizeEq<ReadOnly<T>>>::CastFrom` is a no-op projection that
-    // produces a pointer with the same referent. By invariant, for any `Ptr<'_,
-    // T, I>` it is sound to use `T::ProjectToTag` to project to a `Ptr<'_,
-    // T::Tag, I>`. Since `ReadOnly<T>` has the same layout and validity as `T`,
-    // the same is true of projecting from a `Ptr<'_, ReadOnly<T>, I>`.
+    // produces a pointer with the same referent. By invariant, for any
+    // `Ptr<'_, T, I>` it is sound to use
+    // `<T as HasTag<Client>>::ProjectToTag` to project to a
+    // shared `Ptr<'_, <T as HasTag<Client>>::Tag,
+    // (_, I::Alignment, I::Validity)>`. Since `ReadOnly<T>` has the same
+    // layout and validity as `T`, the same is true of projecting from a
+    // `Ptr<'_, ReadOnly<T>, I>`.
     type ProjectToTag = crate::pointer::cast::TransitiveProject<
         T,
         <T as SizeEq<ReadOnly<T>>>::CastFrom,
-        T::ProjectToTag,
+        <T as HasTag<Client>>::ProjectToTag,
     >;
 }
 
 // SAFETY: `ReadOnly<T>` is a `#[repr(transparent)]` wrapper around `T`, and so
 // has the same fields at the same offsets. Thus, it satisfies the safety
-// invariants of `HasField<Field, VARIANT_ID, FIELD_ID>` for field `f` exactly
-// when `T` does, as guaranteed by the `T: HasField` bound:
-// - If `VARIANT_ID` is `STRUCT_VARIANT_ID` or `UNION_VARIANT_ID`, then `T` has
-//   the layout of a struct or union type. Since `ReadOnly<T>` is a transparent
-//   wrapper around `T`, it does too. Otherwise, if `VARIANT_ID` is an enum
-//   variant index, then `T` has the layout of an enum type, and `ReadOnly<T>`
-//   does too.
-// - By `T: HasField<_, _, FIELD_ID>`:
+// invariants of `HasField<Client, Field, VARIANT_ID, FIELD_ID>` for field `f`
+// exactly when `T` does, as guaranteed by the `T: HasField` bound:
+// - If `VARIANT_ID` is `STRUCT_VARIANT_ID`, `UNION_VARIANT_ID`, or
+//   `REPR_C_UNION_VARIANT_ID`, then `T` has the layout of a struct, non-C union,
+//   or C union type respectively. Since `ReadOnly<T>` is a transparent wrapper
+//   around `T`, it does too. Otherwise, `VARIANT_ID` is the identifier ID of an
+//   enum variant; `T` has the layout of an enum type, and `ReadOnly<T>` does too.
+// - By `T: HasField<_, _, _, FIELD_ID>`:
 //   - `T` has a field `f` with name `n` such that
 //     `FIELD_ID = zerocopy::ident_id!(n)` or at index `i` such that
 //     `FIELD_ID = zerocopy::ident_id!(i)`.
@@ -794,10 +886,10 @@ fn only_derive_is_allowed_to_implement_this_trait()
 // refers to a non-strict subset of the bytes of `slf`'s referent, and has the
 // same provenance as `slf` – because all intermediate operations satisfy those
 // same conditions.
-unsafe impl<T, Field, const VARIANT_ID: i128, const FIELD_ID: i128>
-    HasField<Field, VARIANT_ID, FIELD_ID> for ReadOnly<T>
+unsafe impl<T, Client, Field, const VARIANT_ID: i128, const FIELD_ID: i128>
+    HasField<Client, Field, VARIANT_ID, FIELD_ID> for ReadOnly<T>
 where
-    T: HasField<Field, VARIANT_ID, FIELD_ID> + ?Sized,
+    T: HasField<Client, Field, VARIANT_ID, FIELD_ID> + ?Sized,
 {
     #[allow(clippy::missing_inline_in_public_items)]
     fn only_derive_is_allowed_to_implement_this_trait()
@@ -811,7 +903,7 @@ fn only_derive_is_allowed_to_implement_this_trait()
     #[inline(always)]
     fn project(slf: PtrInner<'_, Self>) -> *mut ReadOnly<T::Type> {
         slf.project::<_, <T as SizeEq<ReadOnly<T>>>::CastFrom>()
-            .project::<_, crate::pointer::cast::Projection<Field, VARIANT_ID, FIELD_ID>>()
+            .project::<_, crate::pointer::cast::Projection<Client, Field, VARIANT_ID, FIELD_ID>>()
             .project::<_, <ReadOnly<T::Type> as SizeEq<T::Type>>::CastFrom>()
             .as_non_null()
             .as_ptr()
@@ -822,10 +914,10 @@ fn project(slf: PtrInner<'_, Self>) -> *mut ReadOnly<T::Type> {
 // has the same fields at the same offsets. `is_projectable` simply delegates to
 // `T::is_projectable`, which is sound because a `Ptr<'_, ReadOnly<T>, I>` will
 // be projectable exactly when a `Ptr<'_, T, I>` referent is.
-unsafe impl<T, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128>
-    ProjectField<Field, I, VARIANT_ID, FIELD_ID> for ReadOnly<T>
+unsafe impl<T, Client, Field, I, const VARIANT_ID: i128, const FIELD_ID: i128>
+    ProjectField<Client, Field, I, VARIANT_ID, FIELD_ID> for ReadOnly<T>
 where
-    T: ProjectField<Field, I, VARIANT_ID, FIELD_ID> + ?Sized,
+    T: ProjectField<Client, Field, I, VARIANT_ID, FIELD_ID> + ?Sized,
     I: invariant::Invariants,
 {
     #[allow(clippy::missing_inline_in_public_items)]
@@ -835,13 +927,15 @@ fn only_derive_is_allowed_to_implement_this_trait()
     {
     }
 
-    type Invariants = T::Invariants;
+    type Invariants = <T as ProjectField<Client, Field, I, VARIANT_ID, FIELD_ID>>::Invariants;
 
-    type Error = T::Error;
+    type Error = <T as ProjectField<Client, Field, I, VARIANT_ID, FIELD_ID>>::Error;
 
     #[inline(always)]
-    fn is_projectable<'a>(ptr: Ptr<'a, Self::Tag, I>) -> Result<(), Self::Error> {
-        T::is_projectable(ptr)
+    fn is_projectable<'a>(
+        ptr: Ptr<'a, <Self as HasTag<Client>>::Tag, (invariant::Shared, I::Alignment, I::Validity)>,
+    ) -> Result<(), Self::Error> {
+        <T as ProjectField<Client, Field, I, VARIANT_ID, FIELD_ID>>::is_projectable(ptr)
     }
 }
 
@@ -852,6 +946,96 @@ mod tests {
     use super::*;
     use crate::util::testutil::*;
 
+    #[test]
+    #[allow(clippy::clone_on_copy, clippy::non_canonical_clone_impl)]
+    fn test_read_only_copy_clone() {
+        // This type deliberately does not implement `Immutable`. Copying the
+        // wrapper must not require it or invoke the inner `Clone` impl.
+        #[derive(Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
+        struct PanickingClone(u16);
+
+        impl Clone for PanickingClone {
+            fn clone(&self) -> Self {
+                panic!("ReadOnly must not call the inner Clone implementation")
+            }
+        }
+
+        static_assertions::assert_not_impl_any!(
+            ReadOnly<PanickingClone>: Debug, PartialEq, Eq, PartialOrd, Ord,
+            Hash, AsRef<PanickingClone>, Borrow<PanickingClone>
+        );
+        static_assertions::assert_not_impl_any!(
+            ReadOnly<Cell<u8>>: Copy, Clone, Deref, AsRef<Cell<u8>>, Borrow<Cell<u8>>
+        );
+
+        let value = ReadOnly::new(PanickingClone(42));
+        let copy = value;
+        let clone = value.clone();
+        assert_eq!(ReadOnly::into_inner(copy).0, 42);
+        assert_eq!(ReadOnly::into_inner(clone).0, 42);
+    }
+
+    #[test]
+    fn test_read_only_mutable_access() {
+        // Construction and exclusive access also support interior mutability.
+        let mut value = ReadOnly::<Cell<u8>>::default();
+        let inner: &mut Cell<u8> = value.as_mut();
+        inner.set(42);
+        assert_eq!(ReadOnly::into_inner(value).get(), 42);
+
+        let value = ReadOnly::from(Cell::new(7));
+        assert_eq!(ReadOnly::into_inner(value).get(), 7);
+    }
+
+    #[test]
+    fn test_read_only_borrowed_lookup() {
+        // Borrowed lookups require equality, hashing, and ordering to agree
+        // between the wrapper and the inner value.
+        let mut hash_map = std::collections::HashMap::new();
+        hash_map.insert(ReadOnly::new(42u16), true);
+        assert_eq!(hash_map.get(&42u16), Some(&true));
+        assert_eq!(hash_map.get(&43u16), None);
+
+        let mut tree = std::collections::BTreeMap::new();
+        tree.insert(ReadOnly::new(42u16), true);
+        assert_eq!(tree.get(&42u16), Some(&true));
+        assert_eq!(tree.get(&43u16), None);
+
+        // Preserve partial orders, including incomparable values.
+        let nan = ReadOnly::new(f32::NAN);
+        assert_eq!(nan.partial_cmp(&nan), None);
+        assert_ne!(nan, nan);
+    }
+
+    #[test]
+    fn test_read_only_unsized() {
+        let bytes = [1u8, 2];
+        let value: &ReadOnly<[u8]> = (&bytes[..]).into();
+        let as_ref: &[u8] = value.as_ref();
+        let borrowed: &[u8] = value.borrow();
+        assert_eq!(as_ref, bytes);
+        assert_eq!(borrowed, bytes);
+        assert_eq!(value, value);
+        assert_eq!(value.cmp(value), Ordering::Equal);
+
+        let text: &ReadOnly<str> = "hello".into();
+        assert_eq!(format!("{:.3}", text), "hel");
+    }
+
+    #[test]
+    fn test_read_only_formatting() {
+        let value = ReadOnly::new(42u16);
+        // Check that formatting flags are forwarded as well as the value.
+        assert_eq!(format!("{:04?}", value), "0042");
+        assert_eq!(format!("{:04}", value), "0042");
+        assert_eq!(format!("{:#010b}", value), "0b00101010");
+        assert_eq!(format!("{:#06o}", value), "0o0052");
+        assert_eq!(format!("{:#06x}", value), "0x002a");
+        assert_eq!(format!("{:#06X}", value), "0x002A");
+        assert_eq!(format!("{:.2e}", value), "4.20e1");
+        assert_eq!(format!("{:.2E}", value), "4.20E1");
+    }
+
     #[test]
     fn test_unalign() {
         // Test methods that don't depend on alignment.
-- 
2.56.0

