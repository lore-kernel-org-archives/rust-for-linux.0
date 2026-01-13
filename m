Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E880833B6DF;
	Tue, 13 Jan 2026 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338914; cv=none; b=fgfsJ6CP5eRfwwnUyqwo03mxETI3DJeckFJLBfW5aHe6HT4cnMps1XFix7/qPT222uPRVMWGsN9l5kFm8X7zaBhcl6DYODIhXaSRuanSnRFKQ+4TyD+bINdBrZ5BoQnX2j83noR2AnmpaC0qEJLe3Tx7dWGOUCiuiaPjNRXVbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338914; c=relaxed/simple;
	bh=26Ix3KhvYqFV+3mZxUKaXzEdfpWbKSZTjDuYKribexM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3uyxelOkUJRjMY/f68dgnBqa67KSxtX0ZN5aMSdLNAD6quHc4BGI9H/W1AzyAhnlprmtQoTYdpQckbQdLHk0f4Sb1O4zxljHqqFLKhh6qzk9Eoi8qDlq/HCPOlGlBJFp0Vn6fPBvlcHS56+d6JoIJ92+AMBj6mpONcr3757Dz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 45C89C1255;
	Tue, 13 Jan 2026 21:15:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 4AA846000F;
	Tue, 13 Jan 2026 21:15:04 +0000 (UTC)
Message-ID: <841bb4c27f174fb4f11aaf7bb5f070b96835b4b9.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: warn on Rust comments with rustdoc links
 above items
From: Joe Perches <joe@perches.com>
To: Ryan Foster <foster.ryan.r@gmail.com>
Cc: linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Tue, 13 Jan 2026 13:15:03 -0800
In-Reply-To: <20260113211025.637889-1-foster.ryan.r@gmail.com>
References: <bfb5bee02f2e69ce1eb8c526dd4cfb82de326226.camel@perches.com>
	 <20260113211025.637889-1-foster.ryan.r@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4AA846000F
X-Stat-Signature: 4u8ruru5gpzk3mkd5cog3sy9yjyyrg93
X-Rspamd-Server: rspamout08
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+Z+377owRE9/RZBVxDH96u9iswu4OPOXM=
X-HE-Tag: 1768338904-977345
X-HE-Meta: U2FsdGVkX1+n5AIYPXIIPS9loD8cZy/Z7QBOi94EJQHmxdFN60KhzmF83K3797jeY0k2uNaOx2uzNPu/qaD2z8A8qvboNcPh3ira+CoOlf3RuBNDDmg6+CkOkKtVwxBbaR9JNhuejFzhs91PiMJkEDDyhy7Qc8MQfQ91CRDo/npSbURh5WQsl8jS0GkeRlEbfL6s/KbWF19C8EBbn3d46b4elNSme0Ll35Mg/GONQ6QUjsx8SaEHLJHT2LbXZV/7VN+tFHUkIOYaLnBrOxj35OieghnU/0NidI4pm2GsyoYKeNDJW6+9Zl54LZMCaS6h

On Tue, 2026-01-13 at 13:10 -0800, Ryan Foster wrote:
> Add a check to emit a warning when a `//` comment containing rustdoc
> link patterns (like [`Foo`]) appears directly above a Rust item
> declaration. This likely indicates the comment should use `///`
> documentation syntax instead.

You sent a delta patch from v1 as v2.
Please send the entire patch instead.
