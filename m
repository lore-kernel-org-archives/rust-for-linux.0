Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2081E0B9C;
	Sat, 27 Dec 2025 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766795024; cv=none; b=EI6zfgnD5wxQ8hHpo9lVr2gNJSC6BLkM1dhN/N2ix5XrjQEUQ6nq+RF4JyHPg2GDKvL1vXV2Ob5o8g4HhhzY7b3RDopkZhGL71WhfCfxWhD4g3ZkhCjBFergPZVRx+TdzyZ684tW+mKqkrhdDg3fw3kjAeNQgE5WVyuxro6v2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766795024; c=relaxed/simple;
	bh=ccZpi1MmL89dRfAF5l/botdzyLd0IrvrWGCx1fzc66M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=p4ShWX+vseB3Ap4CsEg+SgmxLHrchwPDK7cNAwsAdSIuUhvco7NBbM8VBYTCoiekdaVGF43B63Tc0TeIzxHtxscqf7Q836NE5wHkWDsMggLaMMeATKqjcavLs79BfMqbxENqeeKyb/xxGkZ4LeDGRF9IhEYYKz1eaCIB85IUPxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgkX9RZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgkX9RZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C148C113D0;
	Sat, 27 Dec 2025 00:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766795023;
	bh=ccZpi1MmL89dRfAF5l/botdzyLd0IrvrWGCx1fzc66M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XgkX9RZi7al2PWkYQWkXrj4UldJkUtIcGlS15gEixxJA41sFEz0qA7Z12QrCy7WCO
	 lVkTw5L3pKhujgMy/CBSE7Jdq7i254DC8hzDPJEClXwPZ8cCG1Zzf90nE9XQKX4n80
	 O66eL6puVmw+7xLBSPHAgGQxj/giN4UAwpnXLs/+okvxBjiKEQb9JFdZe16NkVFIAO
	 65MCtMyUKujnIPIVULIktIg9ktagT/wvLzYocrpvEku308i/TpDvstqKPWeN54VdWD
	 KEtLzQd3pPHw4tLU4uFQurzDH1SvksQplIhK7wGbCJ0Xaz2UsTQbQHFeq8PouRT4sg
	 BGLqMA8LSxqjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 005A63AAA6F3;
	Sat, 27 Dec 2025 00:20:28 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 6.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <DF8E7C3FALHK.3F0F9RW1IFX7V@kernel.org>
References: <DF8E7C3FALHK.3F0F9RW1IFX7V@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DF8E7C3FALHK.3F0F9RW1IFX7V@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc3
X-PR-Tracked-Commit-Id: 2b742094582db365fe07021b0a9c5405f85049f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e5e062ad84c4b700f1a6d51a548c936784f8951
Message-Id: <176679482765.2028743.12574493111587570673.pr-tracker-bot@kernel.org>
Date: Sat, 27 Dec 2025 00:20:27 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 26 Dec 2025 20:24:36 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e5e062ad84c4b700f1a6d51a548c936784f8951

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
